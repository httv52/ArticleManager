package cn.hutaotao.article.controller;

import cn.hutaotao.article.controller.admin.UserController;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.utils.cache.MapCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ht on 2017/9/19.
 */
public class BaseController {
    public static final Logger LOGGER = LoggerFactory.getLogger(BaseController.class);

    /*登录注册错误提示*/
    protected static final String REGIST_ERROR_MESSAGE = "注册失败,用户名已被注册";

    /*登录注册页面表示*/
    protected static final int PAGE_CODE_LOGIN = 1;  //登录界面
    protected static final int PAGE_CODE_REGISTER = 2;  //注册界面

    /*登录注册操作表示*/
    /**
     * 登录失败-密码或用户名错误
     */
    protected static final int OPERATE_CODE_LOGIN_FAULT_FIELD = 100;  //登录失败-密码或用户名错误
    /**
     * 登录失败-错误次数超过限制
     */
    protected static final int OPERATE_CODE_LOGIN_FAULT_CACHE = 110;  //登录失败-错误次数超过限制
    /**
     * 登录成功
     */
    protected static final int OPERATE_CODE_LOGIN_SUCCESS = 101;  //登录成功
    /**
     * 退出
     */
    protected static final int OPERATE_CODE_QUIT = 121;  //退出

    /**
     * 注册失败，用户名被占
     */
    protected static final int OPERATE_CODE_REGISTER_FAULT = 210;  //注册失败，用户名被占
    /**
     * 注册成功，发送邮件
     */
    protected static final int OPERATE_CODE_REGISTER_SUCCESS = 211;  //注册成功，发送邮件
    /**
     * 注册激活失败
     */
    protected static final int OPERATE_CODE_REGISTER_ACTIV_FAULT = 220;  //注册激活失败
    /**
     * 注册激活成功
     */
    protected static final int OPERATE_CODE_REGISTER_ACTIV_SUCCESS = 221;  //注册激活成功

    /**
     * 登陆错误次数的缓存
     */
    protected MapCache cache = MapCache.single();
    /**
     * 登陆错误次数
     */
    protected static final String LOGIN_ERROR_COUNT = "login_error_count";


    /**
     * 获取 session中的用户
     *
     * @param session
     * @return
     */
    public User getLoginUser(HttpSession session) {
        User loginUser = (User) session.getAttribute(User.SESSION_USER_NAME);
        if (null == loginUser) {
            throw new MyException();
        }
        return loginUser;
    }

    /**
     * 获取 session中的用户 ID
     *
     * @param session
     * @return
     */
    public String getLoginUserId(HttpSession session) {
        return getLoginUser(session).getUid();
    }

    public String show_404() {
        return "redirect:/admin/404";
    }

    /**
     * 校验错误数据集合
     */
    protected List<ObjectError> errorList = null;

    /**
     * 校验数据
     *
     * @param bindingResult
     * @param model
     * @param user
     * @param pageCode
     * @return
     */
    public boolean validatiData(BindingResult bindingResult, Model model, User user, int pageCode) {
        //校验数据
        if (bindingResult.hasErrors()) {
            errorList = bindingResult.getAllErrors();
            model.addAttribute("errorList", errorList);
            model.addAttribute("pageCode", pageCode);
            model.addAttribute("user", user);
            return true;
        }
        return false;
    }
}
