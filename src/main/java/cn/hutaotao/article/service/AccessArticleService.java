package cn.hutaotao.article.service;

import cn.hutaotao.article.model.AccessArticle;

/**
 * Created by ht on 2019/2/28.
 *
 * @author ht
 */
public interface AccessArticleService {
    /**
     * 新增访问记录
     *
     * @param accessArticle 访问信息
     */
    void insertAccessArticle(AccessArticle accessArticle);
}
