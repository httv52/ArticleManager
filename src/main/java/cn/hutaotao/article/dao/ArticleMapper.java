package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Article;

import java.util.List;

public interface ArticleMapper {
    void insertArticle(Article article);

    List<Article> findArticleByUser(String uid);

    Integer findArticleCount(String uid);


//    int deleteByPrimaryKey(String aid);
//
//    int insert(Article record);
//
//    int insertSelective(Article record);
//
//    Article selectByPrimaryKey(String aid);
//
//    int updateByPrimaryKeySelective(Article record);
//
//    int updateByPrimaryKeyWithBLOBs(Article record);
//
//    int updateByPrimaryKey(Article record);
}
