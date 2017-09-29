package cn.hutaotao.article.controller.admin;

import cn.hutaotao.article.controller.BaseController;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.Tag;
import cn.hutaotao.article.service.CategoryService;
import cn.hutaotao.article.service.TagService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public void saveOrUpdateCategory(HttpSession session, HttpServletRequest request, PrintWriter out) {
        String catrgoryName = request.getParameter("categoryName");
        String categoryId = request.getParameter("categoryId");

        String loginUserid = getLoginUserId(session);
        String result = categoryService.editCategory(loginUserid, catrgoryName, categoryId);

        out.print(result);
    }

    @RequestMapping("/delete")
    public void deleteCategory(HttpServletRequest request, PrintWriter out) {
        String categoryId = request.getParameter("categoryId");

        String result = categoryService.deleteCategoryById(categoryId);

        out.print(result);
    }

}
