package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ht on 2017/9/21.
 */
@Controller
@RequestMapping("/admin")
public class PageController extends BaseController {
    @Autowired
    TagService tagService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ArticleService articleService;
    @Autowired
    FileService fileService;
    @Autowired
    LogsService logsService;

    @RequestMapping("/index")
    public String index(Model model, HttpSession session) {
        String loginUserId = getLoginUserId(session);

        List<Article> articleList = articleService.findAll(loginUserId);
        Integer articleCount = articleService.findArticleCount(loginUserId);
        Integer fileCount = fileService.findFileCount(loginUserId);
        List<Logs> logsList = logsService.findAll(loginUserId);

        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCount", articleCount);
        model.addAttribute("fileCount", fileCount);
        model.addAttribute("logsList", logsList);

        setNavNumber(model, 1, -1);
        return "admin/index";
    }


    @RequestMapping("/articleManege")
    public String articleManege(Model model) {
        setNavNumber(model, 2, 1);
        return "admin/articleManege";
    }

    @RequestMapping("/publish")
    public String publishing(Model model, HttpSession session) {
        List<Tag> tagList = tagService.findTagByUser(getLoginUser(session));
        List<Category> categoryList = categoryService.findCategoryByUser(getLoginUser(session));

        setNavNumber(model, 6, -1);
        model.addAttribute("tagList", tagList);
        model.addAttribute("categoryList", categoryList);
        return "admin/publish";
    }


    @RequestMapping("/summer")
    public String summer(Model model) {
        return "admin/summernote";
    }

    @RequestMapping("/404")
    public String Page_404() {
        return "format/404";
    }


    /*设置侧边常量*/
    private void setNavNumber(Model model, int firstCode, int secondCode) {
        model.addAttribute("firstCode", firstCode);
        model.addAttribute("secondCode", secondCode);
    }

}
