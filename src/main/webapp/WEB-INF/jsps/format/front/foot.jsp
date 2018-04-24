<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<footer id="footer">
    <div class="text-center">
        <div class="container wrapper">

        </div>
        <i class="fa fa-caret-down fa-4x text-primary m-b-n-lg block"></i></div>

    <div class="bg-dark dker wrapper" style="padding-bottom: 70px">
        <div class="container text-center m-t-lg">
            <div class="col-md-3">
                <h3 class="font-semibold" style="color: #adbece;">最新评论</h3>
                <c:choose>
                    <c:when test="${empty newCommentList}">
                        <div>暂时没有评论哦~</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${newCommentList}" var="nc">
                            <div><a href="#">${nc.user.username} : ${nc.content}</a></div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <%--${site_url('/article/')}${comm.cid}#comment-${comm.coid}  ${comm.author}：${comm.content}--%>
            </div>

            <div class="col-md-6">
                <h3 class="font-semibold" style="color: #adbece;">最新文章</h3>
                <c:choose>
                    <c:when test="${empty newArticleList}">
                        <div>暂时没有文章哦~</div>
                    </c:when>
                    <c:otherwise>
                        <div class="line line-dashed"></div>
                        <c:forEach items="${newArticleList}" var="na">
                            <div>
                                <article class="media"><a class="pull-left thumb thumb-wrapper m-t-xs">
                                    <img src="<%=imgPath%>${na.previewimg}" width="58px" height="43px">
                                </a>
                                    <div class="media-body contentControl_2">
                                        <a href="<c:url value="/p/${na.aid}"/>" class="font-semibold">
                                                ${na.contentView}
                                        </a>
                                    </div>
                                    <div class="text-xs block m-t-xs"><i class="fa fa-clock-o"></i>
                                            ${na.modifiedDateTimeView}
                                    </div>
                                </article>
                                <div class="line"></div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </div>

            <div class="col-md-3">
                <div class="meta-copyright-info">
                    <a href="#" class="info-logo">
                        <img src="${theme.logoImg}" alt="#" style="max-height: 63px">
                    </a>
                    <div class="info-text">
                        <p>探索未知以分享<br/>记录已知以备忘
                        <p>&copy; 2017 By <a href="http://${theme.homePage}">${user.username}</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>


<%--导入头像文件--%>
<%@include file="/WEB-INF/jsps/format/admin/headImg.jsp" %>

<script src="<c:url value='/js/myjs/headroom.min.js'/>"></script>
<script src="<c:url value='/js/myjs/highlight.min.js'/>"></script>
<%--<script src="<c:url value='/js/myjs/instantclick.min.js'/>"></script>--%>

<script type="text/javascript">
    <c:if test="${article.type==0}">
    var postDirectory = new Headroom(document.getElementById("directory-content"), {
        tolerance: 0,
        offset: 100,
        classes: {
            initial: "initial",
            pinned: "pinned",
            unpinned: "unpinned"
        }
    });

    </c:if>
    var header = new Headroom(document.getElementById("header"), {
        tolerance: 10,
        offset: 80,
        classes: {
            initial: "animated",
            pinned: "slideDown",
            unpinned: "slideUp"
        }
    });
    header.init();
    $('#search-inp').keypress(function (e) {
        var key = e.which; //e.which是按键的值
        if (key == 13) {
            var q = $(this).val();
            if (q && q != '') {
                window.location.href = '/search/' + q;
            }
        }
    });
</script>
<script>
    $(function () {
        var blocks = document.querySelectorAll('pre code');
        for (var i = 0; i < blocks.length; i++) {
            hljs.highlightBlock(blocks[i]);
        }
    });
    //    InstantClick.on('change', function (isInitialLoad) {
    //        var blocks = document.querySelectorAll('pre code');
    //        for (var i = 0; i < blocks.length; i++) {
    //            hljs.highlightBlock(blocks[i]);
    //        }
    //        if (isInitialLoad === false) {
    //            if (typeof ga !== 'undefined') ga('send', 'pageview', location.pathname + location.search);
    //        }
    //    });
    //    InstantClick.init();
</script>
</body>
</html>