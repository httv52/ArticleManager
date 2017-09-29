package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.ArticleMapper;
import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.Category;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ht on 2017/9/25.
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleMapper articleMapper;

    @Override
    public void insertArticle(Article article, String categoryId, User loginUser) {
        Long currentTime = System.currentTimeMillis();
        article.setCreated(currentTime);
        article.setModified(currentTime);
        article.setViews(0);
        article.setCommens(0);
        article.setUser(loginUser);

        Category category = new Category();
        category.setCategoryid(categoryId);

        article.setCategory(category);

        articleMapper.insertArticle(article);
    }

    @Override
    public List<Article> findAllPublished(String uid) {
        return articleMapper.findArticleByUserPublished(uid);
    }

    @Override
    public Integer findArticleCountPublished(String uid) {
        return articleMapper.findArticleCountPublished(uid);
    }

    @Override
    public Integer findArticleCount(String uid, String state, String categoryId, String tagId) {
        return articleMapper.findArticleCount(uid, state, categoryId, tagId);
    }

    @Override
    public List<Article> findArticleAll(String uid, Integer startPos, Integer pageSize, String state, String categoryId, String tagId) {
        return articleMapper.findArticleAll(uid, startPos, pageSize, state, categoryId, tagId);
    }
}
