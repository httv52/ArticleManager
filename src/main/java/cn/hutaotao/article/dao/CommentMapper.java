package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Comment;

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
     * @param articleUserId
     * @return
     */
    List<Comment> findCommentByUserPrimary(String articleUserId);
}