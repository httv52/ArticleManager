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
                            <i class="fa fa-paste fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>${articleCount}</strong></span>
                            <span class="">篇文章</span>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-danger">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-warning"></i>
                            <i class="fa fa-comment-o fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>${fn:length(commentList)}</strong></span>
                            <span class="">条评论</span>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-primary">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-primary-li"></i>
                            <i class="fa fa-link fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>12</strong></span>
                            <span class="">条链接</span>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-3 padder-v b-r b-light bg-success bg-purple">
                        <span class="fa-stack fa-2x pull-left m-r-sm">
                            <i class="fa fa-circle fa-stack-2x text-success text-purple"></i>
                            <i class="fa fa-folder-open-o fa-stack-1x text-white"></i>
                        </span>
                        <a class="clear" href="#">
                            <span class="h3 block m-t-xs"><strong>${fileCount}</strong></span>
                            <span class="">个附件</span>
                        </a>
                    </div>
                </div>
            </section>
            <%--//总览--%>
            <div class="line line-dashed" style="padding-bottom: 10px"></div>


            <%--详情--%>
            <div class="row">
                <div class="col-md-6">
                    <div class="col-md-12">
                        <section class="panel panel-warning">
                            <header class="panel-heading font-bold">近6个月日志统计图</header>
                            <div class="panel-body" style="height: 100%; margin: 0;background-color: #fef8ef">
                                <div id="container" style="height: 350px; padding: 0px; "></div>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="col-md-12">
                        <section class="panel panel-warning">
                            <header class="panel-heading font-bold">文章分类统计</header>
                            <div class="panel-body" style="height: 100%; margin: 0;background-color: #fef8ef">
                                <div id="container2" style="height: 350px; padding: 0px; "></div>
                            </div>
                        </section>
                    </div>
                </div>

                <%--文章和评论--%>

                <%--最新文章--%>
                <div class="col-lg-6">
                    <div class="col-lg-12">
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
                                    <c:if test="${!empty articleList}">
                                        <c:forEach items="${articleList}" var="article">
                                            <article class="media">
                                                <%--<span class="pull-left thumb-sm">--%>
                                                    <%--<i class="fa fa-paste fa-3x icon-muted"></i>--%>
                                                <%--</span>--%>
                                                <div class="media-body">
                                                    <div class="pull-right media-xs text-center text-muted">
                                                <span class="text-muted m-l-sm pull-right" data-toggle="tooltip"
                                                      data-placement="bottom"
                                                      title="${article.createdDateTimeView}">
                                                    <i class="fa fa-clock-o"></i>
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;" class="dateTimeStamp">
                                                                <input class="temp" type="hidden"
                                                                       value="${article.created}">
                                                        </span>
                                                    </span>
                                                </span>
                                                    </div>
                                                    <a href="<c:url value="/p/"/>${article.aid}"
                                                       class="h4 contentControl">${article.title}</a>
                                                    <small class="block" style="padding-top: 5px">
                                                        <span class="label label-success">${article.stateView}</span>
                                                    </small>
                                                    <small class="block m-t-sm">
                                                        <a href="<c:url value="/p/"/>${article.aid}">
                                                            <p class="contentControl_2">${article.contentView}</p>
                                                        </a>
                                                    </small>
                                                </div>
                                            </article>
                                            <div class="line pull-in"></div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty articleList}">
                                        <article class="media">
                                            <div class="media-body text-center">
                                        <span class="thumb-sm">
                                            <i class="fa fa-file-o fa-3x icon-muted"></i>
                                        </span>
                                                <span class="h3">暂无文章</span><br>

                                                <div style="padding: 20px">
                                                    <a href="<c:url value="/admin/publish"/> "
                                                       class="block h4 text-success">点击前往发布文章</a>
                                                </div>
                                            </div>
                                        </article>
                                        <div class="line pull-in"></div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--系统日志--%>
                    <div class="col-lg-12">
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
                                        <c:forEach items="${logsList}" var="log" varStatus="status">
                                            <li class="layui-timeline-item">
                                                <c:choose>
                                                    <c:when test="${status.index == 0}">
                                                        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis">&#xe63d;</i>
                                                    </c:when>
                                                    <c:when test="${log.action == '初始化博客'}">
                                                        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                                                    </c:when>
                                                    <c:when test="${log.action == '登录后台'}">
                                                        <i class="layui-icon layui-timeline-axis">&#xe60e;</i>
                                                    </c:when>
                                                    <c:when test="${log.action == '发表文章'}">
                                                        <i class="layui-icon layui-timeline-axis">&#xe609;</i>
                                                    </c:when>
                                                    <c:when test="${log.action == '删除文章'}">
                                                        <i class="layui-icon layui-timeline-axis">&#xe640;</i>
                                                    </c:when>
                                                    <c:when test="${log.action == '保存文件'}">
                                                        <i class="layui-icon layui-timeline-axis">&#xe681;</i>
                                                    </c:when>
                                                    <c:when test="${log.action == '删除文件'}">
                                                        <i class="layui-icon layui-timeline-axis">&#xe64d;</i>
                                                    </c:when>
                                                </c:choose>

                                                <div class="layui-timeline-content layui-text">
                                                    <div class="layui-timeline-title">
                                                            ${log.createdDateTimeView} ： ${log.action} --->
                                                        IP-${log.ip}
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
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
                                <c:if test="${!empty commentList}">
                                    <section class="comment-list block">
                                        <c:forEach items="${commentList}" var="comment">
                                            <article id="comment-id-1" class="comment-item">
                                                <a class="pull-left thumb-sm avatar">
                                                    <img src="<c:url value='/images/avatar_default.jpg'/>"
                                                         class="img-shadow commentHeadImg" name="${comment.user.uid}"
                                                         data-toggle="tooltip" data-placement="bottom"
                                                         title="${comment.user.screenName}">
                                                </a>
                                                <span class="arrow left"></span>
                                                <section class="comment-body panel panel-default">
                                                    <header class="panel-heading bg-white">
                                                        <a href="#">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;"><name>${comment.user.username}</name></span>
                                                    </span>
                                                        </a>
                                                        <label class="label bg-info m-l-xs">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">${comment.user.stateView}</span>
                                                    </span>
                                                        </label>

                                                            <%--时间--%>
                                                        <span class="text-muted m-l-sm pull-right" data-toggle="tooltip"
                                                              data-placement="bottom"
                                                              title="${comment.createdDateTimeView}">
                                                    <i class="fa fa-clock-o"></i>
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;" class="dateTimeStamp">
                                                            <input class="temp" type="hidden"
                                                                   value="${comment.created}">
                                                        </span>
                                                    </span>
                                                </span>
                                                    </header>
                                                    <div class="panel-body">
                                                        <div>
                                                            <a href="<c:url value="/p/"/>${comment.article.aid}#comment_${comment.id}">
                                                                <span style="vertical-align: inherit;">
                                                                    <span style="vertical-align: inherit;">${comment.content}</span>
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
                                        </c:forEach>

                                        <article class="comment-item media" id="comment-form">
                                            <a class="pull-left thumb-sm avatar">
                                                <img src="<c:url value='/images/avatar_default.jpg'/>"
                                                     class="img-shadow myHeadImg">
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
                                </c:if>

                                <%--评论项--%>

                                <c:if test="${empty commentList}">
                                    <div class="find-nothing">
                                        <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                                        <div>暂时没有评论哦~</div>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                        <%-- //评论内容--%>
                    </div>
                </div>
                <%-- //最新评论--%>

                <script>
                    $(function () {
                        var $commentHeadImg = $(".comment-list").find(".commentHeadImg");
                        $commentHeadImg.each(function () {
                            var $hashId = $(this).attr("name");
                            changeHeadImg($(this), $hashId);
                        });

                        var $timeEle = $(".dateTimeStamp");
                        $timeEle.each(function () {
                            var $time = $(this).children(".temp").val();
                            var $dateTimeStamp = getDateDiff($time);
                            $(this).html($dateTimeStamp);
                        });
                    })
                </script>
            </div>


            <%--<div class="row">--%>

            <%----%>
            <%--</div>--%>


        </section>
    </section>

</section>
<!-- /中间内容 -->
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script src="<c:url value='/js/echarts/vintage.js'/>"></script>

<script type="text/javascript">
    var arr = '<c:forEach items="${countBean.countList}" var="cl">${cl.name},</c:forEach>';
    arr = arr.substring(0, arr.length - 1);
    var count_name = arr.split(",");

    arr = '<c:forEach items="${countBean.countList}" var="cl">${cl.value},</c:forEach>';
    arr = arr.substring(0, arr.length - 1);
    var count_value = arr.split(",");

    arr = '<c:forEach items="${countBean.countList}" var="cl">${cl.note},</c:forEach>';
    arr = arr.substring(0, arr.length - 1);
    var count_note = arr.split(",");


    var dom = document.getElementById("container");
    var myChart = echarts.init(dom, 'vintage');
    var app = {};

    option = null;
    option = {
        title: {
//            text: '50天日志统计图'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        legend: {
            data: ['日志量', 'IP数量']
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        grid: {
            left: '3%',
            right: '1%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            data: count_name
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [
            {
                name: 'IP数量',
                type: 'line',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                    }
                },
                areaStyle: {normal: {}},
                data: count_note
            },
            {
                name: '日志量',
                type: 'line',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                },
                areaStyle: {normal: {}},
                data: count_value
            }
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }


    /*第二个图*/
    arr = '<c:forEach items="${countBean2.countList}" var="cl">${cl.name},</c:forEach>';
    arr = arr.substring(0, arr.length - 1);
    count_name = arr.split(",");

    arr = '<c:forEach items="${countBean2.countList}" var="cl">${cl.value},</c:forEach>';
    arr = arr.substring(0, arr.length - 1);
    count_value = arr.split(",");

    var jsonstr = "[]";
    var series_data = eval('(' + jsonstr + ')');
    for (var i = 0; i < count_value.length; i++) {
        var jsonTemp = {
            "value": count_value[i],
            "name": count_name[i]
        };
        series_data.push(jsonTemp);
    }
    console.log(series_data);

    var dom2 = document.getElementById("container2");
    var myChart2 = echarts.init(dom2, 'vintage');
    var app2 = {};
    option = null;
    option = {
        title: {
//            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            // x: 'center',
            // y: 'bottom',
//            orient: 'vertical',
//            right: 'right',
            x : 'center',
            y : 'bottom',
            data: count_name
        },
        toolbox: {
            show: true,
            feature: {
                mark: {
                    show: true
                },
                // dataView: {
                //     show: true,
                //     readOnly: false
                // },
                magicType: {
                    show: true,
                    type: ['pie', 'funnel']
                },
                // restore: {
                //     show: true
                // },
                saveAsImage: {
                    show: true
                }
            }
        },
        calculable: true,
        series: [{
            name: '文章分类',
            type: 'pie',
            radius: [30, 110],
            // center: ['75%', '50%'],
//            roseType : 'radius',
            roseType : 'area',
            data: series_data
        }
        ]
    };
    if (option && typeof option === "object") {
        myChart2.setOption(option, true);
    }
</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>
