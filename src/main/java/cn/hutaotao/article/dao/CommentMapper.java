package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    /**
     * 获取自己发表文章的评论数量
     *
     * @param articleUserId
     * @return
     */
    Integer findCommentCountByUserPrimary(String articleUserId);

    /**
     * 获取自己发表文章的评论列表
     *
     * @param uid
     * @param limit
     * @return
     */
    List<Comment> findCommentByUserPrimary(@Param("uid") String uid, @Param("limit") Integer limit);

    Integer findCommentWithMyself(String myId);

    List<Comment> findCommentWithChild(@Param("aid") String aid, @Param("limit") Integer limit);

    void save(Comment comment);
}