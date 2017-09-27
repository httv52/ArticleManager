package cn.hutaotao.article.model;

import cn.hutaotao.article.utils.format.FormatUtil;
import cn.hutaotao.article.utils.validati.ValidGroupLogin;
import cn.hutaotao.article.utils.validati.ValidGroupRegister;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class User implements Serializable {
    /*常量*/
    public static final String SESSION_USER_NAME = "loginUser"; //用户在session中的key

    /**
     * 已注销
     */
    public static final Integer USER_STATE_OF__DELETE = 2;
    /**
     * 已注册
     */
    public static final Integer USER_STATE_OF__ACTIVATE = 1;
    /**
     * 未激活
     */
    public static final Integer USER_STATE_OF__LOSE_ACTIVATE = 0;

    public static final String USER_STATE_OF__DELETE_VIEW = "已注销";
    public static final String USER_STATE_OF__ACTIVATE_VIEW = "已注册";
    public static final String USER_STATE_OF__LOSE_ACTIVATE_VIEW = "未激活";

    public static final Map<Integer, String> userStateMap = new HashMap<>();

    static {
        userStateMap.put(USER_STATE_OF__ACTIVATE, USER_STATE_OF__ACTIVATE_VIEW);
        userStateMap.put(USER_STATE_OF__LOSE_ACTIVATE, USER_STATE_OF__LOSE_ACTIVATE_VIEW);
        userStateMap.put(USER_STATE_OF__DELETE, USER_STATE_OF__DELETE_VIEW);
    }

    /* -常量*/

    private String uid;

    @NotEmpty(message = "{user.username.isEmpty}", groups = {ValidGroupRegister.class, ValidGroupLogin.class})
    private String username;

    @Size(min = 2, max = 20, message = "{user.password.length.error}", groups = {ValidGroupRegister.class, ValidGroupLogin.class})
    private String password;

    @NotEmpty(message = "{user.email.isEmpty}", groups = {ValidGroupRegister.class})
    private String email;

    @NotEmpty(message = "{user.screenName.isEmpty}", groups = {ValidGroupRegister.class})
    private String screenName;

    private Long created;

    private Long logged;

    private Integer state;

    private String activateCode;  //激活码

    /*视图值*/
    private String createdView;

    private String loggedView;

    private String stateView;

    public String getCreatedView() {
        return createdView;
    }

    public String getLoggedView() {
        return loggedView;
    }

    public String getStateView() {
        return stateView;
    }
    /* -视图值*/

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName == null ? null : screenName.trim();
    }

    public Long getCreated() {
        return created;
    }

    public void setCreated(Long created) {
        this.created = created;
        this.createdView = FormatUtil.formatDateTime(created);
    }

    public Long getLogged() {
        return logged;
    }

    public void setLogged(Long logged) {
        this.logged = logged;
        this.loggedView = FormatUtil.formatDateTime(logged);
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
        this.stateView = userStateMap.get(state);
    }

    public String getActivateCode() {
        return activateCode;
    }

    public void setActivateCode(String activateCode) {
        this.activateCode = activateCode;
    }
}