<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--导入头文件--%>
<%@include file="/WEB-INF/jsps/format/admin/head.jsp" %>


<!-- 中间内容 -->
<section id="content">

    <section class="vbox">
        <section class="scrollable padder" id="topAnchor">
            <!--路径-->
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li>
                    <a href="<c:url value="/admin/index.html"/> "><i class="fa fa-home"></i> 主页</a>
                </li>
                <li class="active">
                    <i class="fa fa-dashboard"> 工作集</i>
                </li>
            </ul>

            <div class="m-b-md">
                <h3 class="m-b-none"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">工作集</span></span></h3>
                <small><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">欢迎回来，${sessionScope.loginUser.screenName}</span></span>
                </small>
            </div>

            <%--总览--%>
            <section class="panel panel-default">
                <div class="row m-l-none m-r-none bg-light lter">
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-info dker">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-info"></i>
                            <i class="fa fa-male fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>12</strong></span>
                            <span class="">篇文章</span>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-danger">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-warning"></i>
                            <i class="fa fa-male fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>12</strong></span>
                            <span class="">条留言</span>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-primary">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-primary-li"></i>
                            <i class="fa fa-male fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>12</strong></span>
                            <span class="">个链接</span>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-success bg-purple">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-success text-purple"></i>
                            <i class="fa fa-male fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>12</strong></span>
                            <span class="">篇文章</span>
                        </a>
                    </div>
                </div>
            </section>
            <%--//总览--%>
            <div class="line line-dashed" style="padding-bottom: 10px"></div>


            <%--详情--%>
            <div class="row">
                <%--文章和评论--%>

                <%--最新文章--%>
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <%--工具栏--%>
                        <div class="ibox-title">
                            <h5>最新文章</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link" data-toggle="tooltip" data-placement="top" title="折叠">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                                <a class="close-link" data-toggle="tooltip" data-placement="top" title="关闭">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>

                        <div class="ibox-content" style="display: block;">
                            <%--<c:if test="${articleList == null}">

                            </c:if>--%>
                            <div>
                                <article class="media">
                                    <span class="pull-left thumb-sm">
                                        <i class="fa fa-file-o fa-3x icon-muted"></i>
                                    </span>
                                    <div class="media-body">
                                        <div class="pull-right media-xs text-center text-muted">
                                            <span class="text-muted m-l-sm pull-right"> <i
                                                    class="fa fa-clock-o"></i><span
                                                    style="vertical-align: inherit;"><span
                                                    style="vertical-align: inherit;"> 2017-10-10</span></span>
                                            </span>
                                        </div>
                                        <a href="#" class="h4">通过javax.mail发送邮件(示例gmail、qq)</a>
                                        <small class="block">
                                            <span class="label label-info">政治</span></small>
                                        <small class="block m-t-sm">
                                            <a href="#">最近学习了一下javax.mail，想通过gmail邮箱发送邮件到qq邮箱。但是由于gmail的两步验证，一直授权无法通过。</a>
                                        </small>
                                    </div>
                                </article>
                                <div class="line pull-in"></div>

                                <article class="media">
                                    <div class="media-body text-center">
                                        <span class="thumb-sm">
                                            <i class="fa fa-file-o fa-3x icon-muted"></i>
                                        </span>
                                        <span class="h3">暂无文章</span><br>

                                        <div style="padding: 20px">
                                            <a href="<c:url value="/admin/publish"/> " class="block h4 text-success">点击前往发布文章</a>
                                        </div>
                                    </div>
                                </article>
                                <div class="line pull-in"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- //最新文章--%>

                <%--最新评论--%>
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <%--工具栏--%>
                        <div class="ibox-title">
                            <h5>最新评论</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link" data-toggle="tooltip" data-placement="top" title="折叠">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                                <a class="close-link" data-toggle="tooltip" data-placement="top" title="关闭">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>

                        <%--评论内容--%>
                        <div class="ibox-content" style="display: block;">
                            <%--<c:if test="${articleList == null}">

                            </c:if>--%>
                            <div>

                                <section class="comment-list block">
                                    <%--评论项--%>
                                    <article id="comment-id-1" class="comment-item">
                                        <a class="pull-left thumb-sm avatar">
                                            <img src="<c:url value='/images/avatar_default.jpg'/>"
                                                 class="img-shadow headImg">
                                        </a>
                                        <span class="arrow left"></span>
                                        <section class="comment-body panel panel-default">
                                            <header class="panel-heading bg-white">
                                                <a href="#">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;"><name>小张</name></span>
                                                    </span>
                                                </a>
                                                <label class="label bg-info m-l-xs">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">已注册</span>
                                                    </span>
                                                </label>

                                                <%--时间--%>
                                                <span class="text-muted m-l-sm pull-right">
                                                    <i class="fa fa-clock-o"></i>
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;"> 现在 </span>
                                                    </span>
                                                </span>
                                            </header>
                                            <div class="panel-body">
                                                <div>
                                                    <a href="#">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">评论内容哦</span>
                                                    </span>
                                                    </a>
                                                </div>

                                                <%--操作--%>
                                                <div class="comment-action m-t-sm">
                                                    <%--TODO 点赞--%>
                                                    <%--<a href="#" data-toggle="class"
                                                       class="btn btn-default btn-xs active">
                                                        <i class="fa fa-star-o text-muted text"></i>
                                                        <i class="fa fa-star text-danger text-active"></i>
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;"> 喜欢 </span></span>
                                                    </a>--%>
                                                    <a id="1234" href="#comment-form"
                                                       class="btn btn-default btn-xs replyComment">
                                                        <i class="fa fa-mail-reply text-muted"></i>
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;"> 回复 </span>
                                                        </span>
                                                    </a>
                                                    <a href="#comment-id-1" data-dismiss="alert"
                                                       class="btn btn-default btn-xs">
                                                        <i class="fa fa-trash-o text-muted"></i>
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;"> 删除 </span>
                                                        </span>
                                                    </a>
                                                    <a href="#" class="btn btn-default btn-xs">
                                                        <i class="fa fa-warning text-muted"></i>
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;"> 拉黑 </span>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </section>
                                    </article>

                                    <article class="comment-item media" id="comment-form">
                                        <a class="pull-left thumb-sm avatar">
                                            <img src="<c:url value='/images/avatar_default.jpg'/>"
                                                 class="img-shadow headImg">
                                        </a>
                                        <section class="media-body">
                                            <form action="" class="m-b-none">
                                                <input type="hidden" id="articleId" name="articleId">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="commentText"
                                                           placeholder="输入你的评论">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-primary" type="button">回复</button>
                                                    </span>
                                                </div>
                                            </form>
                                        </section>
                                    </article>

                                </section>
                            </div>
                        </div>
                        <%-- //评论内容--%>
                    </div>
                </div>
                <%-- //最新评论--%>


            </div>
            <div class="row">

                <%--系统日志--%>
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <%--工具栏--%>
                        <div class="ibox-title">
                            <h5>系统日志</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link" data-toggle="tooltip" data-placement="top" title="折叠">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="close-link" data-toggle="tooltip" data-placement="top" title="关闭">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>

                        <%--日志记录--%>
                        <div class="ibox-content" style="display: block;">
                            <div>
                                <ul class="layui-timeline">
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">2018年，layui 5.0
                                                发布。并发展成为中国最受欢迎的前端UI框架（期望）
                                            </div>
                                        </div>
                                    </li>
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">2017年，layui 里程碑版本 2.0 发布</div>
                                        </div>
                                    </li>
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">2016年，layui 首个版本发布</div>
                                        </div>
                                    </li>
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">2015年，layui 孵化</div>
                                        </div>
                                    </li>
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">更久前，轮子时代。维护几个独立组件：layer等</div>
                                        </div>
                                    </li>
                                </ul>
                                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                                    <legend>系统日志 | 文章管理系统</legend>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- //系统日志--%>
            </div>


        </section>
    </section>
    </div>

</section>
<!-- /中间内容 -->

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>
