package cn.hutaotao.article.controller.frontend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ht on 2017/9/28.
 */
@Controller
public class FronendPage {

    @RequestMapping("/p/{aid}")
    public String articleContext(@PathVariable("aid") String aid) {
        return "user/a";
    }

}
