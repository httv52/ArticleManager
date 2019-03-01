package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.AccessArticle;

public interface AccessArticleMapper {
    int deleteByPrimaryKey(String accessid);

    int insert(AccessArticle record);

    int insertSelective(AccessArticle record);

    AccessArticle selectByPrimaryKey(String accessid);

    int updateByPrimaryKeySelective(AccessArticle record);

    int updateByPrimaryKey(AccessArticle record);
}