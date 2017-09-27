package cn.hutaotao.article.utils.format;

import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.custom.UserCustom;
import org.apache.commons.lang3.StringUtils;

/**
 * Created by ht on 2017/9/20.
 */
public class LogDataUtil {
    public static String userInitDate(UserCustom user) {
        return user.getUsername() + " ---> 初始化数据";
    }

    public static String userLogData(UserCustom user) {
        if (null == user) {
            return "";
        }
        if (!"on".equalsIgnoreCase(user.getRemeberPwd())) {
            user.setRemeberPwd("off");
        }
        return "{\"username\":\"" + user.getUsername() + "\",\"remeber_me\":\"" + user.getRemeberPwd() + "\"}";
    }

    public static String publishArticle(UserCustom user, Article article) {
        return user.getUsername() + " ---> 发布新文章:" + article.getTitle();
    }

}
