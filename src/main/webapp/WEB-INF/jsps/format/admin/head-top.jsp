<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="app">

<head>
    <meta charset="utf-8"/>
    <title>欢迎页 | 文章管理系统</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="<c:url value='/css/h+/style.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/layui/css/layui.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/layer-v3.1.0/layer/theme/default/dist.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/layer-v3.1.0/layer/theme/default/layer.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>

    <script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
    <script src="<c:url value='/js/iden/identicon.js'/>"></script>
    <script src="<c:url value='/js/iden/pnglib.js'/>"></script>

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

        .navbar-brand img {
            max-height: 31px;
        }

        #btn_top {
            position: fixed;
            bottom: 40px;
            right: 40px;
            display: none;
            box-shadow: 2px 2px 5px #363636;
        }

        .bg-purple {
            background-color: #7e57c2 !important;
            color: #fff;
        }

        .text-purple {
            /*background-color: #7e57c2 !important;*/
            color: #9879ce;
        }

        .text-primary-li {
            color: #79ca89;
        }

        .nav > li.active {
            border-left: none;
            background: #293846;
        }

        .footer{
            margin: 0px;
        }

    </style>

</head>

<body>
<!--垂直布局-->
<section class="vbox">
