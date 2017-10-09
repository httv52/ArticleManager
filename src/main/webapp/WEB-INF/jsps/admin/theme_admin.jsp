<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--导入头文件--%>
<%@include file="/WEB-INF/jsps/format/admin/head.jsp" %>

<!-- 中间内容 -->
<section id="content">

    <section class="vbox">
        <section class="scrollable padder" id="topAnchor">
            <!--路径-->
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li>
                    <a href="<c:url value="/admin/index"/> "><i class="fa fa-home"></i> 主页</a>
                </li>
                <li>
                    <a href="# "><i class="fa fa-edit"></i> 系统设置</a>
                </li>
                <li class="active">
                    <i class="fa"> 后台设置</i>
                </li>
            </ul>

            <div class="m-b-md">
                <h3 class="m-b-none"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">后台设置</span></span>
                </h3>
            </div>


            <%--主要数据--%>
            <div class="row">
                <div class="col-md-6">
                    <section class="panel panel-primary">
                        <header class="panel-heading">
                            <h1 class="panel-title">个人信息设置</h1>
                        </header>
                        <div class="panel-body">
                            <div class="m-b-10" style="padding: 1px 8px 8px 8px">
                                <form id="option-from" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">登录名</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_logo_url" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">显示名</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_author"
                                                   placeholder="您的站点昵称">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">邮箱</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_author"
                                                   placeholder="您的站点详细描述">
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-info"
                                                onclick="saveThemeOptions('option-from')">
                                            保存设置
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>

                    <section class="panel panel-danger" style="color: #fff" id="updatePwd">
                        <header class="panel-heading">
                            <h1 class="panel-title">密码设置</h1>
                        </header>
                        <div class="panel-body">
                            <div class="m-b-10" style="padding: 1px 8px 8px 8px">
                                <form id="indivi-form" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">输入旧密码</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_social_weibo"
                                                   placeholder="微博账号，不输入则不显示">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">输入新密码</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_social_zhihu"
                                                   placeholder="知乎账号，不输入则不显示">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">确认新密码</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_social_github"
                                                   placeholder="Github账号，不输入则不显示">
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-primary"
                                                onclick="saveThemeOptions('indivi-form')">
                                            保存设置
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-md-6">
                    <section class="panel panel-warning" style="color: #4e4e4e">
                        <header class="panel-heading">
                            <h1 class="panel-title">黑名单设置</h1>
                        </header>
                        <div class="panel-body">

                        </div>
                    </section>
                </div>

            </div>

        </section>
    </section>

</section>
<!-- /中间内容 -->




<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>
