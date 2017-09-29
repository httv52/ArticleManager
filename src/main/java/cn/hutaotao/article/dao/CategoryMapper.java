package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;

import java.util.List;

public interface CategoryMapper {
    Category findCategoryById(String categoryId);

    Category findSimpleCategoryById(String categoryId);

    void insertCategory(Category category);

    List<Category> findCategoryByUser(String uid);

    List<Category> findCategoryWithArticle(String uid);

    void updateCategoryById(Category category);

    Category findCategoryByName(String name);

    void deleteCategoryById(String id);
}
