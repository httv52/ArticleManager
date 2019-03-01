package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.AccessArticleMapper;
import cn.hutaotao.article.model.AccessArticle;
import cn.hutaotao.article.service.AccessArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ht on 2019/2/28.
 *
 * @author ht
 */
@Service
public class AccessArticleServiceImpl implements AccessArticleService {
    @Autowired
    private AccessArticleMapper accessArticleMapper;

    /**
     * 新增访问记录
     *
     * @param accessArticle 访问信息
     */
    @Override
    public void insertAccessArticle(AccessArticle accessArticle) {
        accessArticleMapper.insert(accessArticle);
    }
}
