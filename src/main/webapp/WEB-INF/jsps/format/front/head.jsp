<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String imgPath = request.getScheme() + "://" + request.getServerName() + ":8081/SSMDemo2_img";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="${theme.keyword}"/>
    <meta name="description" content="${theme.describe}"/>
    <title>${theme.autherName}</title>
    <%--<c:choose>--%>
        <%--<c:when test="${not empty theme.logoImg}">--%>
            <%--<link rel="icon" href="<%=imgPath%>${theme.logoImg}" type="image/x-icon"/>--%>
        <%--</c:when>--%>
        <%--<c:otherwise>--%>
            <%--<link rel="icon" href="<c:url value='/images/favicon.ico'/>" type="image/x-icon"/>--%>
        <%--</c:otherwise>--%>
    <%--</c:choose>--%>

    <link rel="stylesheet" href="<c:url value="/css/semantic/semantic.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/semantic/main.css"/>">
    <link href="<c:url value="/css/demo/xcode.min.css"/> " rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/css/plugins/sweetalert/sweetalert.css'/>" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/css/plugins/toastr/toastr.min.css'/>" type="text/css"/>
    <link href="<c:url value="/css/app.v2.css"/> " rel="stylesheet">
    <link href="<c:url value="/js/tale/style.min.css"/> " rel="stylesheet">
    <link href="<c:url value="/css/a.css"/>" rel="stylesheet">
    <link href="<c:url value="/js/pacejs/pace.css"/>" rel="stylesheet">


    <script src="<c:url value="/js/jquery.min.js"/> "></script>
    <script src="<c:url value='/js/plugins/sweetalert/sweetalert.min.js'/>"></script>

    <script src="<c:url value='/js/plugins/toastr/toastr.min.js'/>"></script>
    <script src="<c:url value='/js/app.v2.js'/>"></script>
    <script src="<c:url value='/js/iden/identicon.js'/>"></script>
    <script src="<c:url value='/js/iden/pnglib.js'/>"></script>
    <script src="<c:url value="/js/demo/myBase.js"/> "></script>

    <script data-pace-options='{ "ajax": false }' src="<c:url value="/js/pacejs/pace.js"/>"></script>

    <link rel="icon" href="<c:url value='/images/favicon.ico'/>" type="image/x-icon"/>

    <!--[if lt IE 9]>
    <script src="<c:url value='/js/ie/html5shiv.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/respond.min.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/excanvas.js'/>" cache="false"></script>
    <![endif]-->

    <style>
        body{
            color: #616060;
        }

        .navbar-container {
            padding-right: 50px;
        }

        .post-list-item-container .item-label .item-meta {
            border-top: 1px solid #f2f2f2;
            position: absolute;
            right: 0;
            bottom: -9px;
            width: 100%;
            padding: 7px 11px 15px;
            text-align: right;
        }

        .post-list-item-container {
            box-shadow: 0 1.5px 4px rgba(0, 0, 0, 0.24), 0 1.5px 6px rgba(0, 0, 0, 0.12);
            -webkit-transition: box-shadow 1s ease;
            -o-transition: box-shadow 1s ease;
            transition: box-shadow 1s ease;
        }

        .footer-meta .footer-container {
            background-color: #fff;
        }

        .navbar-logo {
            margin-top: -21px;
            padding-left: 50px;
        }

        .thumb-sm {
            width: 40px;
        }

        .navbar-logo img {
            height: 38px;
        }

        .navbar-container li a {
            text-align: left;
            margin: 4px;
        }

        .contentControl_1 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        .contentControl_2 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .contentControl_3 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        .contentControl_6 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 6;
            -webkit-box-orient: vertical;
        }

        .post-list-item-container .item-label .item-title a {
            font-size: 14px;
        }

        .post-list-item-container .item-label .item-meta .item-meta-ico {
            border-radius: 20%;
        }

        /*文章详情页*/
        .post-header .title {
            word-break: break-word !important;
            word-break: break-all;
            margin: 20px 0 0;
            font-family: -apple-system, SF UI Display, Arial, PingFang SC, Hiragino Sans GB, Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
            font-size: 34px;
            font-weight: 700;
            line-height: 1.3;
        }

        .author {
            margin: 30px 0 40px;
        }

        .myAvatar img {
            width: 48px;
            border: 1px solid #ddd;
            border-radius: 50%;
        }

        .author .info {
            vertical-align: middle;
            display: inline-block;
            margin-left: 8px;
        }

        .author .meta {
            margin-top: 5px;
            font-size: 13px;
            color: #969696;
        }

        a {
            color: #969696;
        }

        .page-page p, .page-page ul {
            /*word-break: break-word !important;*/
            word-break: break-all;
        }

        .post-content p {
            color: #525151;
            /*word-break: break-word !important;*/
            word-break: break-all;
            font-size: 16px;
            font-weight: 400;
            line-height: 1.7;
        }

        .page-page p {
            margin: 0 0 25px;
        }

        .page-page p {
            margin: 0 0 10px;
        }

        .page-page * {
            coloe: #333;
        }

        .show-foot .notebook {
            font-size: 12px;
            color: #9b9b9b;
        }

        .myArticle .copyright {
            float: right;
            margin-top: 5px;
            font-size: 12px;
            line-height: 1.7;
            color: #9b9b9b;
        }

        /*评论页*/
        .page-comment {
            max-width: 700px;
            padding: 20px 25px 20px;
        }

        .new-comment .myAvatar {
            position: absolute;
            left: -48px;
            margin-right: 5px;
            width: 38px;
            height: 38px;
        }

        .sign-container{
            padding: 10px 15px;
            width: 100%;
            height: 80px;
            font-size: 13px;
            border: 1px solid #dcdcdc;
            border-radius: 4px;
            background-color: hsla(0, 0%, 71%, .1);
            resize: none;
            display: inline-block;
            vertical-align: top;
            outline-style: none
        }

        .new-comment .myAvatar img {
            width: 100%;
            height: 100%;
            border: 1px solid #ddd;
            border-radius: 50%;
        }

        .comment-list:before{
            background: #ffffff;
        }

        .hljs-section, .hljs-class .hljs-title, .hljs-type, .hljs-attr, .hljs-built_in, .hljs-builtin-name, .hljs-params {
            color: #956cc4;
        }

        pre {
            position: relative;
            margin-bottom: 24px;
            border-radius: 3px;
            border: 1px solid #C3CCD0;
            background: #FFF;
            overflow: hidden;
        }

        code {
            display: block;
            padding: 12px 24px;
            overflow-y: auto;
            font-weight: 300;
            /*font-family: Menlo, monospace;*/
            font-size: 0.8em;
        }

        code.has-numbering {
            margin-left: 21px;
        }

        .pre-numbering {
            position: absolute;
            top: 0;
            left: 0;
            width: 25px;
            padding: 8px 3px 6px 0;
            border-right: 1px solid #C3CCD0;
            border-radius: 3px 0 0 3px;
            background-color: #2b313c;
            text-align: right;
            /*font-family: Menlo, monospace;*/
            font-size: 0.8em;
            color: #AAA;
            margin-bottom: 5px;
        }
        .pre-numbering li{
            line-height: 20px;
        }

        code {
            padding: 2px 4px;
            font-size: 90%;
            color: #c7254e;
            background-color: #f9f2f4;
            border-radius: 4px;
            display: inline;
        }

        table {
            display: table;
            table-layout:auto;
        }

        .tag-list li a {
            font-size: 10px;
            background-color: #f3f3f4;
            padding: 5px 12px;
            color: #717171;
            border-radius: 2px;
            border: 1px solid #e7eaec;
            margin-right: 5px;
            margin-top: 5px;
            display: block;
        }

        .tag-list li {
            float: left;
        }

        ul.notes li, ul.tag-list li {
            list-style: none;
        }

        .myCirBtn{
            text-align: center;
            box-sizing: border-box;
            display: inline-block;
            margin-bottom: 0;
            font-weight: 400;
            text-align: center;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            border: 1px solid transparent;
            white-space: nowrap;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            margin-bottom: 20px;
            padding: 8px 25px;
            font-size: 16px;
            background-color: #5d482f;
            border-radius: 20px;
            color: #ffffff;
            height: 40px;
            line-height: 24px;
        }

        .label ,.ui.label{
            font-weight:normal;
        }

        .page-page {
            padding: 80px 25px 20px;
        }

        .header {
            line-height: 50px;
            height: 52px;
        }

        element.style {
        }
        .navbar-container {
            padding-right: 36px;
        }

        .navbar-container {
            height: 57px;
        }

        .navbar-search {
            line-height: 50px;
        }

        .navbar-search form{
            margin-top: -18px;
        }
    </style>
</head>
<body id="topAnchor" gtools_scp_screen_capture_injected="true">
<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
<header class="header bg-white" id="navbar-header">
    <div class="navbar-container" >
        <a href="<c:url value="/index/"/>${user.username} " class="navbar-logo">
            <c:choose>
                <c:when test="${empty theme.logoImg}">
                    <img src="<c:url value='/images/logo.png'/>" alt="博客LOGO"/>
                </c:when>
                <c:otherwise>
                    <img src="${theme.logoImg}" alt="博客LOGO"/>
                </c:otherwise>
            </c:choose>
            <span class="text-muted">
                <span style="vertical-align: inherit;">${theme.autherName}</span>
            </span>
        </a>
        <div class="navbar-menu">
            <a href="#">归档</a>
            <a href="#">友链</a>
            <a href="#">关于</a>
        </div>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form role="search" onsubmit="return false;" style="padding-right: 180px">
                <span class="search-box">
                    <input type="text" id="search-inp" class="input" placeholder="搜索..." maxlength="30"
                           autocomplete="off">
                </span>
            </form>
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                <div style="display: inline-block;">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="thumb-sm avatar pull-left">
                   <img src="<c:url value='/images/avatar_default.jpg'/>" class="img-circle myHeadImg">
                </span>　
                        <span class="font-bold">${sessionScope.loginUser.screenName}</span>　<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight">
                        <span class="arrow top"></span>
                        <li>
                            <a href="<c:url value="/home"/>" data-no-instant><i class="fa fa-home"></i>　首页</a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/index"/>" data-no-instant><i class="fa fa-tachometer"></i>　我的后台</a>
                        </li>
                        <!--分割线-->
                        <li class="divider"></li>
                        <li>
                            <a href="" data-no-instant><i class="fa fa-plane"></i>　重新登录</a>
                        </li>
                        <li>
                            <a href="<c:url value="/user/quit"/>" data-no-instant><i class="fa fa-sign-out"></i>　退出</a>
                        </li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="mini ui buttons" style="margin-top: 7px;">
                    <a class="ui yellow button" href="<c:url value="/user/showLogin"/>" target="_blank">登录</a>
                    <div class="or"></div>
                    <a class="ui positive button" href="<c:url value="/user/showRegister"/>" target="_blank">注册</a>
                </div>
            </c:otherwise>
        </c:choose>

        <%--<div class="navbar-mobile-menu" onclick="">--%>
        <%--<span class="icon-menu cross"><span class="middle"></span></span>--%>
        <%--<ul>--%>
        <%--<li><a href="#">归档</a></li>--%>
        <%--<li><a href="#">友链</a></li>--%>
        <%--<li><a href="#">关于</a></li>--%>
        <%--</ul>--%>
        <%--</div>--%>
    </div>
</header>
