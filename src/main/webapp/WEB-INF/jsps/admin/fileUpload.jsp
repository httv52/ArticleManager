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
            <div class="row" style="padding: 10px 50px">
                <form action="<c:url value="/file/multipUloadFile"/>" class="dropzone needsclick dz-clickable"
                      id="demo-upload" style="height: 380px">
                    <div class="fallback">
                        <input name="file" type="file" multiple/>
                    </div>
                    <div class="dz-message needsclick" style="padding: 80px 0px;">
                        <p id="articleImgText">٩(๑❛ᴗ❛๑)۶ 可以上传多文件 ٩(๑❛ᴗ❛๑)۶</p>
                        <p style="color: #747474;font-size: 16px">提示：可以直接拖拽文件或粘贴截图</p>
                    </div>
                </form>
                <div style="padding-top: 15px">
                    <a href="<c:url value="/admin/fileManage"/> " class="btn bg-primary pull-right">回到文件管理</a>
                </div>
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
        url: "<c:url value="/file/multipUloadFile"/>",
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
            this.on('success', function (files) {
                hutao.successContent('上传成功:' + files.name);
            });
            this.on('error', function (a, errorMessage, result) {
                hutao.errorAlert(result.msg || '上传失败');
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



