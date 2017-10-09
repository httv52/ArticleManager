package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.service.UserService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.LogDataUtil;
import cn.hutaotao.article.utils.mail.Mail;
import cn.hutaotao.article.utils.mail.MailString;
import cn.hutaotao.article.utils.mail.MailUtils;
import cn.hutaotao.article.utils.validati.ValidGroupLogin;
import cn.hutaotao.article.utils.validati.ValidGroupRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

/**
 * Created by ht on 2017/9/18.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogsService logsService;

    /**
     * 去往 Login页面
     *
     * @param model
     * @return
     */
    @RequestMapping("showLogin")
    public String showLogin(Model model) {
        model.addAttribute("pageCode", PAGE_CODE_LOGIN);
        return "user/login";
    }


    /**
     * 修改后台信息
     *
     * @param model
     * @return
     */
    @RequestMapping("updateAdmin")
    public String updateAdmin(Model model) {
        return "admin/theme_admin";
    }

    /**
     * 用户登录
     * <p>
     * 注意：
     * 1.传递数据 (获取ip)
     * 2.service 逻辑判断  判断是否错误超过三次 若是，十分钟后再登录
     * 3.记录日志
     * 4.保存 session
     *
     * @param userCustom
     * @return
     */
    //TODO 待完成：记住密码，验证码
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Validated(value = {ValidGroupLogin.class}) UserCustom userCustom, BindingResult bindingResult,
                        HttpServletRequest request, HttpSession session, Model model, RedirectAttributes redirectModel) {
        //校验数据
        if (validatiData(bindingResult, model, userCustom, PAGE_CODE_LOGIN)) {
            return "user/login";
        }

        Integer error_count = cache.get(userCustom.getUsername() + "_" + LOGIN_ERROR_COUNT);


        try {
            error_count = null == error_count ? 0 : error_count;  //判断error_count是否为空


            if (null != error_count && error_count >= 3) {//错误超过三次
                model.addAttribute("pageCode", PAGE_CODE_LOGIN);
                model.addAttribute("operateCode", OPERATE_CODE_LOGIN_FAULT_CACHE);
                model.addAttribute("errorMsg", "登录失败-失败次数超过限制,请10分钟后再登陆");
                return "user/login";
            }

            User sessionUser = userService.loginByUsernameAndPwd(userCustom, request);

            //判断 loged 是否初始化，若未，则初始化并记录日志
            long currentTime = System.currentTimeMillis();
            userCustom.setUid(sessionUser.getUid());
            if (null == sessionUser.getLogged()) {
                sessionUser = userService.updateUserWithLogged(sessionUser, currentTime);
                logsService.savaLogs(userCustom, request, Logs.INIT_LOG, LogDataUtil.userInitDate(userCustom), currentTime);//记录初始化日志
                logsService.savaLogs(userCustom, request, Logs.LOGIN_LOG, LogDataUtil.userLogData(userCustom), System.currentTimeMillis());//记录日志
            } else {
                logsService.savaLogs(userCustom, request, Logs.LOGIN_LOG, LogDataUtil.userLogData(userCustom), currentTime);//记录日志
            }

            cache.set(userCustom.getUsername() + "_" + LOGIN_ERROR_COUNT, 0);//清空登陆错误缓存

            session.setAttribute(User.SESSION_USER_NAME, sessionUser);  //保存到session

        } catch (MyException e) {
            error_count += 1;
            cache.set(userCustom.getUsername() + "_" + LOGIN_ERROR_COUNT, error_count, 10);//10 * 60
            model.addAttribute("user", userCustom);
            model.addAttribute("pageCode", PAGE_CODE_LOGIN);
            model.addAttribute("operateCode", OPERATE_CODE_LOGIN_FAULT_FIELD);
            model.addAttribute("errorMsg", e.getMessage());
            e.getStackTrace();
            return "user/login";
        } catch (Exception e) {
            LOGGER.error("用户名" + userCustom.getUsername() + REGIST_ERROR_MESSAGE, e.getMessage());
            e.printStackTrace();
            return show_404();
        }

        redirectModel.addFlashAttribute("operateCode", OPERATE_CODE_LOGIN_SUCCESS);
        return "redirect:/admin/index";
    }

    /**
     * 去往 Register 页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/showRegister", method = RequestMethod.GET)
    public String showRegister(Model model) {
        model.addAttribute("pageCode", PAGE_CODE_REGISTER);
        return "user/login";
    }

    /**
     * 用户注册
     *
     * @param model
     * @param user
     * @param bindingResult
     * @return
     * @Validated用于校验，放在 pojo前
     * BindingResult用于存放错误消息，放在 @Validated 之后
     * <p>
     * 邮箱激活
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model, @Validated(value = {ValidGroupRegister.class}) User user, BindingResult bindingResult) {
        String inputPwd = user.getPassword();
        //校验数据
        if (validatiData(bindingResult, model, user, PAGE_CODE_REGISTER)) {
            return "user/login";
        }

        //设置激活码
        String activateCode = UUIDUtil.getUUID();

        try {
            user.setActivateCode(activateCode);

            userService.registerUser(user); //判断是否已被注册
        } catch (MyException e) {
            LOGGER.warn("用户名" + user.getUsername() + REGIST_ERROR_MESSAGE, e);

            model.addAttribute("user", user);
            model.addAttribute("pageCode", PAGE_CODE_REGISTER);
            model.addAttribute("operateCode", OPERATE_CODE_REGISTER_FAULT);
            model.addAttribute("errorMsg", e.getMessage());
            return "user/login";
        }

        user.setPassword(inputPwd);
        model.addAttribute("user", user);
        model.addAttribute("url", MailString.getMailURL(user, model));
        model.addAttribute("operateCode", OPERATE_CODE_REGISTER_SUCCESS);
        model.addAttribute("pageCode", PAGE_CODE_LOGIN);

        //发送邮件
        sendEmail(activateCode);

        return "user/login";
    }

    /**
     * 邮箱链接的激活
     *
     * @return
     */
    @RequestMapping("/activate/{code}")
    public String activate(@PathVariable String code, RedirectAttributes model) {
        User user = null;
        try {
            user = userService.activateUser(code);
        } catch (MyException e) {
            LOGGER.warn(code + ":激活失败 ---->" + e.getMessage(), e);
            model.addFlashAttribute("operateCode", OPERATE_CODE_REGISTER_ACTIV_FAULT);
            model.addFlashAttribute("errorMsg", e.getMessage());
            return "redirect:/user/showLogin.do";
        }
        user.setPassword("");
        model.addFlashAttribute("operateCode", OPERATE_CODE_REGISTER_ACTIV_SUCCESS);
        model.addFlashAttribute("user", user);

        return "redirect:/user/showLogin.do";
    }

    /**
     * 退出系统
     *
     * @return
     */
    @RequestMapping(value = "/quit", method = RequestMethod.GET)
    public String quit(HttpSession session, Model model) {
        session.removeAttribute(User.SESSION_USER_NAME);
        model.addAttribute("operateCode", OPERATE_CODE_QUIT);
        model.addAttribute("pageCode", PAGE_CODE_LOGIN);
        return "user/login";
    }




    /*辅助方法*/
    /*辅助方法*/
    /*辅助方法*/

    /**
     * 发邮件
     *
     * @param activateCode
     */
    private void sendEmail(String activateCode) {

        Properties pro = new Properties();
        try {
            pro.load(this.getClass().getClassLoader().getResourceAsStream("mail/email_template.properties"));
        } catch (IOException e) {
            LOGGER.error("邮件配置找不到", e);
            e.printStackTrace();
        }

        String host = pro.getProperty("host");
        String name = pro.getProperty("username");
        String pwd = pro.getProperty("password");
        Session session = MailUtils.createSession(host, name, pwd);

        String from = pro.getProperty("from");
        String to = "413193089@qq.com";
        String subject = "用户激活　|　文章管理系统";
        String content = "<div style=\"text-align: center;background-color: #2e3e4e;height:100vh;overflow:auto\">\n" +
                "    <img width=\"6%\" src=\"http://localhost:8080/article/images/logo.png\">\n" +
                "    <a href=\"http://localhost:8080/article/rest/user/activate/{0}\"\n" +
                "       style=\"text-decoration:none;color: #adbece;font-size: 20px;\n" +
                "    line-height: 50px;font-family: 'Microsoft YaHei UI'\"><h3>点击激活邮件</h3></a><br>\n" +
                "    <div style=\"color: #8e8e8e\">\n" +
                "        若邮件链接被屏蔽，请复制以下地址前往浏览器激活<br><br>http://localhost:8080/article/rest/user/activate/{0}\n" +
                "    </div>\n" +
                "</div>";
        content = MessageFormat.format(content, activateCode);//替换{0}

        Mail mail = new Mail(from, to, subject, content);

        try {
            MailUtils.send(session, mail);
        } catch (Exception e) {
            LOGGER.error("邮件发送出现异常", e);
            e.printStackTrace();
        }
    }
}
