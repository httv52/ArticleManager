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
                                <form id="theme_base" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点LOGO</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="logoImg" id="logoImg"
                                                   placeholder="请输入LOGO的URL链接（可在文件管理处复制）" value="${theme.logoImg}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点名称</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="autherName" id="autherName"
                                                   placeholder="站点名称 默认为&quot;你的姓名+的博客&quot;" value="${theme.autherName}" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点描述</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="describe" id="describe"
                                                   placeholder="您的站点详细描述" value="${theme.describe} "/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">站点关键词</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="keyword" id="keyword"
                                                   placeholder="您的站点关键词" value="${theme.keyword} "/>
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-info"
                                                onclick="saveThemeOptions('theme_base')">
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
                                <form id="theme_link" class="form-horizontal" style="color: #8e8e8e">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">个人主页</label>
                                        <div class="col-md-9">
                                            <div class="input-group m-b">
                                                <span class="input-group-addon">http://</span>
                                                <input type="text" class="form-control" name="homePage"
                                                       placeholder="个人主页地址，默认为你的本站主页" value="${theme.homePage}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">微博账号</label>
                                        <div class="col-md-9">
                                            <div class="input-group m-b">
                                                <span class="input-group-addon">http://weibo.com/u/</span>
                                                <input type="text" class="form-control" name="accountWeibo"
                                                       placeholder="微博账号，不输入则不显示" value="${theme.accountWeibo}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">知乎账号</label>
                                        <div class="col-md-9">
                                            <div class="input-group m-b">
                                                <span class="input-group-addon">https://www.zhihu.com/people/</span>
                                                <input type="text" class="form-control" name="accountZhihu"
                                                       placeholder="知乎账号，不输入则不显示" value="${theme.accountZhihu}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Github账号</label>
                                        <div class="col-md-9">
                                            <div class="input-group m-b">
                                                <span class="input-group-addon">https://github.com/</span>
                                                <input type="text" class="form-control" name="accountGithub"
                                                       placeholder="Github账号，不输入则不显示" value="${theme.accountGithub}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-primary"
                                                onclick="saveThemeOptions('theme_link')">
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
                                    <div class="col-md-3">
                                        <label class="radio-custom">
                                            <input type="radio" value="threshold" name="qrType" <c:if test="${theme.qrType eq '0'}">checked</c:if> >
                                            <i class="fa fa-circle-o <c:if test="${theme.qrType eq '0'}">checked</c:if>"></i> 经典</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="radio-custom">
                                            <input type="radio" value="color" name="qrType" <c:if test="${theme.qrType eq '1'}">checked</c:if>>
                                            <i class="fa fa-circle-o <c:if test="${theme.qrType eq '0'}">checked</c:if>"></i> 彩色 </label>
                                    </div>
                                </div>

                                <div class="group">
                                    <div id="qr"></div>
                                    <div id="image"><img src="<%=imgPath%>/static/QR.jpg" width="171" height="171">
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div style="text-align: center;">
                                    　
                                    <h2>To</h2>
                                </div>
                                <div id="combine"></div>
                                <div class="clearfix pull-right">
                                    <button type="button" class="btn btn-warning"
                                            onclick="saveThemeOptions('theme_qr')">
                                        保存设置
                                    </button>
                                </div>
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
        var $qrType = ${theme.qrType};
        if($qrType == '1'){
            var qrType = 'color';
        }else{
            var qrType = 'threshold';
        }

        <%--var imagePath = '<c:url value="/images/QR.jpg"/> ';--%>
        var imagePath = '<%=imgPath%>/static/QR.jpg';

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
                filter: qrType
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
            qrType = $(this).val();
            makeQArt();
        });

        makeQR();
        makeQArt();
    });

    //保存操作
    var hutao = new $.hutao();

    /**
     * Admin 主题设置
     * @param $form_name form表单名称
     */
    function saveThemeOptions($form_name) {
        var url;
        var params;

        if ($form_name == 'theme_base') {
            url = '<c:url value="/theme/base"/>';
        }
        if ($form_name == 'theme_link') {
            url = '<c:url value="/theme/link"/>';
        }
        params = $("#" + $form_name).serialize();

        $.ajax({
            type: "POST",
            url: url,
            data: params,
            dataType: "json",
            success: function (result) {
                handlerResult(result, function () {
                    update_theme_success();
                });
            },
            error: function () {
                hutao.errorAlert('操作失败');
            }
        });
    }

    function update_theme_success() {
        hutao.successAlert({
            text: '设置成功'
        }, function () {

        });
    }

    function cacheExternalImage(url) {
        var img = new Image,
            src = url,
            cvs = document.createElement('canvas'),
            ctx = cvs.getContext('2d');
        img.crossOrigin = "Anonymous";
        img.onload = function () {
            //ctx.drawImage( img, 0, 0 );
        }
        img.src = src;
        if (img.complete || img.complete === undefined) {
            img.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
            img.src = src;
        }
        return img;
    }
</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>
