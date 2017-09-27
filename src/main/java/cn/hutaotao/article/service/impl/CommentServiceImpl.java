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
    public Integer findCommentCountByUser(String loginUserId) {
        return commentMapper.findCommentCountByUser(loginUserId);
    }

    @Override
    public List<Comment> findCommentByUser(String loginUserId) {
        return commentMapper.findCommentByUser(loginUserId);
    }

}
