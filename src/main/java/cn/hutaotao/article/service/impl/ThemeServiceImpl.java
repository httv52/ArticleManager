package cn.hutaotao.article.service.impl;

import cn.hutaotao.article.dao.ThemeMapper;
import cn.hutaotao.article.model.Theme;
import cn.hutaotao.article.service.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ht on 2017/10/9.
 */
@Service
public class ThemeServiceImpl implements ThemeService {
    @Autowired
    ThemeMapper themeMapper;

    @Override
    public Theme findSimpleThemeByUser(String uid) {
        return themeMapper.findSimpleThemeByUser(uid);
    }

    @Override
    public Theme updateBaseAdminTheme(String logoImg, String autherName, String describe, String keyword, String loginUserId) {
        themeMapper.updateBaseAdminTheme(logoImg, autherName, describe, keyword, loginUserId);
        return findSimpleThemeByUser(loginUserId);
    }

    @Override
    public Theme updateLinkAdminTheme(String homePage, String accountWeibo, String accountZhihu, String accountGithub, String loginUserId) {
        themeMapper.updateLinkAdminTheme(homePage, accountWeibo, accountZhihu, accountGithub, loginUserId);
        return findSimpleThemeByUser(loginUserId);
    }

    @Override
    public void insertTheme(Theme theme) {
        themeMapper.insert(theme);
    }
}
