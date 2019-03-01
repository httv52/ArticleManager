package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.utils.exception.MyException;
import cn.hutaotao.article.model.*;
import cn.hutaotao.article.model.custom.PageBean;
import cn.hutaotao.article.model.custom.ResultBean;
import cn.hutaotao.article.service.ArticleService;
import cn.hutaotao.article.service.CategoryService;
import cn.hutaotao.article.service.TagService;
import cn.hutaotao.article.utils.format.ImgUtil;
import cn.hutaotao.article.utils.other.IPUtil;
import com.vdurmont.emoji.EmojiParser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ht
 * @date 2017/9/25
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;


    /**
     * 发布文章
     *
     * @param myOldTagId 旧的标签 id
     * @param myNewTag   新的标签名
     * @param categoryId 分类 id
     * @param article    文章详情
     * @param session    session
     * @param request    request
     * @throws Exception
     */
    @RequestMapping(value = "/publish", method = RequestMethod.POST) //TODO 提交有问题
    @ResponseBody
    public ResultBean<Article> publish(String myOldTagId, String myNewTag, String categoryId, Article article,
                                       HttpSession session, HttpServletRequest request) {

        articleService.saveOrUpdateArticle(myOldTagId, myNewTag, categoryId, article, getLoginUser(session), IPUtil.getIpAddr(request));

        return new ResultBean<>();
    }

    @RequestMapping("/modify")
    public String modify() {
        return "admin/publish";
    }


    @RequestMapping("/findByState")
    public String findByState(Model model, HttpSession session, HttpServletRequest request,
                              @ModelAttribute("state") String state, @ModelAttribute("categoryId") String categoryId,
                              @ModelAttribute("tagId") String tagId) {
        String loginUserId = getLoginUserId(session);
        if (!StringUtils.isNotBlank(state)) {
            state = null;
        }
        if (!StringUtils.isNotBlank(categoryId)) {
            categoryId = null;
        }
        if (!StringUtils.isNotBlank(tagId)) {
            tagId = null;
        }

        Integer totalCount = articleService.findArticleCount(loginUserId, state, categoryId, tagId);
        String pageNowStr = request.getParameter("pageNow");
        Integer pageNow = null == pageNowStr ? 1 : Integer.parseInt(pageNowStr);

        String pageSizeStr = request.getParameter("pageSize");
        Integer pageSize = null == pageSizeStr ? 8 : Integer.parseInt(pageSizeStr);

        PageBean pageBean = new PageBean(totalCount, pageNow, pageSize);

        List<Category> categoryList = categoryService.findCategoryByUser(loginUserId);
        List<Tag> tagList = tagService.findTagByUser(loginUserId);
        List<Article> articleList = articleService.findArticleAll(loginUserId, pageBean.getStartPos(), pageSize, state, categoryId, tagId);


        model.addAttribute("categoryList", categoryList);
        model.addAttribute("tagList", tagList);
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageBean", pageBean);
        return "admin/articleManege";
    }

    @RequestMapping(value = "/preUpdateArticle/{aid}", method = RequestMethod.GET)
    public String preUpdateArticle(@PathVariable("aid") String aid, Model model, HttpSession session) {
        Article article = articleService.findArticleById(aid);

        if (!article.getUser().getUid().equalsIgnoreCase(getLoginUserId(session))) {
            throw new MyException("无权限操作此文章");
        }

        String loginUserId = getLoginUserId(session);
        List<Tag> tagList = tagService.findTagByUser(loginUserId);
        List<Category> categoryList = categoryService.findCategoryByUser(loginUserId);

        //文章Emoji转换
        article.setContent(EmojiParser.parseToUnicode(article.getContent()));

        model.addAttribute("article", article);
        model.addAttribute("tagList", tagList);
        model.addAttribute("categoryList", categoryList);

        return "admin/updateArticle";
    }

    @RequestMapping("/closeArticle/{aid}")
    @ResponseBody
    public ResultBean<Article> closeArticle(@PathVariable("aid") String aid, HttpSession session, HttpServletRequest request) {
        articleService.updateCloseArticle(aid, getLoginUser(session), IPUtil.getIpAddr(request));
        return new ResultBean<>();
    }

    @RequestMapping("/recoverArticle/{aid}")
    @ResponseBody
    public ResultBean<Article> recoverArticle(@PathVariable("aid") String aid, HttpSession session, HttpServletRequest request) {
        articleService.updateRecoverArticle(aid, getLoginUser(session), IPUtil.getIpAddr(request));
        return new ResultBean<>();
    }

    @RequestMapping("/openComment/{aid}")
    @ResponseBody
    public ResultBean<Article> openComment(@PathVariable("aid") String aid, HttpSession session) {
        articleService.updateArticleComment(aid, getLoginUserId(session));
        return new ResultBean<>();
    }

    @RequestMapping("/changeImg")
    @ResponseBody
    public ResultBean<String> changeImg() {
        String imgSrc = ImgUtil.articleImg();
        return new ResultBean<>(imgSrc);
    }

}
