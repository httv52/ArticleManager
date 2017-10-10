<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>涛哥的小窝　| 文章管理系统</title>
    <meta name="description"
          content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/app.v2.css" type="text/css">
    <link rel="stylesheet" href="css/landing.css" type="text/css" cache="false">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>

    <script src="<c:url value="/js/jquery.min.js"/> "></script>

    <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js" cache="false"></script>
    <script src="js/ie/respond.min.js" cache="false"></script>
    <script src="js/ie/excanvas.js" cache="false"></script>
    <![endif]-->
    <style>
        * {
            font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
        }

        .navbar-brand img {
            max-height: 38px;
        }

        textarea {
            outline: none;
            resize: none;
        }
    </style>
</head>
<body style="">
<!-- header -->
<header id="header" class="navbar navbar-fixed-top bg-white box-shadow b-b b-light affix-top" data-spy="affix"
        data-offset-top="1">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand"><img src="images/logo.png" class="m-r-sm">
                <span class="text-muted">
                    <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">涛哥的小窝</font>
                    </font>
                </span>
            </a>
            <button class="btn btn-link visible-xs" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                <i class="fa fa-bars"></i>
            </button>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="<c:url value="/home"/> ">
                        <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">首页</font>
                        </font>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/guide"/>">
                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">指南</font></font>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/index/hutao"/>"><font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">博客</font></font>
                    </a>
                </li>

                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                        <div style="display: inline-block;padding-top: 12px">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="thumb-sm avatar pull-left">
                                    <img src="<c:url value='/images/avatar_default.jpg'/>" class="img-circle myHeadImg">
                                </span>　
                                <span class="font-bold">${sessionScope.loginUser.screenName}</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight">
                                <span class="arrow top"></span>
                                <li>
                                    <a href="<c:url value="/index/"/>${sessionScope.loginUser.username}"><i
                                            class="fa fa-user"></i>　我的博客</a>
                                </li>
                                <li>
                                    <a href="<c:url value="/admin/index"/>"><i class="fa fa-tachometer"></i>　我的后台</a>
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
                        <li>
                            <div class="m-t-sm" style="margin-top: 7px;">
                                <a href="<c:url value="/user/showLogin"/> " class="btn btn-link btn-sm" target="_blank">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">登录</font></font>
                                </a>
                                <a href="<c:url value="/user/showRegister"/>" class="btn btn-sm btn-success m-l"
                                   target="_blank">
                                    <strong><font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">注册</font></font>
                                    </strong>
                                </a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</header>
<!-- / header -->