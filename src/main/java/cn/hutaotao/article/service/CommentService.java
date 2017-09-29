package cn.hutaotao.article.service;

import cn.hutaotao.article.dao.CommentMapper;
import cn.hutaotao.article.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ht on 2017/9/27.
 */
public interface CommentService {
    /**
     * 正常状态的评论列表
     *
     * @param loginUserId
     * @return
     */
    Integer findCommentCountByUserPrimary(String loginUserId);

    /**
     * 正常状态的评论数量
     *
     * @param loginUserId
     * @return
     */
    List<Comment> findCommentByUserPrimary(String loginUserId);
}
