package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Comment;

import java.util.List;

/**
 * Created by ht on 2017/9/27.
 */
public interface CommentService {
    /**
     * 正常状态的评论数量列表
     *
     * @param loginUserId
     * @return
     */
    Integer findCommentCountByUserPrimary(String loginUserId);

    /**
     * 正常状态的评论列表
     *
     * @param loginUserId
     * @param limit
     * @return
     */
    List<Comment> findCommentByUserPrimary(String loginUserId, Integer limit);

    /**
     * 获取登录人发表的评论数量
     *
     * @param loginUserId
     * @return
     */
    Integer findCommentWithMyself(String loginUserId);

    List<Comment> findCommentWithChild(String aid, Integer limit);
}
