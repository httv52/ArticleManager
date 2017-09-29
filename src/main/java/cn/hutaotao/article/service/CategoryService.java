package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
public interface CategoryService {
    /**
     * 通过id查询分类
     *
     * @param id
     * @return
     */
    Category findCategoryById(String id);

    /**
     * 通过 name 查询分类
     *
     * @param name
     * @return
     */
    Category findCategoryByName(String name);

    /**
     * 查询用户的文章分类列表
     *
     * @param loginUserId
     * @return
     */
    List<Category> findCategoryByUser(String loginUserId);

    /**
     * 查询用户的文章分类列表以及文章数量
     *
     * @param loginUserId
     * @return
     */
    List<Category> findCategoryWithArticle(String loginUserId);

    /**
     * 对页面传来的分类进行处理
     *
     * @param loginUserid
     * @param catrgoryName
     * @param categoryId
     * @return
     */
    String editCategory(String loginUserid, String catrgoryName, String categoryId);

    void saveCategoryByName(String name, String uid);

    void updateCategoryById(String id, String name);

    String deleteCategoryById(String categoryId);
}
