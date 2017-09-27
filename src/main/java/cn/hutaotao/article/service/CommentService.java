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
    Integer findCommentCountByUser(String loginUserId);

    List<Comment> findCommentByUser(String loginUserId);
}
