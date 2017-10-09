package cn.hutaotao.article.service;

import cn.hutaotao.article.model.Theme;

/**
 * Created by ht on 2017/10/9.
 */
public interface ThemeService {
    /**
     * 通过 uid 查询主题相情
     *
     * @param uid
     * @return
     */
    Theme findSimpleThemeByUser(String uid);
}
