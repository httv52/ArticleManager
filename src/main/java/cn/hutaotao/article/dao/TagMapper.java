package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.ArticleTagCustomer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TagMapper {

    void insertTag(Tag tag);

    void insertArticle_Tag(ArticleTagCustomer customer);

    List<Tag> findTagByUser(String uid);

    List<Tag> findTagWithArticle(String uid);

    void deleteTagById(String tagId);

    void deletetArticle_Tag(@Param("aid") String aid);

    Tag findTagByName(String tagName);

    Tag findTagById(String tagId);

    void updateTagById(Tag tag);
}
