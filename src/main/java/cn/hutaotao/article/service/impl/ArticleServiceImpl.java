package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.ArticleMapper;
import cn.hutaotao.article.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ht on 2017/9/25.
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleMapper articleMapper;
}
