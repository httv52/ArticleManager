package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.CategoryMapper;
import cn.hutaotao.article.utils.exception.CheckException;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.CategoryService;
import cn.hutaotao.article.utils.code.UUIDUtil;
import cn.hutaotao.article.utils.format.ImgUtil;
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
    public void saveOrUpdateCategory(String loginUserid, String catrgoryName, String categoryId) {
        if (!StringUtils.isNotBlank(catrgoryName)) {
            throw new CheckException("分类名不能为空");
        }

        if (StringUtils.isNotBlank(categoryId)) {
            updateCategoryById(categoryId, catrgoryName);
        } else {
            saveCategoryByName(catrgoryName, loginUserid);
        }
    }

    @Override
    public void saveCategoryByName(String name, String uid) {
        Category category = categoryMapper.findCategoryByName(name);
        if (category != null) {
            throw new CheckException("该分类已存在，请更改");
        }

        category = new Category();
        category.setCategoryid(UUIDUtil.getUUID());
        category.setCategoryname(name);
        category.setImg(ImgUtil.categoryImg());
        User user = new User();
        user.setUid(uid);
        category.setUser(user);
        categoryMapper.insertCategory(category);
    }

    @Override
    public void updateCategoryById(String id, String name) {
        Category category = categoryMapper.findCategoryByName(name);
        if (category != null) {
            throw new CheckException("该分类已存在，请更改");
        }

        category = findCategoryById(id);

        category.setCategoryname(name);

        categoryMapper.updateCategoryById(category);
    }

    @Override
    public void deleteCategoryById(String categoryId) {
        Category category = findCategoryById(categoryId);
        if (StringUtils.isBlank(categoryId) || category == null) {
            throw new CheckException("分类不存在");
        }
        categoryMapper.deleteCategoryById(categoryId);
    }
}
