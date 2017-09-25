package cn.hutaotao.article.model;

import java.io.Serializable;

public class Tag implements Serializable {
    private String tagid;

    private String tagname;

    private User user;

    public String getTagid() {
        return tagid;
    }

    public void setTagid(String tagid) {
        this.tagid = tagid == null ? null : tagid.trim();
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname == null ? null : tagname.trim();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}