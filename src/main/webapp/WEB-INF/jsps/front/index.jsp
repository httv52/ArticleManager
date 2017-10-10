<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--导入头文件--%>
<%@include file="/WEB-INF/jsps/format/front/head.jsp" %>

<form action="<c:url value="/index/${user.username}"/>" id="index_form" method="post">
    <input type="hidden" name="pageNow" value="1" id="my_pageNow">

    <div class="index-page row wrapper" style="transform: none;overflow: auto;background-color: #f7f7f7">
        <div class="col-lg-9 col-xs-12 contentSidebar">
            <div class="main-content clearfix theiaStickySidebar">
                <div class="post-lists">
                    <div class="post-lists-body">
                        <%--#for(article : articles.list)--%>
                        <c:forEach items="${articleList}" var="a">
                            <div class="post-list-item">
                                <div class="post-list-item-container">
                                    <div class="item-thumb bg-deepgrey"
                                         style="background-image:url(<%=imgPath%>${a.previewimg});">
                                    </div>
                                    <a href="<c:url value="/p/${a.aid}"/>">
                                        <div class="item-desc">
                                            <p class="contentControl_6">${a.contentView}</p>
                                        </div>
                                    </a>
                                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                                    <div class="item-slant"></div>
                                    <div class="item-label">
                                        <div class="item-title contentControl_2">
                                            <a href="<c:url value="/p/${a.aid}"/>">${a.title} </a>
                                        </div>
                                        <div class="item-meta clearfix">
                                            <div class="item-meta-ico"
                                                 style="background: url(<%=imgPath%>${a.category.img}) no-repeat;background-size:38px 40px;"></div>
                                            <div class="item-meta-cat">
                                                <a href="<c:url value="/categ/"/>${user.uid}/${a.category.categoryid}">${a.category.categoryname}</a>
                                            </div>
                                            <span class="pull-left"
                                                  style="padding-top: 12px;color: #5f5f5f!important;font-size: 12px">
                                    <span data-toggle="tooltip" data-placement="top" title="${a.modifiedDateView}">
                                        <i class="fa fa-clock-o"></i>
                                        <span class="dateTimeStamp">
                                            <input class="temp" type="hidden" value="${a.modified}">
                                        </span>
                                    </span>&nbsp;
                                    <span><i class="fa fa-eye"></i> ${a.views}</span>&nbsp;
                                    <span><i class="fa fa-comment-o"></i> ${a.commens}</span>&nbsp;
                                </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <%--#end--%>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-xs-12 rightSidebar">
            <div class="theiaStickySidebar">
                <h5 class="font-semibold">关于我</h5>
                <div class="line line-dashed"></div>
                <div class="m-b-lg">
                <span class="pull-left thumb-sm m-r-sm m-t-xs">
                    <img src="<c:url value='/images/avatar_default.jpg'/>"
                         class="img-rounded commentHeadImg" name="${user.uid}"
                         data-toggle="tooltip" data-placement="top" title="${user.screenName}">
                </span>
                <p>格言：<br/>${user.resume}... </p>
                </div>
                <h5 class="font-semibold">链接</h5>
                <div class="line line-dashed"></div>
                <div class="m-t-sm m-b-lg">
                    <a href="http://${theme.homePage}" class="btn btn-rounded btn-primary btn-icon"
                       data-toggle="tooltip" data-placement="top" title="个人主页" target="_blank">
                        <i class="fa fa-home"></i>
                    </a>
                    <a href="#" class="btn btn-rounded btn-info btn-icon"
                       data-toggle="tooltip" data-placement="top" title="Twitter">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a href="https://www.zhihu.com/${theme.accountZhihu}" class="btn btn-rounded btn-icon"
                       data-toggle="tooltip" data-placement="top" title="知乎" target="_blank"
                       style="background-color: #0f88eb;color: #fff;">
                        知
                    </a>
                    <a href="#" class="btn btn-rounded btn-warning btn-icon" data-toggle="tooltip" data-placement="top"
                       title="RSS">
                        <i class="fa fa-rss"></i>
                    </a>
                    <a href="http://weibo.com/${theme.accountWeibo}" class="btn btn-rounded btn-danger btn-icon"
                       data-toggle="tooltip" data-placement="top" title="微博" target="_blank">
                        <i class="fa fa-weibo"></i>
                    </a>
                    <a href="https://github.com/${theme.accountGithub}" class="btn btn-rounded btn-dark btn-icon"
                       data-toggle="tooltip" data-placement="top" title="Github" target="_blank">
                        <i class="fa fa-github"></i>
                    </a>
                </div>

                <h5 class="font-semibold">分类 / 标签</h5>
                <div class="line line-dashed"></div>
                <ul class="list-unstyled">
                    <c:forEach items="${categoryList}" var="c">
                        <li>
                            <a href="<c:url value="/categ/"/>${user.uid}/${c.categoryid}" class="dk">
                                <span class="badge pull-right">${fn:length(c.articleList)}</span> ${c.categoryname}
                            </a>
                        </li>
                        <li class="line"></li>
                    </c:forEach>
                </ul>
                <div class="tags m-b-lg">
                    <c:choose>
                        <c:when test="${empty tagList}">
                            <div class="find-nothing text-center">
                                <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                                <p style="color: #919191;padding-top: 5px">没有属于自己的标签哦~</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${tagList}" var="tag" varStatus="status">
                                <span class="btn-group m-b-10" style="padding-top: 7px">
                                    <span class="dropdown" style="padding: 11px 0px">
                                        <a
                                                <c:if test="${status.count%6==0}">
                                                    class="btn btn-info"
                                                </c:if>
                                            <c:if test="${status.count%6==1}">
                                                class="btn btn-success"
                                            </c:if>
                                            <c:if test="${status.count%6==2}">
                                                class="btn btn-danger"
                                            </c:if>
                                            <c:if test="${status.count%6==3}">
                                                class="btn btn-warning"
                                            </c:if>
                                            <c:if test="${status.count%6==4}">
                                                class="btn btn-default"
                                            </c:if>
                                            <c:if test="${status.count%6==5}">
                                                class="btn btn-dark"
                                            </c:if>
                                        >${tag.tagname} (${fn:length(tag.articleList)})
                                        </a>
                                    </span>
                                </span>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

    </div>
    <%--分页--%>
    <div class="col-lg-12 lists-navigator clearfix" style="margin: 35px 0px 0px 0px">
        <ol class="page-navigator">
            <c:if test="${pageBean.hasPre}">
                <li><a href="javascript:;" onclick="findByPageNow(${pageBean.pageNow-1})"
                       data-toggle="tooltip" data-placement="top" title="上一页">←</a></li>
            </c:if>
            <!-- 计算页码 -->
            <c:choose>
                <c:when test="${pageBean.totalPageCount<=5}">
                    <!-- 当小于等于10页 -->
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${pageBean.totalPageCount}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="begin" value="${pageBean.pageNow-2}"/>
                    <c:set var="end" value="${pageBean.pageNow+2}"/>
                    <!-- 头溢出 -->
                    <c:if test="${begin < 1}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="5"/>
                    </c:if>
                    <!-- 尾溢出 -->
                    <c:if test="${end > pageBean.totalPageCount}">
                        <c:set var="begin" value="${pageBean.totalPageCount-4}"/>
                        <c:set var="end" value="${pageBean.totalPageCount}"/>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <!-- 循环遍历页码 -->

            <c:forEach var="i" begin="${begin}" end="${end}">
                <c:choose>
                    <c:when test="${i eq pageBean.pageNow}">
                        <li class="current">
                            <a href="#" data-toggle="tooltip" data-placement="top"
                               title="当前页 共${pageBean.totalPageCount}页 / ${pageBean.totalCount}篇文章">${i }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="javascript:;" onclick="findByPageNow(${i})">${i }</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${pageBean.pageNow<pageBean.totalPageCount}">
                <li><a href="javascript:;" onclick="findByPageNow(${pageBean.pageNow+1})"
                       data-toggle="tooltip" data-placement="top" title="下一页">→</a></li>
            </c:if>

        </ol>
    </div>

</form>

<script src="<c:url value="/js/plugins/sticky/ResizeSensor.min.js"/> "></script>
<script src="<c:url value="/js/plugins/sticky/theia-sticky-sidebar.min.js"/> "></script>

<script>
    jQuery(document).ready(function () {
        var $commentHeadImg = $(".thumb-sm").find(".commentHeadImg");
        $commentHeadImg.each(function () {
            var $hashId = $(this).attr("name");
            changeHeadImg($(this), $hashId);
        });

        jQuery('.contentSidebar, .rightSidebar').theiaStickySidebar({});

        var $timeEle = $(".dateTimeStamp");
        $timeEle.each(function () {
            var $time = $(this).children(".temp").val();
            var $dateTimeStamp = getDateDiff($time);
            $(this).html($dateTimeStamp);
        });
    });

    function findByPageNow($pageNow){
        if ($pageNow == '') {
            $("#my_pageNow").val('1');
        } else {
            $("#my_pageNow").val($pageNow);
        }
        $("#index_form").submit();
    }
</script>

<%--导入头文件--%>
<%@include file="/WEB-INF/jsps/format/front/foot.jsp" %>