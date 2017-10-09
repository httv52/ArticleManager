package cn.hutaotao.article.controller.frontend;

import cn.hutaotao.article.model.*;
import cn.hutaotao.article.model.custom.PageBean;
import cn.hutaotao.article.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ht on 2017/9/28.
 */
@Controller
public class FronendPage {
    @Autowired
    UserService userService;
    @Autowired
    ArticleService articleService;
    @Autowired
    TagService tagService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ThemeService themeService;
    @Autowired
    CommentService commentService;
    /**
     * 首页显示的文章数和评论数
     */
    private static final Integer LIMIT_NUMBER = 6;


    @RequestMapping("/p/{aid}")
    public String articleContext(@PathVariable("aid") String aid, Model model) {
        Article article = articleService.findArticleById(aid);
        String uid = article.getUser().getUid();

        Theme theme = themeService.findSimpleThemeByUser(uid);
        model.addAttribute("theme", theme);

        model.addAttribute("article", article);
        return "front/article";
    }

    @RequestMapping("/categ/{uid}/{cid}")
    public String findByCategory(@PathVariable("cid") String cid, @PathVariable("uid") String uid) {
        System.out.println(cid + uid);
        return "user/login";
    }

    @RequestMapping("/index/{username}")
    public String a(Model model, @PathVariable("username") String username, HttpServletRequest request) {
        User user = userService.findUserByUsername(username);

        String loginUserId = user.getUid();
        String state = String.valueOf(Article.ARTICLE_STATE_PUBLISH);

        Integer totalCount = articleService.findArticleCount(loginUserId, state, null, null);
        String pageNowStr = request.getParameter("pageNow");
        Integer pageNow = null == pageNowStr ? 1 : Integer.parseInt(pageNowStr);

        String pageSizeStr = request.getParameter("pageSize");
        Integer pageSize = null == pageSizeStr ? 9 : Integer.parseInt(pageSizeStr);

        PageBean pageBean = new PageBean(totalCount, pageNow, pageSize);

        List<Category> categoryList = categoryService.findCategoryWithArticle(loginUserId);
        List<Tag> tagList = tagService.findTagWithArticle(loginUserId);
        Theme theme = themeService.findSimpleThemeByUser(loginUserId);
        List<Article> articleList = articleService.findArticleAll(loginUserId, pageBean.getStartPos(), pageSize, state, null, null);

        List<Article> newArticleList = articleService.findAllPublished(loginUserId, LIMIT_NUMBER);
        List<Comment> newCommentList = commentService.findCommentByUserPrimary(loginUserId, LIMIT_NUMBER);


        model.addAttribute("categoryList", categoryList);
        model.addAttribute("tagList", tagList);
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("user", user);
        model.addAttribute("theme", theme);
        model.addAttribute("newArticleList", newArticleList);
        model.addAttribute("newCommentList", newCommentList);

        return "front/index";
//        return "format/front/foot";
    }

}
