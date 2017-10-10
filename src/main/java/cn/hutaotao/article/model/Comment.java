package cn.hutaotao.article.model;

import cn.hutaotao.article.utils.format.FormatUtil;

import java.util.ArrayList;
import java.util.List;

public class Comment {
    /*常量*/
    /**
     * 正常评论
     */
    public static final Integer COMMENT_STATE = 1;
    /**
     * 被删除评论
     */
    public static final Integer COMMENT_STATE_DELETE = 0;

    private String id;

    private String content;

    private Long created;

    private String ip;

    private Integer state;

    private String parent;

    /*视图值*/
    private String createdDateView;
    private String createdDateTimeView;

    public String getCreatedDateView() {
        return createdDateView;
    }

    public String getCreatedDateTimeView() {
        return createdDateTimeView;
    }

    /*关联关系*/
    private Article article;

    private User user;

    private List<Comment> childList = new ArrayList<>();

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getChildList() {
        return childList;
    }

    public void setChildList(List<Comment> childList) {
        this.childList = childList;
    }
    /* Get Set */

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Long getCreated() {
        return created;
    }

    public void setCreated(Long created) {
        this.created = created;
        this.createdDateView = FormatUtil.formatDate(created);
        this.createdDateTimeView = FormatUtil.formatDateTime(created);
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent == null ? null : parent.trim();
    }

}