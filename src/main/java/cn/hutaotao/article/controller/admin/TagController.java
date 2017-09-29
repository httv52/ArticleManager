package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

/**
 * Created by ht on 2017/9/25.
 */
@Controller
@RequestMapping("/tag")
public class TagController {
    @Autowired
    TagService tagService;

    @RequestMapping("/delete")
    public void deleteTag(HttpServletRequest request, PrintWriter out) {
        String tagId = request.getParameter("tagId");

        String result = tagService.deleteTagById(tagId);

        out.print(result);
    }
}
