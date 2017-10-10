package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Theme;
import cn.hutaotao.article.model.ThemeKey;

public interface ThemeMapper {

    Theme findSimpleThemeByUser(String uid);
}