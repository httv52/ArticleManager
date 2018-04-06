package cn.hutaotao.article.model;

public class Theme extends ThemeKey {
    private String logoImg;

    private String autherName;

    private String keyword;

    private String describe;

    private Integer qrType;

    private String qrImg;

    private String homePage;

    private String accountWeibo;

    private String accountZhihu;

    private String accountGithub;

    public String getLogoImg() {
        return logoImg;
    }

    public void setLogoImg(String logoImg) {
        this.logoImg = logoImg == null ? null : logoImg.trim();
    }

    public String getAutherName() {
        return autherName;
    }

    public void setAutherName(String autherName) {
        this.autherName = autherName == null ? null : autherName.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe == null ? null : describe.trim();
    }

    public Integer getQrType() {
        return qrType;
    }

    public void setQrType(Integer qrType) {
        this.qrType = qrType;
    }

    public String getQrImg() {
        return qrImg;
    }

    public void setQrImg(String qrImg) {
        this.qrImg = qrImg == null ? null : qrImg.trim();
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    public String getAccountWeibo() {
        return accountWeibo;
    }

    public void setAccountWeibo(String accountWeibo) {
        this.accountWeibo = accountWeibo == null ? null : accountWeibo.trim();
    }

    public String getAccountZhihu() {
        return accountZhihu;
    }

    public void setAccountZhihu(String accountZhihu) {
        this.accountZhihu = accountZhihu == null ? null : accountZhihu.trim();
    }

    public String getAccountGithub() {
        return accountGithub;
    }

    public void setAccountGithub(String accountGithub) {
        this.accountGithub = accountGithub == null ? null : accountGithub.trim();
    }
}