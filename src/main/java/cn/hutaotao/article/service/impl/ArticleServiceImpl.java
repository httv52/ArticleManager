package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.ArticleMapper;
import cn.hutaotao.article.dao.UserMapper;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Logs;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.service.ArticleService;
import cn.hutaotao.article.service.LogsService;
import cn.hutaotao.article.service.TagService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.ImgUtil;
import cn.hutaotao.article.utils.format.LogDataUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TagService tagService;
    @Autowired
    private LogsService logsService;

    @Override
    public void insertArticle(Article article, String categoryId, cn.hutaotao.article.model.User loginUser) {
        if (StringUtils.isBlank(article.getPreviewimg())) {
            article.setPreviewimg(ImgUtil.articleImg());
        }

        Long currentTime = System.currentTimeMillis();
        article.setCreated(currentTime);
        article.setModified(currentTime);
        article.setViews(0);
        article.setCommens(0);
        article.setWordNumber(article.getContent().trim().length());
        article.setUser(loginUser);

        Category category = new Category();
        category.setCategoryid(categoryId);

        article.setCategory(category);

        articleMapper.insertArticle(article);
        userMapper.updateWordNumber(loginUser.getUid(), article.getWordNumber());
    }

    private void updataArticle(Article article, String categoryId, cn.hutaotao.article.model.User sessionUser) {
        if (StringUtils.isBlank(article.getPreviewimg())) {
            article.setPreviewimg(ImgUtil.articleImg());
        }

        Long currentTime = System.currentTimeMillis();
        article.setModified(currentTime);

        //统计文字差
        Integer oldWordNumber = article.getWordNumber();
        Integer newWordNumber = article.getContent().length();
        article.setWordNumber(newWordNumber);

        Category category = new Category();
        category.setCategoryid(categoryId);

        article.setCategory(category);

        articleMapper.updateArticle(article);
        userMapper.updateWordNumber(sessionUser.getUid(), newWordNumber - oldWordNumber);
    }

    @Override
    public List<Article> findAllPublished(String uid, Integer limit) {
        return articleMapper.findArticleByUserPublished(uid, limit);
    }

    @Override
    public Integer findAllPublishedCount(String uid) {
        return articleMapper.findArticleCountPublished(uid);
    }

    @Override
    public Integer findArticleCountPublished(String uid) {
        return articleMapper.findArticleCountPublished(uid);
    }

    @Override
    public Integer findArticleCount(String uid, String state, String categoryId, String tagId) {
        return articleMapper.findArticleCount(uid, state, categoryId, tagId);
    }

    @Override
    public List<Article> findArticleAll(String uid, Integer startPos, Integer pageSize, String state, String categoryId, String tagId) {
        return articleMapper.findArticleAll(uid, startPos, pageSize, state, categoryId, tagId);
    }

    @Override
    public Article findArticleById(String aid) {
        return articleMapper.findArticleById(aid);
    }

    @Override
    public void updateViews(String aid) {
        articleMapper.updateViews(aid);
    }

    @Override
    public void saveOrUpdateArticle(String myOldTagId, String myNewTag, String categoryId, Article article,
                                    cn.hutaotao.article.model.User sessionUser, String ipAddr) {
        //修改标识，1表示做修改操作
        int updateFlag = 0;
        String aid = article.getAid();

        if (StringUtils.isNotBlank(aid)) {
            updateFlag = 1;

            // 修改文章
            updataArticle(article, categoryId, sessionUser);
        } else {
            //生成文章 Id ---> 12位
            aid = UUIDUtil.getUUID_12();
            article.setAid(aid);

            // 保存文章
            insertArticle(article, categoryId, sessionUser);
        }


        // 保存标签
        String[] myOldTagIds = null;
        String[] myNewTags = null;
        if (StringUtils.isNotBlank(myOldTagId)) {
            myOldTagIds = myOldTagId.split(",");
        }
        if (StringUtils.isNotBlank(myNewTag)) {
            myNewTags = myNewTag.split(",");
        }
        tagService.insertArticleTag(myOldTagIds, myNewTags, aid, sessionUser);

        UserCustom user = new UserCustom();
        user.setUid(sessionUser.getUid());
        user.setUsername(sessionUser.getUsername());

        if (updateFlag == 1) {
            logsService.saveLogs(user, ipAddr, Logs.UPDATE_ARTI_LOG, LogDataUtil.updateArticle(user, article), System.currentTimeMillis());
        } else {
            logsService.saveLogs(user, ipAddr, Logs.SAVA_ARTI_LOG, LogDataUtil.saveArticle(user, article), System.currentTimeMillis());
        }

    }

    @Override
    public void updateCloseArticle(String aid, User loginUser, String ipAddr) {
        Article article = findArticleById(aid);

        if (article == null || article.getState() == Article.ARTICLE_STATE_DALETE || article.getState() == Article.ARTICLE_STATE_DALETE_SYSTEM) {
            throw new MyException("文章异常，请重试");
        }

        article = new Article();
        article.setAid(aid);
        article.setState(Article.ARTICLE_STATE_DALETE);
        article.setModified(System.currentTimeMillis());

        articleMapper.updateArticle(article);

        logsService.saveLogs(loginUser, ipAddr, Logs.DELETE_ARTI_LOG, LogDataUtil.deleteArticle(loginUser, article), System.currentTimeMillis());
    }

    @Override
    public void updateRecoverArticle(String aid, cn.hutaotao.article.model.User loginUser, String ipAddr) {
        Article article = findArticleById(aid);

        if (article == null || article.getState() != Article.ARTICLE_STATE_DALETE) {
            throw new MyException("文章异常，请重试");
        }

        article = new Article();
        article.setAid(aid);
        article.setState(Article.ARTICLE_STATE_PUBLISH);
        article.setModified(System.currentTimeMillis());

        articleMapper.updateArticle(article);
        logsService.saveLogs(loginUser, ipAddr, Logs.RECOVER_ARTI_LOG, LogDataUtil.updateArticle(loginUser, article), System.currentTimeMillis());
    }

    @Override
    public void updateArticleComment(String aid, String loginUserId) {
        Article article = findArticleById(aid);

        if (article == null || article.getAllowcommon() != 0) {
            throw new MyException("文章评论异常，请重试");
        }

        article = new Article();
        article.setAid(aid);
        article.setAllowcommon(1);
        article.setModified(System.currentTimeMillis());

        articleMapper.updateArticle(article);
    }

}
