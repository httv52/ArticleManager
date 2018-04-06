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
                                <form id="theme_info" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">登录名</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_logo_url" disabled value="${user.username}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">显示名</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="screenName"
                                                   placeholder="您的姓名或昵称" value="${user.screenName}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">邮箱</label>
                                        <div class="col-md-9">
                                            <input type="email" class="form-control" name="email"
                                                   placeholder="邮箱将被用于接受信息" value="${user.email}">
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-info"
                                                onclick="saveThemeOptions('theme_info')">
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
                                <form id="update_pwd" class="form-horizontal" style="color: #8e8e8e" data-validate="parsley">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">输入旧密码</label>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control parsley-validated" name="oldPwd" id="oldPwd"
                                                   placeholder="旧密码" data-rangelength="[2,20]" data-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">输入新密码</label>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control" name="newPwd" id="firstPwd"
                                                   placeholder="输入2-20位新密码" data-rangelength="[2,20]" data-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">确认新密码</label>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control" name="theme_option_social_github"
                                                   placeholder="确认新密码" data-rangelength="[2,20]"
                                                   data-equalto="#firstPwd" data-required="true" id="secondPwd">
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-primary"
                                                onclick="saveThemeOptions('update_pwd')">
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


<!-- 表单验证 -->
<script src="<c:url value='/js/parsley/parsley.min.js'/>" cache="false"></script>
<script src="<c:url value='/js/parsley/parsley.extend.js'/>" cache="false"></script>

<script>
    var hutao = new $.hutao();

    /**
     * Admin 主题设置
     * @param $form_name form表单名称
     */
    function saveThemeOptions($form_name) {
        if (!$('#' + $form_name).parsley().validate()) {
            return;
        }

        var url;
        var params;

        if ($form_name == 'theme_info') {
            url = '<c:url value="/theme/admin/info"/>';
        }
        if ($form_name == 'update_pwd') {
            url = '<c:url value="/user/updatePassword"/>';
        }
        params = $("#" + $form_name).serialize();

        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (result) {
                handlerResult(result, function () {
                    update_theme_success($form_name)
                });
            },
            error: function () {
                hutao.errorAlert('操作失败');
            }
        });
    }

    function update_theme_success($form_name) {
        if ($form_name == 'theme_info') {
            hutao.successAlert({
                text: '设置成功'
            }, function () {
                setTimeout(function () {
                    window.location.reload();
                }, 700);
            });
        }
        if ($form_name == 'update_pwd') {
            hutao.successAlert({
                text: '设置成功'
            }, function () {
                $("#oldPwd").val("");
                $("#firstPwd").val("");
                $("#secondPwd").val("");
            });
        }
    }
</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>
