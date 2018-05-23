package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.CommentMapper;
import cn.hutaotao.article.model.Comment;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.CommentService;
import cn.hutaotao.article.utils.code.UUIDUtil;
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

    @Override
    public void saveComment(User loginUser, Comment comment, String ipAddr) {
        comment.setId(UUIDUtil.getUUID());
        comment.setCreated(System.currentTimeMillis());
        comment.setState(1);
        comment.setParent("0");
        comment.setPid("0");
        comment.setUser(loginUser);
        comment.setIp(ipAddr);
        commentMapper.save(comment);
    }

}
