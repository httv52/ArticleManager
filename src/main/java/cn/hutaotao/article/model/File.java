package cn.hutaotao.article.model;

import cn.hutaotao.article.utils.format.FormatUtil;

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

    private Long size;

    private User user;

    /*视图值*/
    private String createdDateView;

    private String createdDateTimeView;

    private String sizeView;

    private Integer count;

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
        this.sizeView = FormatUtil.formatFileSize(size);
    }

    public String getSizeView() {
        return sizeView;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getCreatedDateView() {
        return createdDateView;
    }

    public String getCreatedDateTimeView() {
        return createdDateTimeView;
    }

    /* get set*/
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
        this.createdDateView = FormatUtil.formatDate(created);
        this.createdDateTimeView = FormatUtil.formatDateTime(created);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}