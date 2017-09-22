package cn.hutaotao.article.demo;

import cn.hutaotao.article.model.custom.UserCustom;
import cn.hutaotao.article.utils.format.LogDataUtil;
import org.junit.Test;

/**
 * Created by ht on 2017/9/20.
 */
public class TestDemo {
    @Test
    public void test() {
        UserCustom userCustom = new UserCustom();
        userCustom.setRemeberPwd("on");
        userCustom.setUsername("胡涛");

        System.out.println(LogDataUtil.userLogData(userCustom));;
    }
}
