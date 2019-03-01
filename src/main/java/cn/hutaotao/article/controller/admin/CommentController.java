package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Comment;
import cn.hutaotao.article.model.custom.ResultBean;
import cn.hutaotao.article.service.ArticleService;
import cn.hutaotao.article.service.CommentService;
import cn.hutaotao.article.utils.other.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by ht on 2017/9/27.
 */
@RequestMapping("comment")
@Controller
public class CommentController extends BaseController {
    @Autowired
    CommentService commentService;
    @Autowired
    ArticleService articleService;


    @RequestMapping("/save")
    @ResponseBody
    public ResultBean<Comment> saveOrUpdateCategory(HttpSession session, HttpServletRequest request, Comment comment, String aid) {
        Article article = new Article();
        article.setAid(aid);
        comment.setArticle(article);

        commentService.saveComment(getLoginUser(session), comment, IPUtil.getIpAddr(request));

        /*评论量+1*/
        articleService.updateComments(article.getAid());

        return new ResultBean<>();
    }

}
