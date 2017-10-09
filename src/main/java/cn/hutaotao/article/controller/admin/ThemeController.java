package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ht on 2017/10/2.
 */
@Controller
@RequestMapping("/theme")
public class ThemeController extends BaseController {
    @Autowired
    UserService userService;

    @RequestMapping("/theme")
    public String theme(Model model) {
        return "/admin/theme";
    }
}
