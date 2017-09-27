package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.ArticleService;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.service.TagService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.LogDataUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

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


    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public void publish(String myOldTagId, String myNewTag, String categoryId, Article article,
                        HttpSession session, PrintWriter out, HttpServletRequest request) throws Exception {
        /*先生成文章 Id ---> 12位 *//*
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
}
