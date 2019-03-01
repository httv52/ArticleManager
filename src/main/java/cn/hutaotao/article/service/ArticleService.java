package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.User;

import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
public interface ArticleService {
    /**
     * 添加文章
     *
     * @param article    文章
     * @param categoryId 分类 id
     * @param loginUser  用户-session中的
     */
    void insertArticle(Article article, String categoryId, User loginUser);

    /**
     * 获取最近所有发布过的文章
     *
     * @param uid 用户
     * @return
     */
    List<Article> findAllPublished(String uid, Integer limit);

    /**
     * 获取所有发布过的文章数量
     *
     * @param uid 用户
     * @return
     */
    Integer findAllPublishedCount(String uid);

    /**
     * 获取文章数量
     *
     * @param uid 用户
     * @return
     */
    Integer findArticleCountPublished(String uid);

    /**
     * 所有的文章数量
     *
     * @param uid
     * @return
     */
    Integer findArticleCount(String uid, String state, String categoryId, String tagId);

    /**
     * 分页-所有文章列表
     *
     * @param uid
     * @param state
     * @param categoryId
     * @param tagId      @return
     */
    List<Article> findArticleAll(String uid, Integer startPos, Integer pageSize, String state, String categoryId, String tagId);

    /**
     * 通过 id查找 文章
     * @param aid
     * @return
     */
    Article findArticleById(String aid);

    /**
     * 增加访问量
     * @param aid
     */
    void updateViews(String aid);

    /**
     * 增加评论量
     * @param aid
     */
    void updateComments(String aid);

    /**
     * 保存或更新文章
     * @param myOldTagId
     * @param myNewTag
     * @param categoryId
     * @param article
     * @param sessionUser
     * @param ipAddr
     */
    void saveOrUpdateArticle(String myOldTagId, String myNewTag, String categoryId, Article article, User sessionUser, String ipAddr);

    /**
     * 关闭文章
     * @param aid
     * @param loginUser
     * @param ipAddr
     */
    void updateCloseArticle(String aid, User loginUser, String ipAddr);

    void updateRecoverArticle(String aid, User loginUser, String ipAddr);

    /**
     * 打开文章评论
     * @param aid
     * @param loginUserId
     */
    void updateArticleComment(String aid, String loginUserId);
}
