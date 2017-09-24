<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="app">

<head>
    <meta charset="utf-8"/>
    <title>欢迎页 | 文章管理系统</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/mditor/css/mditor.min.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/plugins/webuploader/webuploader.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/demo/webuploader-demo.css'/>" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/js/layui/css/layui.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/layer-v3.1.0/layer/theme/default/dist.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/layer-v3.1.0/layer/theme/default/layer.css'/>" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/css/style.css'/>" type="text/css"/>


    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/fuelux/fuelux.css'/>" type="text/css"/>


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

        .btn-shadow:hover {
            box-shadow: 2px 2px 3px #363636; /* for opera or ie9 */
            -moz-box-shadow: 2px 2px 3px #363636; /* for firefox */
            -webkit-box-shadow: 2px 2px 3px #363636; /* for safari or chrome */
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

        .footer {
            margin: 0px;
        }

        #mypillbox {
            background: #fff;
        }

        .btn-purple, .btn-purple:hover, .btn-purple:focus, .btn-purple:active {
            background-color: #7e57c2 !important;
            border: 1px solid #7e57c2 !important;
            color: #fff;
        }

        .note-toolbar {
            text-align: center;
        }

        .note-editor.note-frame {
            border: none;
        }

        .note-editor .note-toolbar {
            background-color: #f5f5f5;
            padding-bottom: 10px;
        }

        .note-toolbar .note-btn-group {
            margin: 0;
        }

        .note-toolbar .note-btn {
            border: none;
        }

        #articleForm #dropzone {
            min-height: 200px;
            background-color: #dbdde0;
            line-height: 200px;
            margin-bottom: 10px;
        }

        #articleForm .dropzone {
            border: 1px dashed #8662c6;
            border-radius: 5px;
            background: white;
        }

        #articleForm .dropzone .dz-message {
            font-weight: 400;
        }

        #articleForm .dropzone .dz-message .note {
            font-size: 0.8em;
            font-weight: 200;
            display: block;
            margin-top: 1.4rem;
        }
        .navbar-brand {
            height: auto;
        }
        .navbar-brand>img {
            display: inherit;
        }

        #articleImgText {
            font-size: 30px;
        }

    </style>

</head>

<body>
<!--垂直布局-->
<section class="vbox">

    <!--顶部信息框-->
    <header class="bg-dark dk header navbar navbar-fixed-top-xs nav-user_a">
        <!--全屏化 以及移动端-->
        <div class="navbar-header aside-md bg-dark">
            <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav"> <i
                    class="fa fa-bars"></i> </a>
            <a href="#" class="navbar-brand" data-toggle="fullscreen">
                <img src="<c:url value='/images/logo.png'/>" class="m-r-sm">文章管理系统</a>

            <div class="btn btn-link visible-xs">
                <a data-toggle="class:show" data-target=".nav-user"><i class="fa fa-cog"></i></a>
            </div>
            <!--<a class="btn btn-link visible-xs" data-toggle="class:show" data-target=".nav-user"> <i class="fa fa-cog"></i> </a>-->
        </div>

        <!--顶栏左侧 个人信息-->
        <ul class="nav navbar-nav hidden-xs">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"> <i class="fa fa-building-o"></i> <span
                        class="font-bold">个人信息</span> </a>
                <section class="dropdown-menu aside-xl on animated fadeInLeft no-borders lt">
                    <div class="wrapper lter m-t-n-xs">
                        <a href="#" class="thumb pull-left m-r">
                            <img src="<c:url value='/images/avatar_default.jpg'/>" class="img-circle headImg">
                        </a>
                        <div class="clear">
                            <span class="text-white font-bold">@${sessionScope.loginUser.screenName} </span>
                            <small class="block">姓名</small>
                            <a href="#" class="btn btn-xs btn-success m-t-xs">修改资料</a>
                        </div>
                    </div>
                    <div class="row m-l-none m-r-none m-b-n-xs text-center">
                        <div class="col-xs-4">
                            <div class="padder-v">
                                <small class="text-muted">登录名</small>
                                <span class="m-b-xs h5 block text-white">${sessionScope.loginUser.username}</span></div>
                        </div>
                        <div class="col-xs-4 dk">
                            <div class="padder-v">
                                <small class="text-muted">文章数</small>
                                <span class="m-b-xs h5 block text-white"> 12 </span></div>
                        </div>
                        <div class="col-xs-4">
                            <div class="padder-v">
                                <small class="text-muted">附件数</small>
                                <span class="m-b-xs h5 block text-white">10</span></div>
                        </div>
                    </div>
                </section>
            </li>
            <!--可以继续添加-->
            <li>
                <div class="m-t m-l">
                    <a href="" class="dropdown-toggle btn btn-xs btn-primary" title="Upgrade"><i
                            class="fa fa-long-arrow-up"></i></a>
                </div>
            </li>
        </ul>

        <!--顶栏右边-->
        <ul class="nav navbar-nav navbar-right hidden-xs nav-user">
            <!-- 消息框-->
            <li class="hidden-xs"><a href="#" class="dropdown-toggle dk" data-toggle="dropdown"> <i
                    class="fa fa-bell"></i> <span class="badge badge-sm up bg-danger m-l-n-sm count"
                                                  style="display: inline-block;">3</span> </a>
                <section class="dropdown-menu aside-xl">
                    <section class="panel bg-white">
                        <header class="panel-heading b-light bg-light"><strong>You have <span class="count"
                                                                                              style="display: inline;">3</span>
                            notifications</strong></header>
                        <div class="list-group list-group-alt animated fadeInRight"><a href="#"
                                                                                       class="media list-group-item"
                                                                                       style="display: block;"><span
                                class="pull-left thumb-sm text-center"><i
                                class="fa fa-envelope-o fa-2x text-success"></i></span><span
                                class="media-body block m-b-none">Sophi sent you a email<br><small class="text-muted">1 minutes ago</small></span></a>
                            <a href="#" class="media list-group-item"> <span class="pull-left thumb-sm"> <img
                                    img src="<c:url value='/images/avatar_default.jpg'/>" class="img-circle headImg"> </span> <span
                                    class="media-body block m-b-none"> Use awesome animate.css<br>
              <small class="text-muted">10 minutes ago</small> </span> </a> <a href="#"
                                                                               class="media list-group-item"> <span
                                    class="media-body block m-b-none"> 1.0 initial released<br>
              <small class="text-muted">1 hour ago</small> </span> </a></div>
                        <footer class="panel-footer text-sm"><a href="#" class="pull-right"><i
                                class="fa fa-cog"></i></a> <a href="#notes"
                                                              data-toggle="class:show animated fadeInRight">See all the
                            notifications</a></footer>
                    </section>
                </section>
            </li>

            <!-- 搜索框-->
            <li class="dropdown hidden-xs"><a href="#" class="dropdown-toggle dker" data-toggle="dropdown"><i
                    class="fa fa-fw fa-search"></i></a>
                <section class="dropdown-menu aside-xl animated fadeInUp">
                    <section class="panel bg-white">
                        <form role="search">
                            <div class="form-group wrapper m-b-none">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="搜索">
                                    <span class="input-group-btn">
                  <button type="submit" class="btn btn-info btn-icon"><i class="fa fa-search"></i></button>
                  </span></div>
                            </div>
                        </form>
                    </section>
                </section>
            </li>

            <!-- 头像+个人信息-->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="thumb-sm avatar pull-left">
                        <img src="<c:url value='/images/avatar_default.jpg'/> " class="headImg">
                    </span>　
                    <span class="font-bold">${sessionScope.loginUser.screenName}</span>　<b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <span class="arrow top"></span>
                    <li>
                        <a href=""><i class="fa fa-key"></i>　修改密码</a>
                    </li>
                    <!--分割线-->
                    <li class="divider"></li>
                    <li>
                        <a href=""><i class="fa fa-plane"></i>　重新登录</a>
                    </li>
                    <li>
                        <%--TODO 退出--%>
                        <a href="<c:url value='/user/quit'/> "><i class="fa fa-sign-out"></i>　退出</a>
                    </li>
                </ul>
            </li>
        </ul>

    </header>
    <!-- /顶部信息框 -->

    <!--主体-->
    <section>
        <!--水平完全填充-->
        <section class="hbox stretch">
            <!-- 边缘 -->
            <aside class="bg-dark lter aside-md hidden-print" id="nav">
                <section class="vbox">

                    <header class="header bg-primary lter text-center clearfix">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-dark btn-icon" title="New project"><i
                                    class="fa fa-plus"></i></button>
                            <div class="btn-group hidden-nav-xs">
                                <button type="button" class="btn btn-sm btn-primary dropdown-toggle"
                                        data-toggle="dropdown"> 编辑文章 <span class="caret"></span></button>
                                <ul class="dropdown-menu text-left">
                                    <li><a href="<c:url value="/admin/publish"/> ">发布新文章</a></li>
                                    <li><a href="#">修改文章</a></li>
                                </ul>
                            </div>
                        </div>
                    </header>

                    <!--边缘控件-->
                    <!--wf意味着这个vbox有一个页脚-->
                    <section class="w-f scrollable">
                        <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0"
                             data-size="5px" data-color="#333333">
                            <!-- nav -->
                            <nav class="nav-primary hidden-xs">

                                <ul class="nav" id="navList">
                                    <!-- 1 工作集-->
                                    <li class="first">

                                        <a href="<c:url value="/admin/index"/> " class="active">

                                            <i class="fa fa-dashboard icon"> <b class="bg-danger"></b> </i>
                                            <span>工作集</span>
                                        </a>
                                    </li>

                                    <!-- 2 文章管理-->
                                    <li class="first">
                                        <a href=""> <i class="fa fa-edit icon"> <b class="bg-warning"></b> </i> <span
                                                class="pull-right faState"> <i class="fa fa-angle-down text"></i> <i
                                                class="fa fa-angle-up text-active"></i> </span> <span>文章管理</span> </a>
                                        <ul class="nav lt">
                                            <li class="second" id="1">
                                                <a href="<c:url value="/admin/articleManege"/> ">
                                                    <i class="fa fa-angle-right"></i> <span>文管管理</span> </a>
                                            </li>
                                            <li class="second" id="2">
                                                <a href=""> <i class="fa fa-angle-right"></i> <span>评论管理</span> </a>
                                            </li>
                                            <li class="second">
                                                <a href=""> <i class="fa fa-angle-right"></i> <span>分类/标签管理</span> </a>
                                            </li>
                                        </ul>
                                    </li>

                                    <!-- 3  后台管理-->
                                    <li class="first">
                                        <a href=""> <i class="fa fa-flask icon"> <b class="bg-success"></b> </i> <span
                                                class="pull-right faState"> <i class="fa fa-angle-down text"></i> <i
                                                class="fa fa-angle-up text-active"></i> </span> <span>后台管理</span> </a>
                                        <ul class="nav lt">
                                            <li class="second">
                                                <a href="#">
                                                    <i class="fa fa-angle-right"></i> <span>文件管理</span>
                                                </a>
                                            </li>
                                            <li class="second">
                                                <a href="#">
                                                    <i class="fa fa-angle-right"></i> <span>链接管理</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>

                                    <!-- 4 系统设置-->
                                    <li class="first">
                                        <a href="#uikit"> <i class="fa fa-gear icon"> <b class="bg-primary"></b> </i>
                                            <span class="pull-right faState"> <i class="fa fa-angle-down text"></i> <i
                                                    class="fa fa-angle-up text-active"></i> </span> <span>系统设置</span>
                                        </a>
                                        <ul class="nav lt">
                                            <li class="second">
                                                <a href=""> <i class="fa fa-angle-right"></i> <span>站点设置</span> </a>
                                            </li>
                                            <li class="second">
                                                <a href=""> <i class="fa fa-angle-right"></i> <span>主题设置</span> </a>
                                            </li>
                                            <li class="second">
                                                <a href="#">
                                                    <i class="fa fa-angle-right"></i> <span>关于页设置</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>

                                    <!-- 5 消息-->
                                    <li class="first">
                                        <a href="<c:url value='/admin/index'/>">
                                            <b class="badge bg-danger pull-right">3</b>

                                            <i class="fa fa-envelope-o icon"> <b class="bg-primary dker"></b> </i>
                                            <span>消息</span>
                                        </a>
                                    </li>

                                    <!-- 6 发布文章-->
                                    <li class="first">
                                        <a href="<c:url value='/admin/publish'/> " class="active">

                                            <i class="fa fa-pencil icon"> <b class="bg-info"></b> </i>
                                            <span>发布文章</span>
                                        </a>
                                    </li>

                                </ul>
                            </nav>
                            <!-- / nav -->
                        </div>
                    </section>

                    <!--边脚-->
                    <footer class="footer lt hidden-xs b-t b-dark">
								<span class="pull-left hidden-nav-xs text-center" style="padding-top: 8px;">
									<small>文章管理系统<br>
					                &copy; 2017 | By HuTao
					            </small>
								</span>
                        <div class="btn-group pull-right">
                            <a href="#nav" title="全屏化" class="btn btn-sm btn-dark btn-icon hidden-nav-xs myFullscreen"
                               data-toggle="fullscreen"> <i class="fa fa-expand text"></i></a>
                            <a href="#nav" title="收缩菜单栏" data-toggle="class:nav-xs"
                               class="btn btn-sm btn-dark btn-icon"> <i class="fa fa-angle-left text"></i> <i
                                    class="fa fa-angle-right text-active"></i> </a>
                        </div>
                        <!--<div class="btn-group hidden-nav-xs">
                            <button type="button" title="Chats" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#chat"><i class="fa fa-comment-o"></i></button>
                            <button type="button" title="Contacts" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#invite"><i class="fa fa-facebook"></i></button>
                        </div>-->
                    </footer>
                </section>
            </aside>
            <!-- /边缘 -->
