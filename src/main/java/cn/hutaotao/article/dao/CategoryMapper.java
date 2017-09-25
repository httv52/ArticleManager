package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Category;

public interface CategoryMapper {
    Category findCategoryById(String categoryId);

    void insertCategory(Category category);
}
