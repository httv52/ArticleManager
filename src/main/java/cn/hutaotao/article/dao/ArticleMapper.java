package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Article;

public interface ArticleMapper {
    int deleteByPrimaryKey(String aid);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(String aid);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);
}