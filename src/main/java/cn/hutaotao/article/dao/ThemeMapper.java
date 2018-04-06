package cn.hutaotao.article.dao;

import cn.hutaotao.article.model.Theme;
import cn.hutaotao.article.model.ThemeKey;
import org.apache.ibatis.annotations.Param;

public interface ThemeMapper {

    Theme findSimpleThemeByUser(String uid);

    void updateBaseAdminTheme(@Param("logoImg") String logoImg, @Param("autherName") String autherName,
                              @Param("describe") String describe, @Param("keyword") String keyword, @Param("uid") String uid);

    void updateLinkAdminTheme(@Param("homePage")String homePage, @Param("accountWeibo")String accountWeibo,
                              @Param("accountZhihu")String accountZhihu, @Param("accountGithub")String accountGithub,
                              @Param("uid")String loginUserId);
}