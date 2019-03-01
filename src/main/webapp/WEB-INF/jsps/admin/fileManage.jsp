<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--导入顶部信息--%>
<%@include file="/WEB-INF/jsps/format/admin/head.jsp" %>

<!-- 中间内容 -->
<section id="content">
    <section class="vbox">
        <section class="scrollable padder" id="topAnchor">
            <!--路径-->
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li>
                    <a href="<c:url value="/admin/index"/> "><i class="fa fa-home"></i> 主页</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit"></i> 后台管理</a>
                </li>
                <li class="active">
                    <i class="fa"> 文件管理</i>
                </li>
            </ul>
            <div class="m-b-md">
                <h3 class="m-b-none"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">文件管理</span></span></h3>
            </div>

            <%--主要数据--%>
            <div class="wrapper wrapper-content" style="padding: 0px">
                <form action="<c:url value="/admin/fileManage"/> " method="post" id="myform">
                    <input type="hidden" name="type" value="${type}" id="myFile_type">
                    <input type="hidden" id="my_pageNow" name="pageNow" value="1">

                    <div class="row">
                        <%--管理--%>
                        <div class="col-sm-3">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="file-manager">

                                        <a href="<c:url value="/admin/fileUpload"/>"
                                           class="btn btn-info btn-block">上传文件</a>

                                        <div class="hr-line-dashed"></div>
                                        <div class="media">
                                            <h5><i class="fa fa-folder-open-o"> 类型</i></h5>
                                        </div>
                                        <ul class="folder-list" style="padding: 0">
                                            <li>
                                                <b class="badge bg-primary pull-right">${allMyFile}</b>
                                                <a href="javascript:;" onclick="findByType(-1)">
                                                    <span id="fileType_All">
                                                        <i class="fa fa-map"></i> 所有类型
                                                    </span>
                                                </a>
                                            </li>
                                            <c:forEach items="${fileTypeList}" var="fileTypes">
                                                <li>
                                                    <b class="badge bg-primary pull-right">${fileTypes.count}</b>
                                                    <a href="javascript:;" onclick="findByType(${fileTypes.fileType})">
                                                <span id="fileType_${fileTypes.fileType}">
                                                <c:choose>
                                                    <c:when test="${fileTypes.fileType == '1'}">
                                                        <i class="fa fa-picture-o"></i> 图片类型
                                                    </c:when>
                                                    <c:when test="${fileTypes.fileType == '2'}">
                                                        <i class="fa fa-book"></i> 文本类型
                                                    </c:when>
                                                    <c:when test="${fileTypes.fileType == '3'}">
                                                        <i class="fa fa-link"></i> 链接类型
                                                    </c:when>
                                                    <c:when test="${fileTypes.fileType == '4'}">
                                                        <i class="fa fa-video-camera"></i> 视频类型
                                                    </c:when>
                                                    <c:when test="${fileTypes.fileType == '5'}">
                                                        <i class="fa fa-music"></i> 音乐类型
                                                    </c:when>
                                                    <c:when test="${fileTypes.fileType == '0'}">
                                                        <i class="fa fa-puzzle-piece"></i> 其他类型
                                                    </c:when>
                                                </c:choose>
                                                </span>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-sm-12" style="padding-left: 0px">
                                    <c:if test="${empty fileList}">
                                        <div class="find-nothing" style="padding-top: 80px">
                                            <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                                            <div>没有找到你需要的文件哦~</div>
                                        </div>
                                    </c:if>

                                    <c:if test="${!empty fileList}">
                                        <%--文件数据--%>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <c:forEach items="${fileList}" var="file">

                                                    <%--类型--%>
                                                    <div class="file-box col-sm-3 text-center"
                                                         style="padding: 0px 10px;">
                                                        <div class="file text-center">
                                                            <a href="javascript:openFile('${file.realName}','<%=imgPath%>${file.fileUrl}')">
                                                            <span class="corner"></span>
                                                            <c:choose>
                                                            <c:when test="${file.fileType == '1'}">
                                                            <%--<a href="<%=imgPath%>${file.fileUrl}" target="_blank">--%>
                                                                <div class="image" style="height: 130px;"
                                                                     data-toggle="tooltip"
                                                                     data-placement="top"
                                                                     title="点击预览：${file.realName}">
                                                                    <img alt="image" class="img-responsive"
                                                                         src="<%=imgPath%>${file.fileUrl}">
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="icon"
                                                                     data-toggle="tooltip"
                                                                     data-placement="top"
                                                                     title="点击预览：${file.realName}">
                                                                    <c:choose>
                                                                        <c:when test="${file.fileType == '0'}">
                                                                            <i class="fa fa-file-archive-o"></i>
                                                                        </c:when>
                                                                        <c:when test="${file.fileType == '2'}">
                                                                            <i class="fa fa-file-text"></i>
                                                                        </c:when>
                                                                        <c:when test="${file.fileType == '3'}">
                                                                            <i class="fa fa-link"></i>
                                                                        </c:when>
                                                                        <c:when test="${file.fileType == '4'}">
                                                                            <i class="img-responsive fa fa-film"></i>
                                                                        </c:when>
                                                                        <c:when test="${file.fileType == '5'}">
                                                                            <i class="fa fa-music"></i>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                </c:otherwise>
                                                                </c:choose>
                                                                </a>

                                                                <div class="file-name">
                                                                    <a href="<%=imgPath%>${file.fileUrl}" target="_blank" class="contentControl"
                                                                         data-toggle="tooltip"
                                                                         data-placement="top"
                                                                         title="点击下载：${file.sizeView}" download="${file.realName}">
                                                                            ${file.realName}
                                                                    </a>
                                                                    <small data-toggle="tooltip"
                                                                           data-placement="top"
                                                                           title="${file.createdDateTimeView}">
                                                                        添加时间：
                                                                        <span style="vertical-align: inherit;"
                                                                              class="dateTimeStamp">
                                                                     <input class="temp" type="hidden"
                                                                            value="${file.created}">
                                                                    </span>
                                                                    </small>
                                                                    <div class="clearfix" style="padding-top: 3px">
                                                                        <button url="<%=imgPath%>${file.fileUrl}"
                                                                                type="button"
                                                                                class="btn btn-warning btn-sm waves-effect waves-light m-t-5 copy">
                                                                            <i class="fa fa-copy"></i>
                                                                            <span>复制</span>
                                                                        </button>
                                                                        <button type="button"
                                                                                class="btn btn-danger btn-sm waves-effect waves-light m-t-5"
                                                                                onclick="delFile('${file.id}');">
                                                                            <i class="fa fa-trash-o"></i>
                                                                            <span>删除</span>
                                                                        </button>
                                                                    </div>
                                                                </div>

                                                        </div>
                                                    </div>


                                                </c:forEach>
                                                <script>
                                                    var $timeEle = $(".dateTimeStamp");
                                                    $timeEle.each(function () {
                                                        var $time = $(this).children(".temp").val();
                                                        var $dateTimeStamp = getDateDiff($time);
                                                        $(this).html($dateTimeStamp);
                                                    });
                                                </script>
                                            </div>
                                            <div class="clearfix"></div>

                                            <ul class="pagination m-b-5 pull-right">
                                                <c:if test="${pageBean.hasPre}">
                                                    <li>
                                                        <a href="javascript:;" aria-label="Previous"
                                                           onclick="findByPageNow(${pageBean.pageNow-1})"
                                                           data-toggle="tooltip" data-placement="top" title="前一页">
                                                            <i class="fa fa-angle-left"></i>&nbsp;上一页
                                                        </a>
                                                    </li>
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
                                                            <li class="active">
                                                                <a class="active" data-toggle="tooltip"
                                                                   data-placement="top" title="当前页">
                                                                        ${i }
                                                                </a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li>
                                                                <a href="javascript:;" onclick="findByPageNow(${i})">
                                                                    <font style="vertical-align: inherit;">${i }</font>
                                                                </a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:if test="${pageBean.pageNow<pageBean.totalPageCount}">
                                                    <li>
                                                        <a href="javascript:;" aria-label="Next"
                                                           onclick="findByPageNow(${pageBean.pageNow+1})"
                                                           data-toggle="tooltip" data-placement="top" title="后一页">
                                                            下一页&nbsp;<i class="fa fa-angle-right"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <li><span>共${pageBean.totalPageCount}页</span></li>
                                            </ul>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>


        </section>
    </section>

</section>
</section>
<!-- /中间内容 -->

<script src="<c:url value='/js/plugins/clipboard/clipboard.min.js'/>"></script>


<script>
    var hutao = new $.hutao();
    $(document).ready(function () {
        var $type = $("#myFile_type").val();
        if ($type == '') {
            $("#fileType_All").addClass("text-primary");
        } else {
            $("#fileType_" + $type).addClass("text-primary");
        }
    });

    function findByType($type) {
        if ($type == -1) {
            $("#myFile_type").val('');
        } else {
            $("#myFile_type").val($type);
        }
        $("#myform").submit();
    }

    function findByPageNow($pageNow) {
        if ($pageNow == '') {
            $("#my_pageNow").val('1');
        } else {
            $("#my_pageNow").val($pageNow);
        }
        $("#myform").submit();
    }

    /*复制文件*/
    var clipboard = new Clipboard('button.copy', {
        text: function (trigger) {
            return $(trigger).attr('url');
        }
    });

    clipboard.on('success', function (e) {
        console.info('Action:', e.action);
        console.info('Text:', e.text);
        console.info('Trigger:', e.trigger);
        e.clearSelection();
        hutao.successContent("复制成功");
    });

    function delFile($fileId) {
        if ($fileId == '') {
            hutao.errorAlert({
                text: '文件 id 为空',
                title: '文件删除失败'
            });
            return;
        }
        $.ajax({
            url: '<c:url value="/file/delete"/>',
            data: {fileId: $fileId},
            dataType: "json",
            success: function (result) {
                if (result && result.success) {
                    hutao.successAlert({
                        text: '文件删除成功',
                        title: '文件删除成功'
                    }, function () {
                        setTimeout(function () {
                            window.location.reload();
                        }, 100);
                        return;
                    });
                } else {
                    hutao.errorAlert({
                        text: result.msg || '文件删除失败',
                        title: '文件删除失败'
                    });
                }
            },
            error: function (result) {
                hutao.errorAlert({
                    text: result.msg || '文件删除失败',
                    title: '文件删除失败'
                });
            }
        });
    }

    function openFile($name, $url) {
        var index = hutao.openWindow({
            title: $name,
            content: $url,
            area: ['80%', '80%']
        });
        layer.full(index);
    }
</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>



