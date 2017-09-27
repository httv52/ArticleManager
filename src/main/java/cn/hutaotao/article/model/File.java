package cn.hutaotao.article.model;

import java.io.Serializable;

public class File implements Serializable {
    /*常量*/
    public static final String PIC_HOST = "http://127.0.0.1:8081/SSMDemo2_img";
    /**
     * 其他类型
     */
    public static final Integer FILE_TYPEE_OTHER = 0;
    /**
     * 图片类型
     */
    public static final Integer FILE_TYPEE_IMAGE = 1;
    /**
     * 文本类型
     */
    public static final Integer FILE_TYPEE_TEXT = 2;
    /**
     * 链接类型
     */
    public static final Integer FILE_TYPEE_LINK = 3;
    /**
     * 视频类型
     */
    public static final Integer FILE_TYPEE_VEDIO = 4;
    /**
     * 音乐类型
     */
    public static final Integer FILE_TYPEE_MUSIC = 5;


    private String id;

    private String fileUrl;

    private String realName;

    private Integer fileType;

    private Long created;

    private User user;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public Integer getFileType() {
        return fileType;
    }

    public void setFileType(Integer fileType) {
        this.fileType = fileType;
    }

    public Long getCreated() {
        return created;
    }

    public void setCreated(Long created) {
        this.created = created;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}