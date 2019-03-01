package cn.hutaotao.article.model;

public class AccessArticle {
    private String accessid;

    private String aid;

    private String ip;

    private Long creatrd;

    public String getAccessid() {
        return accessid;
    }

    public void setAccessid(String accessid) {
        this.accessid = accessid == null ? null : accessid.trim();
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
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
    }
}