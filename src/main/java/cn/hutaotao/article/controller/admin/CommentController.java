package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by ht on 2017/9/27.
 */
@Controller
public class CommentController extends BaseController {
    @Autowired
    CommentService commentService;




}
