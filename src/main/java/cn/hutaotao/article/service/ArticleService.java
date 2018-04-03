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
}
