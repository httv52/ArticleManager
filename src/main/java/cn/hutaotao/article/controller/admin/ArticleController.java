package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.*;
import cn.hutaotao.article.model.custom.PageBean;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.ArticleService;
import cn.hutaotao.article.service.CategoryService;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.service.TagService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.LogDataUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {
    @Autowired
    ArticleService articleService;
    @Autowired
    LogsService logsService;
    @Autowired
    TagService tagService;
    @Autowired
    CategoryService categoryService;


    /**
     * 发布文章
     *
     * @param myOldTagId 旧的标签 id
     * @param myNewTag   新的标签名
     * @param categoryId 分类 id
     * @param article    文章详情
     * @param session    session
     * @param out        ajax输出
     * @param request    request
     * @throws Exception
     */
    @RequestMapping(value = "/publish", method = RequestMethod.POST) //TODO 提交有问题
    public void publish(String myOldTagId, String myNewTag, String categoryId, Article article,
                        HttpSession session, PrintWriter out, HttpServletRequest request) throws Exception {
        /*生成文章 Id ---> 12位 *//*
        String aid = UUIDUtil.getUUID_12();
        article.setAid(aid);

        // 先保存文章
        articleService.insertArticle(article, categoryId, getLoginUser(session));

        // 保存标签
        String[] myOldTagIds = null;
        String[] myNewTags = null;
        if (StringUtils.isNotBlank(myOldTagId)) {
            myOldTagIds = myOldTagId.split(",");
        }
        if (StringUtils.isNotBlank(myNewTag)) {
            myNewTags = myNewTag.split(",");
        }
        tagService.insertArticleTag(myOldTagIds, myNewTags, aid, getLoginUser(session));

        UserCustom user = new UserCustom();
        user.setUid(getLoginUserId(session));
        user.setUsername(getLoginUser(session).getUsername());

        logsService.savaLogs(user, request, Logs.SAVA_ARTI_LOG, LogDataUtil.publishArticle(user, article), System.currentTimeMillis());*/

        String result = "{\"success\":true}";
        out.print(result);
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
        if (!StringUtils.isNotBlank(state))
            state = null;
        if (!StringUtils.isNotBlank(categoryId))
            categoryId = null;
        if (!StringUtils.isNotBlank(tagId))
            tagId = null;

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


}
