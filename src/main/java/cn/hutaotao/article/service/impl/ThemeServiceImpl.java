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
}
