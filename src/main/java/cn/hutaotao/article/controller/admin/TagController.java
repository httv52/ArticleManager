package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.model.custom.ResultBean;
import cn.hutaotao.article.service.TagService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by ht on 2017/9/25.
 */
@Controller
@RequestMapping("/tag")
public class TagController extends BaseController {
    @Autowired
    TagService tagService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResultBean saveCategory(HttpSession session, String tagName) {
        Tag tag = new Tag();
        tag.setTagid(UUIDUtil.getUUID());
        tag.setTagname(tagName);
        tag.setUser(getLoginUser(session));

        tagService.insertTag(tag);

        return new ResultBean();
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultBean updateCategory(String tagId, String tagName) {
        tagService.updateTagName(tagId, tagName);

        return new ResultBean();
    }

    @RequestMapping("/delete/{tagId}")
    @ResponseBody
    public ResultBean deleteTag(@PathVariable String tagId) {
        tagService.deleteTagById(tagId);

        return new ResultBean();

    }
}
