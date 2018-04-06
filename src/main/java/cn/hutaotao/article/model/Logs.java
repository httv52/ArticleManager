package cn.hutaotao.article.model;

import cn.hutaotao.article.utils.format.FormatUtil;

import java.io.Serializable;

public class Logs implements Serializable {
    /*常量*/
    public static final String INIT_LOG = "初始化博客";
    public static final String LOGIN_LOG = "登录后台";
    public static final String SAVA_ARTI_LOG = "发表文章";
    public static final String UPDATE_ARTI_LOG = "修改文章";
    public static final String DELETE_ARTI_LOG = "关闭文章";
    public static final String RECOVER_ARTI_LOG = "恢复文章";
    public static final String SAVA_FILE_LOG = "保存文件";
    public static final String DELETE_FILE_LOG = "删除文件";

    private Integer id;

    private String action;

    private String data;

    private String uid;

    private String ip;

    private Long creatrd;

    /*视图值*/
    private String createdDateView;
    private String createdDateTimeView;

    public String getCreatedDateView() {
        return createdDateView;
    }

    public String getCreatedDateTimeView() {
        return createdDateTimeView;
    }

    /*get set*/
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action == null ? null : action.trim();
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data == null ? null : data.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Long getCreatrd() {
        return creatrd;
    }

    public void setCreatrd(Long creatrd) {
        this.creatrd = creatrd;
        this.createdDateView = FormatUtil.formatDate(creatrd);
        this.createdDateTimeView = FormatUtil.formatDateTime(creatrd);
    }
}