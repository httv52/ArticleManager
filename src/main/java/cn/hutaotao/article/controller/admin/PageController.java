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

    /**
     * 首页显示的文章数和评论数
     */
    private static final Integer LIMIT_NUMBER = 6;
    /**
     * 首页显示的日志数
     */
    private static final Integer LIMIT_LOG = 10;

    @RequestMapping("")
    public String index() {
        return "forward:/admin/index";
    }

    @RequestMapping("/index")
    public String index(Model model, HttpSession session) {
        String loginUserId = getLoginUserId(session);

        List<Article> articleList = articleService.findAllPublished(loginUserId, LIMIT_NUMBER);
        Integer articleCount = articleService.findAllPublishedCount(loginUserId);
        Integer fileCount = fileService.findFileCount(loginUserId);
        List<Comment> commentList = commentService.findCommentByUserPrimary(loginUserId, LIMIT_NUMBER);
        List<Logs> logsList = logsService.findAll(loginUserId, LIMIT_LOG);

        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCount", articleCount);
        model.addAttribute("fileCount", fileCount);
        model.addAttribute("commentList", commentList);
        model.addAttribute("logsList", logsList);

        setNavNumber(model, 1, -1, session);
        return "admin/index";
    }


    /*文章管理*/
    @RequestMapping("/articleManege")
    public String articleManege(Model model, HttpSession session) {
        setNavNumber(model, 2, 1, session);
        return "forward:/article/findByState";
    }

    /*分类-标签管理*/
    @RequestMapping("/categManege")
    public String categAndTagManege(Model model, HttpSession session) {
        setNavNumber(model, 2, 3, session);
        return "forward:/category/categManege";
    }

    /*文件管理*/
    @RequestMapping("/fileManage")
    public String fileManage(Model model, HttpSession session) {
        setNavNumber(model, 3, 1, session);
        return "forward:/file/fileManage";
    }

    /*文件上传*/
    @RequestMapping("/fileUpload")
    public String fileUpload(Model model, HttpSession session) {
        setNavNumber(model, 3, 2, session);
        return "forward:/file/fileUpload";
    }

    /*前台设置*/
    @RequestMapping("/theme")
    public String theme(Model model, HttpSession session) {
        setNavNumber(model, 4, 2, session);
        return "forward:/theme/theme";
    }

    /*后台设置*/
    @RequestMapping("/updateAdmin")
    public String updateAdmin(Model model, HttpSession session) {
        setNavNumber(model, 4, 1, session);
        return "forward:/theme/admin/theme";
    }

    @RequestMapping("/publish")
    public String publishing(Model model, HttpSession session) {
        String loginUserId = getLoginUserId(session);
        List<Tag> tagList = tagService.findTagByUser(loginUserId);
        List<Category> categoryList = categoryService.findCategoryByUser(loginUserId);

        setNavNumber(model, 6, -1, session);
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
    private void setNavNumber(Model model, int firstCode, int secondCode, HttpSession session) {
        String loginUserId = getLoginUserId(session);
        Integer articleNum = articleService.findArticleCountPublished(loginUserId);
        Integer myCountNum = commentService.findCommentWithMyself(loginUserId);

        model.addAttribute("articleNum", articleNum);
        model.addAttribute("myCountNum", myCountNum);
        model.addAttribute("firstCode", firstCode);
        model.addAttribute("secondCode", secondCode);
    }

}
