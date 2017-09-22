package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ht on 2017/9/21.
 */
@Controller
@RequestMapping("/admin")
public class PageController extends BaseController {
    @RequestMapping("/index")
    public String index(Model model) {
        setNavNumber(model, 1, -1);
        return "admin/index";
    }


    @RequestMapping("/articleManege")
    public String articleManege(Model model) {
        setNavNumber(model, 2, 1);
        return "admin/articleManege";
    }

    @RequestMapping("/publish")
    public String publishing(Model model) {
        setNavNumber(model, 6, -1);
        return "admin/publish";
    }



    /*设置侧边常量*/
    private void setNavNumber(Model model, int firstCode, int secondCode) {
        model.addAttribute("firstCode", firstCode);
        model.addAttribute("secondCode", secondCode);
    }

}
