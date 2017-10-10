package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.CommentMapper;
import cn.hutaotao.article.model.Comment;
import cn.hutaotao.article.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ht on 2017/9/27.
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;

    @Override
    public Integer findCommentCountByUserPrimary(String loginUserId) {
        return commentMapper.findCommentCountByUserPrimary(loginUserId);
    }

    @Override
    public List<Comment> findCommentByUserPrimary(String loginUserId, Integer limit) {
        return commentMapper.findCommentByUserPrimary(loginUserId, limit);
    }

    @Override
    public Integer findCommentWithMyself(String loginUserId) {
        return commentMapper.findCommentWithMyself(loginUserId);
    }

    @Override
    public List<Comment> findCommentWithChild(String aid, Integer limit) {
        return commentMapper.findCommentWithChild(aid, limit);
    }

}
