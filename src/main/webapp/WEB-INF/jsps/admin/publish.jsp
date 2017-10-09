<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--导入顶部信息--%>
<%@include file="/WEB-INF/jsps/format/admin/head.jsp" %>

<!-- 中间内容 -->
<section id="content">
    <section class="vbox">
        <section class="scrollable padder" id="topAnchor">

            <!--路径-->
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li>
                    <a href="<c:url value="/admin/index"/>"><i class="fa fa-home"></i> 主页</a>
                </li>
                <li class="active">
                    <i class="fa fa-pencil"> 发布文章</i>
                </li>
            </ul>
            <!-- //路径-->

            <%--标题--%>
            <div class="m-b-md">
                <h3 class="m-b-none">
                        <span style="vertical-align: inherit;">
                        <span style="vertical-align: inherit;">发布文章</span>
                        </span>
                </h3>
            </div>
            <%--  //标题--%>

            <div class="row" style="padding: 0px 20px">


                <form id="articleForm" role="form" novalidate="novalidate" class="form-horizontal">

                    <input type="hidden" name="type" value="0" class="myArticleType">
                    <input type="hidden" name="state" value="1" class="myArticleState">
                    <input type="hidden" name="cid" value="" id="aid"/>
                    <input type="hidden" name="previewimg" value="" id="previewImg"/>
                    <input type="hidden" id="ajax_url" value="<c:url value="/article/publish"/> "/>
                    <input name="categoryId" id="categoryId" type="hidden" value="0">
                    <input type="hidden" name="content" id="content-editor"/>

                    <%--文章标题与网页标题--%>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label><span class="requiredFiled">* </span>文章标题</label>
                            <input type="text" class="form-control" placeholder="请输入文章标题（*必须）" name="title"
                                   id="title" value="文章标题">
                        </div>

                        <div class="col-md-6">
                            <label>网页标题</label>
                            <input type="text" class="form-control"
                                   placeholder="自定义浏览器标题，如：欢迎页 | 文章管理系统  默认为文章标题 - 博客名"
                                   name="pageTitle" id="pageTitle" value="">
                        </div>
                    </div>
                    <%--文章标题与网页标题--%>


                    <%--文章标签预分类--%>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label>文章标签</label>
                            <div id="MyPillbox" class="pillbox clearfix" style="background: #fff;">
                                <ul>
                                    <%--<li class="label bg-info">
                                        <input type="hidden" name="myOldTag" value="测试标签1"/>测试标签1
                                    </li>
                                    <li class="label bg-success">
                                        <input type="hidden" name="myOldTag" value="测试标签2"/>测试标签2
                                    </li>
                                    <li class="label bg-warning">测试标签3</li>
                                    <li class="label bg-danger">测试标签4</li>--%>
                                    <input id="pillboxInput" type="text" placeholder="添加文章标签">
                                </ul>
                            </div>
                            <div class="btn-group m-r">
                                <button data-toggle="dropdown" class="btn btn-sm btn-default dropdown-toggle">
                                    <span class="dropdown-label" data-placeholder="选择已有标签">选择已有标签</span>
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-select" id="pillboxSelect">
                                    <c:forEach items="${tagList}" var="tag">
                                        <li>
                                            <a href="#">
                                                <input type="checkbox" id="${tag.tagid}"> ${tag.tagname}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label><span class="requiredFiled">* </span>文章分类</label>
                            <div id="myCombobox" class="input-group dropdown combobox">
                                <input class="form-control" type="text" value="默认分类">

                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown">
                                        <i class="caret"></i>
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                        <li data-value="0"><a href="#" onclick="changeCategoryId('0')">默认分类</a></li>
                                        <li class="divider"></li>
                                        <c:forEach items="${categoryList}" var="categ" varStatus="status">
                                            <li data-value="${status.count}">
                                                <a href="#"
                                                   onclick="changeCategoryId('${categ.categoryid}')"> ${categ.categoryname}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--  //文章标签--%>

                    <div class="line pull-in"></div>

                    <div class="form-group col-md-12" style="padding-top: 10px">
                        <label class="pull-left"><span class="requiredFiled">* </span>文章正文</label>
                        <div class="pull-right">
                            <a id="switch-btn" href="javascript:void(0)"
                               class="btn btn-dark btn-sm btn-shadow" type="markdown">切换为富文本编辑器</a>
                        </div>
                    </div>

                    <div id="md-container" class="form-group col-md-12">
                        <textarea id="editor">文章正文</textarea>
                    </div>

                    <div id="html-container" class="form-group col-md-12" style="padding: 0px;">

                        <div class="summernote">

                            <iframe id='summernoteText' name="summernoteText" src="<c:url value="/admin/summer"/>"
                                    class="col-md-12" height="406px" frameborder="0" scrolling="no"></iframe>
                        </div>

                    </div>
                    <%--js--%>
                    <script type="text/javascript">
                        /*function reinitIframe() {
                            var iframe = document.getElementById("summernoteText");
                            try {
                                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                                var height = Math.max(bHeight, dHeight);
                                iframe.height = height;
                                console.log(height);
                            } catch (ex) {
                            }
                        }

                        window.setInterval("reinitIframe()", 200);*/
                    </script>
                    <%--js--%>


                    <div class="form-group col-md-12" style="margin-bottom: 0px;">
                        <div class="form-group col-md-3 col-sm-4">
                            <label class="col-md-6 control-label">允许评论</label>
                            <input type="hidden" name="allowcommon" id="allowCommon" value="0">
                            <div class="col-sm-6">
                                <label class="switch">
                                    <input id="hasAllowCommon" type="checkbox">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-md-3 col-sm-4">
                            <label class="col-md-6 control-label">允许订阅</label>
                            <input type="hidden" name="allowsub" id="allowSub" value="0">
                            <div class="col-sm-6">
                                <label class="switch">
                                    <input id="hasAllowSub" type="checkbox">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-md-3 col-sm-4">
                            <label class="col-md-6 control-label">添加缩略图</label>
                            <div class="col-sm-6">
                                <label class="switch">
                                    <input id="hasPreviewImg" type="checkbox">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="page-container form-group col-md-12 myHidden" id="webuploader-container">
                        <div id="uploader">
                            <div class="queueList">
                                <div id="dndArea" class="placeholder">
                                    <div id="filePicker"></div>
                                    <p id="articleImgText">٩(๑❛ᴗ❛๑)۶ 为文章添加一张缩略图 ٩(๑❛ᴗ❛๑)۶</p>
                                    <p style="color: #747474;font-size: 16px">提示：可以直接拖拽文件或粘贴截图</p>
                                </div>
                            </div>
                            <div class="statusBar" style="display:none;">
                                <div class="progress">
                                    <span class="text">0%</span>
                                    <span class="percentage"></span>
                                </div>
                                <div class="info"></div>
                                <div class="btns">
                                    <div id="filePicker2"></div>
                                    <div class="btn-shadow uploadBtn state-ready">开始上传</div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="clearfix"></div>

                    <div class="text-right" style="padding-bottom: 20px">
                        <a class="btn btn-default waves-effect waves-light" href="/admin/article">返回列表</a>
                        <button type="button" class="btn btn-primary btn-shadow" style="text-align: center"
                                onclick="submitArticle('1');">
                            保存文章
                        </button>
                        <button type="button" class="btn btn-warning btn-shadow" style=""
                                onclick="submitArticle('0');">
                            存为草稿
                        </button>
                    </div>
                </form>
            </div>


        </section>
    </section>

</section>

<!-- /中间内容 -->
<script src="<c:url value='/js/mditor/js/mditor.min.js'/>" cache="false"></script>

<!-- Web Uploader -->
<script type="text/javascript">
    // 添加全局站点信息
    var BASE_URL = 'js/plugins/webuploader';
    var img_URL = '<c:url value="/file/uploadFile"/>';

    /*var hutao = new $.hutao();
     hutao.successAlert({
     text: '文章保存成功'
     });*/
</script>
<script src="<c:url value='/js/plugins/webuploader/webuploader.js'/>" cache="false"></script>
<script src="<c:url value='/js/demo/webuploader-demo.js'/>" cache="false"></script>


<script src="<c:url value='/js/demo/article.js'/>" cache="false"></script>


<%--<script src="<c:url value='/js/tale/base.js'/>" cache="false"></script>--%>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>



