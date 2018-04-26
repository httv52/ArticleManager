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

    /**
     * 前台主题 - 基本设置
     * @param logoImg
     * @param autherName
     * @param describe
     * @param keyword
     * @param loginUserId
     * @return 返回主题
     */
    Theme updateBaseAdminTheme(String logoImg, String autherName, String describe, String keyword, String loginUserId);

    /**
     * 前台主题 - 连接设置
     * @param homePage
     * @param accountWeibo
     * @param accountZhihu
     * @param accountGithub
     * @param loginUserId
     * @return
     */
    Theme updateLinkAdminTheme(String homePage, String accountWeibo, String accountZhihu, String accountGithub, String loginUserId);

    void insertTheme(Theme theme);
}
