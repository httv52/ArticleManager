package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {
    void insertArticle(Article article);

    /**
     * 发布的文章列表
     *
     * @param uid
     * @return
     */
    List<Article> findArticleByUserPublished(String uid);

    /**
     * 发布的文章数量
     *
     * @param uid
     * @return
     */
    Integer findArticleCountPublished(String uid);

    /**
     * 所有的文章数量
     *
     * @param uid
     * @return
     */
    Integer findArticleCount(@Param("uid") String uid, @Param("state") String state,
                             @Param("categoryId") String categoryId, @Param("tagId") String tagId);

    /**
     * 分页-所有文章列表
     *
     * @param uid
     * @param state
     * @param categoryId
     * @param tagId      @return
     */
    List<Article> findArticleAll(@Param("uid") String uid, @Param("startPos") Integer startPos,
                                 @Param("pageSize") Integer pageSize, @Param("state") String state,
                                 @Param("categoryId") String categoryId, @Param("tagId") String tagId);


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
