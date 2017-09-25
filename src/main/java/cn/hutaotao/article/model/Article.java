package cn.hutaotao.article.model;

import cn.hutaotao.article.utils.format.FormatUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Article implements Serializable {

    /*文章常量*/
    /*文章常量*/
    /*文章常量*/

    /**
     * 文章类型 0-Markdown
     */
    public static final Integer ARTICLE_TYPE_MARKDOWN = 0;
    /**
     * 文章类型 1-富文本
     */
    public static final Integer ARTICLE_TYPE_TEXT = 0;

    /**
     * 文章状态 0-未发布
     */
    public static final Integer ARTICLE_STATE_SAVE = 0;
    public static final String ARTICLE_STATE_SAVE_VIEW = "未发布";
    /**
     * 文章状态 1-已发布
     */
    public static final Integer ARTICLE_STATE_PUBLISH = 1;
    public static final String ARTICLE_STATE_PUBLISH_VIEW = "已发布";
    /**
     * 文章状态 2-已关闭
     */
    public static final Integer ARTICLE_STATE_DALETE = 2;
    public static final String ARTICLE_STATE_DALETE_VIEW = "已关闭";
    /**
     * 文章状态 3-超级管理员关闭
     */
    public static final Integer ARTICLE_STATE_DALETE_SYSTEM = 3;
    public static final String ARTICLE_STATE_DALETE_SYSTEMVIEW = "超级管理员关闭";

    private static final Map<Integer, String> ARTICLE_STATE_MAP = new HashMap();

    static {
        ARTICLE_STATE_MAP.put(ARTICLE_STATE_SAVE, ARTICLE_STATE_SAVE_VIEW);
        ARTICLE_STATE_MAP.put(ARTICLE_STATE_PUBLISH, ARTICLE_STATE_PUBLISH_VIEW);
        ARTICLE_STATE_MAP.put(ARTICLE_STATE_DALETE, ARTICLE_STATE_DALETE_VIEW);
        ARTICLE_STATE_MAP.put(ARTICLE_STATE_DALETE_SYSTEM, ARTICLE_STATE_DALETE_SYSTEMVIEW);
    }


    /*JAVA Bean*/
    /*JAVA Bean*/
    /*JAVA Bean*/

    private String aid;  //文章id

    private String title;

    private String pageTitle;

    private String url; //自定义url

    private String previewimg;  //预览图

    private Long created;  //创建时间

    private Long modified;  //最后修改时间

    private Integer type;  //文章类型 0-Markdown  1-富文本编辑器

    private Integer state;  //文章状态 文章状态 0-未发布 1-已发布 2-已关闭 3-超级管理员关闭

    private Integer views;  //文章浏览数

    private Integer commens;  //文章评论数

    private Integer allowcommon;  //允许评论 1-允许 0-不允许

    private Integer allowsub;  //允许订阅 1-允许 0-不允许

    private String content;  //文章内容

    /*关系映射*/
    /*关系映射*/
    /*关系映射*/
    //多对一
    private User user;  //文章所属者
    //多对一
    private Category category;  //文章分类
    //多对多
    private List<Tag> tagList = new ArrayList<>();


    /*视图值*/
    private String stateView;
    private String createdDateView;
    private String createdDateTimeView;
    private String modifiedDateView;
    private String modifiedDateTimeView;


    /*视图值Get*/

    public String getStateView() {
        return stateView;
    }

    public String getCreatedDateView() {
        return createdDateView;
    }

    public String getCreatedDateTimeView() {
        return createdDateTimeView;
    }

    public String getModifiedDateView() {
        return modifiedDateView;
    }

    public String getModifiedDateTimeView() {
        return modifiedDateTimeView;
    }

    /*关联映射Get Set*/

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Tag> getTagList() {
        return tagList;
    }

    public void setTagList(List<Tag> tagList) {
        this.tagList = tagList;
    }

    /*一般Get Set*/
    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getUrl() {
        return url;
    }

    public String getPreviewimg() {
        return previewimg;
    }

    public void setPreviewimg(String previewimg) {
        this.previewimg = previewimg == null ? null : previewimg.trim();
    }

    public Long getCreated() {
        return created;
    }

    public void setCreated(Long created) {
        this.created = created;
        this.createdDateView = FormatUtil.formatDate(created);
        this.createdDateTimeView = FormatUtil.formatDateTime(created);
    }

    public Long getModified() {
        return modified;
    }

    public void setModified(Long modified) {
        this.modified = modified;
        this.modifiedDateView = FormatUtil.formatDate(modified);
        this.modifiedDateTimeView = FormatUtil.formatDateTime(modified);
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
        this.stateView = ARTICLE_STATE_MAP.get(state);
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Integer getCommens() {
        return commens;
    }

    public void setCommens(Integer commens) {
        this.commens = commens;
    }

    public Integer getAllowcommon() {
        return allowcommon;
    }

    public void setAllowcommon(Integer allowcommon) {
        this.allowcommon = allowcommon;
    }

    public Integer getAllowsub() {
        return allowsub;
    }

    public void setAllowsub(Integer allowsub) {
        this.allowsub = allowsub;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}