<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="bg-dark">

<head>
    <meta charset="utf-8"/>
    <title>您已登陆 | 文章管理系统</title>
    <meta name="description"
          content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="<c:url value='/css/plugins/sweetalert/sweetalert.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/css/semantic/semantic.min.css"/>">
    <link rel="stylesheet" href="<c:url value='/js/layui/css/layui.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/fuelux/fuelux.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/js/plugins/buzyload/app.min.css'/>" type="text/css"/>

    <!-- / jquery -->
    <script src="<c:url value='/js/jquery-3.2.1.js'/>"></script>
    <script src="<c:url value='/js/print/jquery.printarea.js'/>"></script>

    <!--[if lt IE 9]>
    <script src="<c:url value='/js/ie/html5shiv.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/respond.min.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/excanvas.js'/>" cache="false"></script>
    <![endif]-->

    <link rel="icon" href="<c:url value='/images/favicon.ico'/>" type="image/x-icon"/>

    <style>
        * {
            font-family: 'Helvetica Neue', Helvetica, 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', Arial, sans-serif;
        }
    </style>


</head>

<body class="lockme" onclick="click_change()">
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">


    <div class="ui container" style="padding-top:10%">
        <div class="ui grid center aligned">
            <div class="row">
                <div class="sixteen wide tablet six wide computer column">
                    <img class="ui tiny centered circular image myHeadImg"
                         src="<c:url value='/images/avatar_default.jpg'/>"
                         alt="label-image"/>
                    <h5 class="ui header inverted">${sessionScope.loginUser.username}　您已登陆</h5>
                    <div class="ui action input">
                        <a class="btn btn-dark  btn-sm" href="javascript:;" onclick="user_quit()">
                            退出登陆
                        </a>　
                        <a class="btn btn-danger  btn-sm" href="<c:url value='/admin/index'/>">进入主页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder" style="padding-top: 220px">
        <p>
            <small id="footer_text">文章管理系统 | By HuTao<br>
                &copy; 2017
            </small>
        </p>
    </div>
</footer>
<!-- / footer -->


<script src="<c:url value='/js/semantic/semantic.min.js'/>" cache="false"></script>
<script src="<c:url value='/js/plugins/custer/custom-modal.js'/>" cache="false"></script>

<script src="<c:url value='/js/app.v2.js'/>"></script>
<!-- fuelux -->
<script src="<c:url value='/js/fuelux/fuelux.js'/>" cache="false"></script>
<!-- 表单验证 -->
<script src="<c:url value='/js/parsley/parsley.min.js'/>" cache="false"></script>
<script src="<c:url value='/js/parsley/parsley.extend.js'/>" cache="false"></script>

<script src="<c:url value='/js/iden/identicon.js'/>"></script>
<script src="<c:url value='/js/iden/pnglib.js'/>"></script>

<script src="<c:url value='/js/plugins/sweetalert/sweetalert.min.js'/>"></script>
<script src="<c:url value='/js/plugins/buzyload/app.min.js'/>"></script>
<script src="<c:url value='/js/demo/myBase.js'/>"></script>

<%--导入头像文件--%>
<%@include file="/WEB-INF/jsps/format/admin/headImg.jsp" %>

<script>
    var hutao = new $.hutao();

    function changeBg() {
        var colors = ["#dedddd", "#dedddd", "#dedddd", "#dedddd", "#dedddd", "#717171", "#dedddd", "#dedddd", "#717171", "#dedddd", "#dedddd", "#dedddd", "#dedddd", "#dedddd", "#717171", "#dedddd", "#dedddd", "#717171"];
        var bg_colors = ["#F25F5C", "#247BA0", "#8e44ad", "#ED6A5A", "#32936F", "#2c3e50", "#E83F6F", "#32936F", "#2E294E", "#F25F5C", "#247BA0", "#8e44ad", "#ED6A5A", "#32936F", "#2c3e50", "#E83F6F", "#32936F", "#2E294E"];


        var rand = Math.floor(Math.random() * colors.length);

        $('body').css("background-color", bg_colors[rand]);
        $('#footer_text').css("color", colors[rand]);
    }

    changeBg();

    function click_change() {
        changeBg();
    }

    function user_quit() {
        swal({
                title: "确认退出登录？",
                text: "确认退出登录",
                type: "warning",
                showCancelButton: true,              //是否显示“取消”按钮。
                cancelButtonText: "取消",            //按钮内容
                cancelButtonColor: '#d33',
                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: '确定',
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function () {
                hutao.post({
                    type: 'get',
                    url: '<c:url value="/user/quit"/>',
                    success: function (result) {
                        handlerResult(result, post_success);
                    }
                });
            });
    }

    function post_success() {
        hutao.successAlert({
            title: "退出成功",
            text: "退出成功，即将跳转"
        });

        setTimeout(function () {
            window.location.href = '<c:url value="/user/showLogin"/>';;
        }, 700);
    }

</script>

<script></script>


</body>

</html>
