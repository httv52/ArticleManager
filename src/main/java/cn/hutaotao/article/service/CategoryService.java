package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;

import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
public interface CategoryService{
    /**
     * 查询用户的文章分类列表
     * @param loginUser
     * @return
     */
    List<Category> findCategoryByUser(User loginUser);
}
