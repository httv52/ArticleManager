package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.CategoryMapper;
import cn.hutaotao.article.exception.MyException;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.CategoryService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import org.apache.commons.lang3.StringUtils;
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
    public Category findCategoryById(String id) {
        return categoryMapper.findSimpleCategoryById(id);
    }

    @Override
    public Category findCategoryByName(String name) {
        return categoryMapper.findCategoryByName(name);
    }

    @Override
    public List<Category> findCategoryByUser(String loginUserId) {
        return categoryMapper.findCategoryByUser(loginUserId);
    }

    @Override
    public List<Category> findCategoryWithArticle(String loginUserId) {
        List<Category> categoryList = categoryMapper.findCategoryWithArticle(loginUserId);
        if (null == categoryList) {
            categoryList.add(new Category("0"));
        }

        Boolean hasPrimary = false;
        for (Category category : categoryList) {
            if ("0".equalsIgnoreCase(category.getCategoryid())) {
                hasPrimary = true;
                break;
            }
        }
        if (!hasPrimary) {
            categoryList.add(new Category("0"));
        }
        return categoryList;
    }

    @Override
    public String editCategory(String loginUserid, String catrgoryName, String categoryId) {
        try {
            if (!StringUtils.isNotBlank(catrgoryName)) {
                throw new MyException("分类名不能为空");
            }

            if (!StringUtils.isNotBlank(categoryId)) {
                saveCategoryByName(catrgoryName, loginUserid);
                return "{\"success\":true}";
            }
            updateCategoryById(categoryId, catrgoryName);

            return "{\"success\":true}";
        } catch (Exception e) {
            throw new MyException("分类保存失败：" + e.getMessage());
        }
    }

    @Override
    public void saveCategoryByName(String name, String uid) {
        Category category;
        category = categoryMapper.findCategoryByName(name);
        if (category != null) {
            throw new MyException("该分类已存在，请更改");
        }

        category = new Category();
        category.setCategoryid(UUIDUtil.getUUID());
        category.setCategoryname(name);
        category.setImg("");
        User user = new User();
        user.setUid(uid);
        category.setUser(user);
        categoryMapper.insertCategory(category);
    }

    @Override
    public void updateCategoryById(String id, String name) {
        Category category = findCategoryById(id);

        category.setCategoryname(name);

        categoryMapper.updateCategoryById(category);
    }

    @Override
    public String deleteCategoryById(String categoryId) {
        try {
            if (!StringUtils.isNotBlank(categoryId)) {
                throw new MyException("分类 id 不能为空");
            }
            categoryMapper.deleteCategoryById(categoryId);

            return "{\"success\":true}";
        } catch (Exception e) {
            String msg = null;
            if (e instanceof MyException) {
                msg = e.getMessage();
            }
            throw new MyException("分类删除失败：" + msg);
        }
    }
}
