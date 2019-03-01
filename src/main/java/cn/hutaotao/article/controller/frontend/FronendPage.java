package cn.hutaotao.article.controller.frontend;

import cn.hutaotao.article.model.*;
import cn.hutaotao.article.model.custom.NameValue;
import cn.hutaotao.article.model.custom.PageBean;
import cn.hutaotao.article.model.custom.ResultBean;
import cn.hutaotao.article.service.*;
import cn.hutaotao.article.utils.article.ArticleUtil;
import cn.hutaotao.article.utils.article.WordUtil;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.DataUtils;
import cn.hutaotao.article.utils.other.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by ht on 2017/9/28.
 */
@Controller
public class FronendPage {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private AccessArticleService accessArticleService;
    /**
     * 首页显示的文章数和评论数
     */
    private static final Integer LIMIT_NUMBER = 6;

    @RequestMapping("/home")
    public String home() {
        return "/front/home";
    }

    @RequestMapping("/guide")
    public String guide() {
        return "/front/guide";
    }

    @RequestMapping("/p/{aid}")
    public String articleContext(@PathVariable("aid") String aid, Model model, HttpServletRequest request) {
        Article article = articleService.findArticleById(aid);
        article.setViews(article.getViews() + 1);
        String uid = article.getUser().getUid();

        String value = ArticleUtil.htmlToText(article.getContent(), ArticleUtil.VIEW_TYPE_NO_LEN);
        List keywords = WordUtil.getKeyWords(value, WordUtil.DEFAULT_KEY_WOLD_LENGTH);

        Theme theme = themeService.findSimpleThemeByUser(uid);
        model.addAttribute("theme", theme);

        Integer articleNumber = articleService.findArticleCountPublished(uid);
        Integer commonnNumber = commentService.findCommentWithMyself(uid);

        List<Article> newArticleList = articleService.findAllPublished(uid, LIMIT_NUMBER);
        List<Comment> newCommentList = commentService.findCommentByUserPrimary(uid, LIMIT_NUMBER);

        List<Comment> commentList = commentService.findCommentWithChild(aid, LIMIT_NUMBER);

        model.addAttribute("article", article);
        model.addAttribute("keywords", keywords);
        model.addAttribute("articleNumber", articleNumber);
        model.addAttribute("commonnNumber", commonnNumber);
        model.addAttribute("user", article.getUser());

        model.addAttribute("newArticleList", newArticleList);
        model.addAttribute("newCommentList", newCommentList);

        model.addAttribute("commentList", commentList);

        /*访问量 +1*/
        articleService.updateViews(article.getAid());
        //记录访问信息
        AccessArticle accessArticle = new AccessArticle();
        accessArticle.setAccessid(UUIDUtil.getUUID());
        accessArticle.setAid(aid);
        accessArticle.setIp(IPUtil.getIpAddr(request));
        accessArticle.setCreatrd(System.currentTimeMillis());
        accessArticleService.insertAccessArticle(accessArticle);

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
    }

    @RequestMapping("/cloud/{aid}")
    public String cloud(@PathVariable String aid, Model model) {
        model.addAttribute("aid", aid);
        return "word_cloud";
    }

    @RequestMapping("/wordCloud/{aid}")
    @ResponseBody
    public ResultBean<List<NameValue>> wordCloud(@PathVariable String aid) {
        Article article = articleService.findArticleById(aid);

        String value = ArticleUtil.htmlToText(article.getContent(), ArticleUtil.VIEW_TYPE_NO_LEN);
        Map<String, Integer> keywordsMap = WordUtil.getKeyWordsMap(value);

        List<NameValue> wordCloud = new ArrayList<>();
        NameValue nameValue;

        for (Map.Entry<String, Integer> entry : keywordsMap.entrySet()) {
            nameValue = new NameValue(entry.getKey(), String.valueOf(entry.getValue()));

            wordCloud.add(nameValue);
        }

        return new ResultBean<>(wordCloud);
    }
}
