package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Category;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ht on 2017/9/25.
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public String publish(String myOldTag, String myNewTag, String categoryId, Article article) {
        if (StringUtils.isNotBlank(myOldTag)) {
            String[] myOldTags = myOldTag.split(",");
        }
        if (StringUtils.isNotBlank(myNewTag)) {
            String[] myNewTags = myNewTag.split(",");
        }
        System.out.println(categoryId);
        return "admin/publish";
    }

    @RequestMapping("/modify")
    public String modify() {
        return "admin/publish";
    }
}
