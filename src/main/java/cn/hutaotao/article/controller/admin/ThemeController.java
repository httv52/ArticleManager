package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Theme;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.ResultBean;
import cn.hutaotao.article.service.ThemeService;
import cn.hutaotao.article.service.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by ht on 2017/10/2.
 */
@Controller
@RequestMapping("/theme")
@Log4j
public class ThemeController extends BaseController {
    @Autowired
    UserService userService;
    @Autowired
    ThemeService themeService;

    @RequestMapping("/theme")
    public String theme(Model model, HttpSession session) {
        Theme theme = themeService.findSimpleThemeByUser(getLoginUserId(session));
        model.addAttribute("theme", theme);

        return "/admin/theme";
    }

    /**
     * 前台主题 - 基本设置
     */
    @RequestMapping(value = "/base", method = RequestMethod.POST)
    @ResponseBody
    public ResultBean<Theme> baseTheme(String logoImg, String autherName, String describe, String keyword, HttpSession session) {
        //打印日志
        log.info("前台主题 基本设置");
        Theme theme = themeService.updateBaseAdminTheme(logoImg, autherName, describe, keyword, getLoginUserId(session));
        return new ResultBean<>(theme);
    }

    /**
     * 前台主题 - 连接设置
     */
    @RequestMapping(value = "/link", method = RequestMethod.POST)
    @ResponseBody
    public ResultBean<Theme> linkTheme(String homePage, String accountWeibo, String accountZhihu, String accountGithub, HttpSession session) {
        //打印日志
        log.info("前台主题 基本设置");
        Theme theme = themeService.updateLinkAdminTheme(homePage, accountWeibo, accountZhihu, accountGithub, getLoginUserId(session));
        return new ResultBean<>(theme);
    }

    /**
     * 后台主题
     *
     * @return
     */
    @RequestMapping("/admin/theme")
    public String themeAdmin(Model model, HttpSession session) {
        User user = userService.findUserById(getLoginUserId(session));
        model.addAttribute("user", user);

        return "admin/theme_admin";
    }

    /**
     * 后台主题
     *
     * @return
     */
    @RequestMapping("/admin/info")
    @ResponseBody
    public ResultBean<User> updateAdmin(String screenName, String email, Model model, HttpSession session) {
        //打印日志
        log.info("后台设置 修改");
        User user = userService.updateUserInfo(screenName, email, getLoginUserId(session));
        //更新 session
        session.setAttribute(User.SESSION_USER_NAME, user);
        return new ResultBean<>();
    }

}
