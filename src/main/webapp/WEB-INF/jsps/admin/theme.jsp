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
                    <a href="<c:url value="/admin/index"/> "><i class="fa fa-home"></i> 主页</a>
                </li>
                <li>
                    <a href="# "><i class="fa fa-edit"></i> 系统设置</a>
                </li>
                <li class="active">
                    <i class="fa"> 前台设置</i>
                </li>
            </ul>

            <div class="m-b-md">
                <h3 class="m-b-none"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">前台设置</span></span>
                </h3>
            </div>


            <%--主要数据--%>
            <div class="row">
                <div class="col-md-6">
                    <section class="panel panel-primary">
                        <header class="panel-heading">
                            <h1 class="panel-title">基本设置</h1>
                        </header>
                        <div class="panel-body">
                            <div class="m-b-10" style="padding: 1px 8px 8px 8px">
                                <form id="option-from" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点LOGO</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_logo_url"
                                                   placeholder="请输入LOGO链接（可在文件管理处复制）"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点作者</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_author"
                                                   placeholder="您的站点昵称">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点描述</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_author"
                                                   placeholder="您的站点详细描述">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点关键词</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_author"
                                                   placeholder="您的站点关键词">
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-info"
                                                onclick="saveThemeOptions('option-from')">
                                            保存设置
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>

                    <section class="panel panel-success" style="color: #fff">
                        <header class="panel-heading">
                            <h1 class="panel-title">链接设置</h1>
                        </header>
                        <div class="panel-body">
                            <div class="m-b-10" style="padding: 1px 8px 8px 8px">
                                <form id="indivi-form" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">微博账号</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_social_weibo"
                                                   placeholder="微博账号，不输入则不显示">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">知乎账号</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_social_zhihu"
                                                   placeholder="知乎账号，不输入则不显示">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Github账号</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="theme_option_social_github"
                                                   placeholder="Github账号，不输入则不显示">
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-primary"
                                                onclick="saveThemeOptions('indivi-form')">
                                            保存设置
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-md-6">
                    <section class="panel panel-warning" style="color: #4e4e4e">
                        <header class="panel-heading">
                            <h1 class="panel-title">二维码设置</h1>
                        </header>
                        <div class="panel-body">
                            <form>
                                <input id="value" type="hidden" value="<c:url value="/admin/index"/> ">
                                <input id="file" type="file">
                                <div style="padding-top: 15px">
                                    <%--Threshold: <input type="radio" value="threshold" name="filter" checked>--%>
                                    <%--Color: <input type="radio" value="color" name="filter">--%>
                                    <div class="col-md-3">
                                        <label class="radio-custom">
                                            <input type="radio" value="threshold" name="filter" checked>
                                            <i class="fa fa-circle-o checked"></i> 默认 </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="radio-custom">
                                            <input type="radio" value="color" name="filter">
                                            <i class="fa fa-circle-o"></i> 彩色 </label>
                                    </div>
                                </div>

                                <div class="group">
                                    <div id="qr"></div>
                                    <div id="image"><img src="<c:url value="/images/QR.jpg"/>" width="171" height="171">
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div style="text-align: center;">
                                    　
                                    <h2>To</h2>
                                </div>
                                <div id="combine"></div>
                            </form>
                        </div>
                    </section>
                </div>

            </div>

        </section>
    </section>

</section>
<!-- /中间内容 -->


<%--二维码--%>
<script src="<c:url value='/js/plugins/QR/qrcode.js'/>"></script>
<script src="<c:url value='/js/plugins/QR/qart.min.js'/>"></script>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<script>
    $(function () {
        var value = '<%=basePath%><c:url value="/admin/index"/>';
        var filter = 'threshold';
        var imagePath = '<c:url value="/images/QR.jpg"/> ';

        var self = this;

        function makeQR() {
            var qr = qrcode.QRCode(10, 'H');
            qr.addData(value);
            qr.make();
            document.getElementById('qr').innerHTML = qr.createImgTag(3);
        }

        function makeQArt() {
            new QArt({
                value: value,
                imagePath: imagePath,
                filter: filter
            }).make(document.getElementById('combine'));
        }

        function getBase64(file, callback) {
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                callback(reader.result);
            };
        }

        $('#value').keyup(function () {
            value = $(this).val();
            makeQR();
            makeQArt();
        });

        $('#file').change(function () {
            getBase64(this.files[0], function (base64Img) {
                var regex = /data:(.*);base64,(.*)/gm;
                var parts = regex.exec(base64Img);
                imagePath = parts[0];
                $('#image img').attr('src', imagePath);
                makeQArt();
            });
        });

        $('input[type=radio]').click(function () {
            filter = $(this).val();
            makeQArt();
        });

        makeQR();
        makeQArt();
    });
</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>
