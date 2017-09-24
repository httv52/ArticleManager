<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/font-awesome.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/css/plugins/summernote/summernote.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/plugins/summernote/summernote-bs3.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>

</head>

<body>

<div class="ibox-content no-padding">
    <div class="summernote">
        <h2>H+ 后台主题</h2>
        <p>
            H+是一个完全响应式，基于Bootstrap3.3.6最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.1)，当然，也集成了很多功能强大，用途广泛的就jQuery插件，她可以用于所有的Web应用程序，如<b>网站管理后台</b>，<b>网站会员中心</b>，<b>CMS</b>，<b>CRM</b>，<b>OA</b>等等，当然，您也可以对她进行深度定制，以做出更强系统。
        </p>
        <p>
            <b>当前版本：</b>v4.1.0
        </p>
        <p>
            <b>定价：</b><span class="label label-warning">&yen;988（不开发票）</span>
        </p>

    </div>
</div>


<!-- 全局js -->
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>


<!-- 自定义js -->
<script src="<c:url value='/js/content.js'/>" cache="false"></script>


<!-- SUMMERNOTE -->
<script src="<c:url value='/js/plugins/summernote/summernote.min.js'/>"></script>
<script src="<c:url value='/js/plugins/summernote/summernote-zh-CN.js'/>"></script>

<script>
    $(document).ready(function () {

        var htmlEditor = $('.summernote').summernote({
            lang: 'zh-CN',
            height: 340,
            placeholder: '写点儿什么吧...',
            //上传图片的接口
            callbacks: {
                onImageUpload: function (files) {
                    var data = new FormData();
                    data.append('image_up', files[0]);
                    // tale.showLoading();
                    $.ajax({
                        url: '/admin/attach/upload',     //上传图片请求的路径
                        method: 'POST',            //方法
                        data: data,                 //数据
                        processData: false,        //告诉jQuery不要加工数据
                        dataType: 'json',
                        contentType: false,        //<code class="javascript comments"> 告诉jQuery,在request head里不要设置Content-Type
                        success: function (result) {
                            // tale.hideLoading();
                            if (result && result.success) {
                                var url = $('#attach_url').val() + result.payload[0].fkey;
                                console.log('url =>' + url);
                                htmlEditor.summernote('insertImage', url);
                            } else {
                                // tale.alertError(result.msg || '图片上传失败');
                            }
                        }
                    });
                }
            }
        });

    });
</script>

</body>

</html>
