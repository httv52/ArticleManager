package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.*;
import cn.hutaotao.article.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ht on 2017/9/21.
 */
@Controller
@RequestMapping("/admin")
public class PageController extends BaseController {
    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private FileService fileService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private LogsService logsService;

    @RequestMapping("/index")
    public String index(Model model, HttpSession session) {
        String loginUserId = getLoginUserId(session);

        List<Article> articleList = articleService.findAllPublished(loginUserId);
        Integer fileCount = fileService.findFileCount(loginUserId);
        List<Comment> commentList = commentService.findCommentByUserPrimary(loginUserId);
        List<Logs> logsList = logsService.findAll(loginUserId);

        model.addAttribute("articleList", articleList);
        model.addAttribute("fileCount", fileCount);
        model.addAttribute("commentList", commentList);
        model.addAttribute("logsList", logsList);

        setNavNumber(model, 1, -1);
        return "admin/index";
    }


    @RequestMapping("/articleManege")
    public String articleManege(Model model, HttpSession session) {
        setNavNumber(model, 2, 1);
        return "forward:/article/findByState";
    }

    @RequestMapping("/publish")
    public String publishing(Model model, HttpSession session) {
        String loginUserId = getLoginUserId(session);
        List<Tag> tagList = tagService.findTagByUser(loginUserId);
        List<Category> categoryList = categoryService.findCategoryByUser(loginUserId);

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
