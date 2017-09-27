package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.CategoryMapper;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> findCategoryByUser(User loginUser) {
        return categoryMapper.findCategoryByUser(loginUser);
    }
}
