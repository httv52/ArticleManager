<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--导入顶部信息--%>
<%@include file="/WEB-INF/jsps/format/admin/head.jsp" %>

<c:set var="max_file_size" value="20"/>
<c:set var="max_file_num" value="10"/>

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
                    <i class="fa"> 文件上传</i>
                </li>
            </ul>
            <div class="m-b-md">
                <h3 class="m-b-none"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">文件上传</span></span></h3>
            </div>

            <%--主要数据--%>
            <div class="row">
                <form id="my-awesome-dropzone" class="dropzone" action="http://localhost:8080/article/file/uploadFile">
                    <div class="dropzone-previews"></div>
                    <button type="submit" class="btn btn-primary pull-right">提交</button>
                </form>
                <%--<div class="col-md-12 portlets">--%>
                <%--<!-- Your awesome content goes here -->--%>
                <%--<div class="m-b-30">--%>
                <%--<form action="<c:url value="/file/fileUpload"/> " class="dropzone" id="dropzone" enctype="multipart/form-data">--%>
                <%--<div class="fallback">--%>
                <%--<input type="file" name="file" multiple>--%>
                <%--</div>--%>
                <%--<div class="dz-message">--%>
                <%--<p>将文件拖至此处或点击上传.${attach_url}</p>--%>
                <%--<p>--%>
                <%--<span style="font-size: 16px; color: #d0d0d0;">一次最多可以上传10个文件</span>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--</form>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>


        </section>
    </section>

</section>
</section>
<!-- /中间内容 -->

<%--<script src="<c:url value="/js/plugins/dropzone/dropzone.js"/> "></script>--%>

<script src="//cdn.bootcss.com/dropzone/4.3.0/min/dropzone.min.js"></script>

<script>
    var hutao = new $.hutao();
    $("#dropzone").dropzone({
        url: "<c:url value="/file/uploadFile"/>",
        filesizeBase: 1024,//定义字节算法 默认1000
        maxFiles: ${max_file_num},//最大文件数量
        maxFilesize: '${max_file_size}', //MB
        uploadMultiple: true,
        dictFileTooBig: '您的文件超过${max_file_size}MB!',
        dictInvalidInputType: '不支持您上传的类型',
        dictMaxFilesExceeded: '您的文件超过${max_file_num}个!',
        fallback: function () {
            hutao.errorAlert('暂不支持您的浏览器上传!');
        },
        init: function () {
            this.on('queuecomplete', function (files) {
                hutao.successContent('上传成功');
            });
            this.on('error', function (a, errorMessage, result) {
                if (!result.success && result.msg) {
                    hutao.errorAlert(result.msg || '上传失败');
                }
            });
            this.on('maxfilesreached', function () {
                this.removeAllFiles(true);
                hutao.warningAlert('文件数量超出限制');
            });
        }
    });

</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>



