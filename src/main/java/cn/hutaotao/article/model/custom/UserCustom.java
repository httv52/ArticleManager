package cn.hutaotao.article.model.custom;

import cn.hutaotao.article.model.User;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by ht on 2017/9/20.
 */
public class UserCustom extends User {

    private String remeberPwd;

    public String getRemeberPwd() {
        return remeberPwd;
    }

    public void setRemeberPwd(String remeberPwd) {
        this.remeberPwd = remeberPwd;
    }

}
