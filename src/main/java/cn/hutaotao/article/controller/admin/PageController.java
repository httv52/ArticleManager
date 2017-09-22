package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ht on 2017/9/21.
 */
@Controller
@RequestMapping("/admin")
public class PageController extends BaseController {
    @RequestMapping("index")
    public String index() {
        return "admin/index";
    }


    @RequestMapping("articleManege")
    public String articleManege() {
        return "admin/articleManege";
    }


}
