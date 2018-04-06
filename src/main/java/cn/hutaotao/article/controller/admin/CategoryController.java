package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.model.custom.ResultBean;
import cn.hutaotao.article.service.CategoryService;
import cn.hutaotao.article.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    TagService tagService;

    @RequestMapping("/categManege")
    public String categAndTagManege(Model model, HttpSession session) {
        String loginUserId = getLoginUserId(session);
        List<Category> categoryList = categoryService.findCategoryWithArticle(loginUserId);
        List<Tag> tagList = tagService.findTagWithArticle(loginUserId);

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("tagList", tagList);
        return "admin/categManege";
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResultBean<Category> saveOrUpdateCategory(HttpSession session, String categoryName, String categoryId) {
        categoryService.saveOrUpdateCategory(getLoginUserId(session), categoryName, categoryId);

        return new ResultBean<>();
    }

    @RequestMapping("/delete")
    public void deleteCategory(HttpServletRequest request, PrintWriter out) {
        String categoryId = request.getParameter("categoryId");

        String result = categoryService.deleteCategoryById(categoryId);

        out.print(result);
    }

}
