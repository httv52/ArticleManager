<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en" class="bg-dark">

<head>
    <meta charset="utf-8"/>
    <title>404出错 | 文章管理系统</title>
    <meta name="description"
          content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>

    <!--[if lt IE 9]>
    <script src="<c:url value='/js/ie/html5shiv.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/respond.min.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/excanvas.js'/>" cache="false"></script>
    <![endif]-->

    <link rel="icon" href="<c:url value='/images/favicon.ico'/>" type="image/x-icon"/>

    <style>

        #content {
            margin-top: 10px;
        }

        #footer{
            padding-top: 190px;
        }
    </style>

</head>

<body>
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
    <div class="container aside-xxl">
        <div class="text-center">
            <div class="thumb-md">
                <img src="<c:url value='/images/logo.png'/> ">
            </div>
        </div>
        <a class="navbar-brand block animated fadeInDownBig" href="">文章管理系统　|　错误警告页面</a>

        <div class="text-center">
            <h1 style="color: #fff0cc;"><i class="fa fa-spinner fa fa-spin fa fa-x"></i></h1>
        </div>

        <div class="alert alert-danger alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <h4><i class="fa fa-bell-alt"></i>访问产生错误错误</h4>
            <p>未知错误</p>
            <p style="padding-top: 10px">
                <button type="button" class="btn btn-dark" onclick="window.history.go(-1)">返回上一步</button>
                <a href="#" type="button" class="btn btn-default">回到主页</a>
            </p>
        </div>

    </div>
</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">
        <p>
            <small>文章管理系统 | By HuTao<br>
                &copy; 2017
            </small>
        </p>
    </div>
</footer>
<!-- / footer -->
<script src="<c:url value='/js/app.v2.js'/>"></script>

</body>

</html>
