package cn.hutaotao.article.utils.format;

import cn.hutaotao.article.model.Article;
import cn.hutaotao.article.model.User;
import cn.hutaotao.article.model.custom.UserCustom;

/**
 * Created by ht on 2017/9/20.
 */
public class LogDataUtil {
    public static String userInitDate(User user) {
        return user.getUsername() + " ---> 初始化数据";
    }

    public static String userLogData(User user) {
        if (null == user) {
            return "";
        }
        return "{\"username\":\"" + user.getUsername() + "\"}";
    }

    public static String saveArticle(User user, Article article) {
        return user.getUsername() + " ---> 发布新文章:" + article.getTitle();
    }

    public static String updateArticle(User user, Article article) {
        return user.getUsername() + " ---> 修改文章:" + article.getTitle();
    }
    public static String deleteArticle(User user, Article article) {
        return user.getUsername() + " ---> 关闭文章:" + article.getTitle();
    }
}
