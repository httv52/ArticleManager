package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.ArticleTagCustomer;

import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
public interface TagService {
    /**
     * 新增标签
     *
     * @param tag
     */
    void insertTag(Tag tag);

    /**
     * 对文章和标签表进行维护
     *
     * @param myOldTagIds 已存在的标签 id
     * @param myNewTag    需要新添加的新标签名字
     * @param aid         文章 id
     * @param User        标签所属用户
     */
    void insertArticleTag(String[] myOldTagIds, String[] myNewTag, String aid, User User);

    /**
     * 维护 article-tag 表
     *
     * @param customer
     */
    void insertArticle_Tag(ArticleTagCustomer customer);

    /**
     * 查询用户的文章标签列表
     *
     * @param loginUserId
     * @return
     */
    List<Tag> findTagByUser(String loginUserId);

    /**
     * 查询用户的文章标签列表及文章数量
     *
     * @param loginUserId
     * @return
     */
    List<Tag> findTagWithArticle(String loginUserId);

    /**
     * 删除标签
     *
     * @param tagId
     * @return json数据
     */
    String deleteTagById(String tagId);
}
