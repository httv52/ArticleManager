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
                    <a href="<c:url value="/admin/articleManege"/> "><i class="fa fa-edit"></i> 文章管理</a>
                </li>
                <li class="active">
                    <i class="fa"> 分类/标签管理</i>
                </li>
            </ul>
            <div class="m-b-md">
                <h3 class="m-b-none"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">分类/标签管理</span></span></h3>
            </div>

            <%--主要数据--%>
            <div class="row">
                <div class="col-md-6">
                    <section class="panel panel-success">
                        <header class="panel-heading"
                                style="color: #ffffff;background-color: #8ec165;border-color: #8ec165;">
                            <h1 class="panel-title">分类列表</h1>
                        </header>
                        <div class="panel-body">
                            <div class="m-b-10" style="padding: 1px 8px 8px 8px">
                                <c:forEach items="${categoryList}" var="categ" varStatus="status">
                                    <c:choose>
                                        <c:when test="${categ.categoryid == '0'}">
                                        <span class="btn-group m-b-10" style="padding-top: 7px">
                                            <button type="button"
                                                    class="btn btn-dark">默认分类 (${fn:length(categ.articleList)})
                                            </button>
                                        </span>
                                        </c:when>
                                        <c:otherwise>
                                        <span class="btn-group m-b-10" style="padding-top: 7px"
                                              id="categ_${categ.categoryid}">
                                            <span class="dropdown" style="padding: 11px 0px">
                                                <a data-target="#"
                                                        <c:if test="${status.count%5==0}">
                                                            class="btn btn-info dropdown-toggle"
                                                        </c:if>
                                                        <c:if test="${status.count%5==1}">
                                                            class="btn btn-success dropdown-toggle"
                                                        </c:if>
                                                        <c:if test="${status.count%5==2}">
                                                            class="btn btn-danger dropdown-toggle"
                                                        </c:if>
                                                        <c:if test="${status.count%5==3}">
                                                            class="btn btn-warning dropdown-toggle"
                                                        </c:if>
                                                        <c:if test="${status.count%5==4}">
                                                            class="btn btn-primary dropdown-toggle"
                                                        </c:if>
                                                   data-toggle="dropdown">${categ.categoryname} (${fn:length(categ.articleList)})
                                                    <span class="caret"></span>
                                                </a>
                                                <ul class="dropdown-menu animated fadeInRight">
                                                    <li><a href="javascript:;"
                                                           onclick="updateCateg('${categ.categoryid}','${categ.categoryname}')">修改
                                                    </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:;"
                                                           onclick="deleteCateg('${categ.categoryid}')">删除</a>
                                                    </li>
                                                </ul>
                                            </span>
                                        </span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </section>

                    <div style="padding-left:0px">
                        <div class="panel panel-default"
                             style="border: 1px solid #eee;border-left-width: 5px;border-left-color: #229e5c;border-radius: 3px;">
                            <div class="panel-body">
                                <form id="my_form" class="form-inline" role="form">
                                    <input type="hidden" id="my_categoryId"/>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="my_categoryName"
                                               placeholder="请输入分类名称">
                                    </div>
                                    <button id="save-category-btn" type="button" class="btn btn-success">保存分类
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <section class="panel panel-primary" style="color: #fff">
                        <header class="panel-heading">
                            <h1 class="panel-title">标签列表</h1>
                        </header>
                        <div class="panel-body">
                            <div class="m-b-10" style="padding: 1px 8px 8px 8px">
                                <c:if test="${empty tagList}">
                                    <div class="find-nothing">
                                        <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                                        <p style="color: #919191;padding-top: 5px">没有属于自己的标签哦~</p>
                                    </div>
                                </c:if>
                                <c:forEach items="${tagList}" var="tag" varStatus="status">
                                <span class="btn-group m-b-10" style="padding-top: 7px" id="tag_${tag.tagid}">
                                    <span class="dropdown" style="padding: 11px 0px">
                                        <a data-target="#"
                                                <c:if test="${status.count%5==0}">
                                                    class="btn btn-info dropdown-toggle"
                                                </c:if>
                                                <c:if test="${status.count%5==1}">
                                                    class="btn btn-success dropdown-toggle"
                                                </c:if>
                                                <c:if test="${status.count%5==2}">
                                                    class="btn btn-danger dropdown-toggle"
                                                </c:if>
                                                <c:if test="${status.count%5==3}">
                                                    class="btn btn-warning dropdown-toggle"
                                                </c:if>
                                                <c:if test="${status.count%5==4}">
                                                    class="btn btn-default dropdown-toggle"
                                                </c:if>
                                           data-toggle="dropdown">${tag.tagname} (${fn:length(tag.articleList)})
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu animated fadeInRight">
                                            <li>
                                                <a href="javascript:;"
                                                   onclick="updateTag('${tag.tagid}','${tag.tagname}')">
                                                    修改
                                                </a>
                                            </li>
                                            <li><a href="javascript:;" onclick="deleteTag('${tag.tagid}')"
                                                   class="del-category">删除</a></li>
                                        </ul>
                                    </span>
                                </span>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                    <div style="padding-left:0px">
                        <div class="panel panel-default">
                            <div class="panel-body"
                                 style="border: 1px solid #eee;border-left-width: 5px;border-left-color: #1b809e;border-radius: 3px;">
                                <form id="my_form_tag" class="form-inline" role="form">
                                    <input type="hidden" id="my_tagId"/>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="my_tagName"
                                               placeholder="请输入标签名称">
                                    </div>
                                    <button id="save-tag-btn" type="button" class="btn btn-info">保存标签</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section>
    </section>

</section>
</section>
<!-- /中间内容 -->

<script>
    var hutao = new $.hutao();

    function deleteCateg($id) {
        if ($id === '') {
            hutao.errorAlert({
                text: '分类 id 为空',
                title: '分类删除失败'
            });
            return;
        }

        swal({
                title: '确认删除该标题？',
                text: '您删除标题后，您的文章可能会受影响',
                type: "warning",
                showCancelButton: true,              //是否显示“取消”按钮。
                cancelButtonText: "取消",            //按钮内容
                cancelButtonColor: '#d33',
                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: '确定',
                closeOnConfirm: false,
                closeOnCancel: true
            },

            function () {
                hutao.post({
                    url: '<c:url value="/category/delete/"/>' + $id,
                    success: function (result) {
                        handlerResult(result, function () {
                            $("#categ_" + $id).remove();
                            hutao.successAlert({
                                text: '分类删除成功',
                                title: '分类删除成功'
                            });
                        });
                    }
                });
            });
    }

    function updateCateg($id, $name) {
        $('#my_form #my_categoryId').val($id);
        $('#my_form #my_categoryName').val($name);
    }

    $('#save-category-btn').click(function () {
        var categoryId = $('#my_form #my_categoryId').val();
        var categoryName = $('#my_form #my_categoryName').val();
        if (categoryName === '') {
            hutao.errorAlert({
                text: '分类名称不能为空',
                title: '分类保存失败'
            });
            return;
        }
        if (categoryName && categoryName !== '') {
            hutao.post({
                url: '<c:url value="/category/save"/>',
                data: {categoryId: categoryId, categoryName: categoryName},
                success: function (result) {
                    $('#my_form #my_categoryId').val('');
                    $('#my_form #my_categoryName').val('');
                    handlerResult(result, function () {
                        hutao.successAlertAndReload("分类保存成功");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    });
                }
            });
        }
    });


    function updateTag($id, $name) {
        $('#my_form_tag #my_tagId').val($id);
        $('#my_form_tag #my_tagName').val($name);
    }

    $('#save-tag-btn').click(function () {
        var tagId = $('#my_form_tag #my_tagId').val();
        var tagName = $('#my_form_tag #my_tagName').val();
        if (tagName === '') {
            hutao.errorAlert({
                text: '标签名称不能为空',
                title: '标签保存失败'
            });
            return;
        }

        var url;
        var data;
        if (tagId === '') {
            url = '<c:url value="/tag/save"/>';
            data = {tagName: tagName};
        } else {
            url = '<c:url value="/tag/update"/>';
            data = {tagId: tagId, tagName: tagName};
        }

        if (tagName && tagName !== '') {
            hutao.post({
                url: url,
                data: data,
                success: function (result) {
                    $('#my_form_tag #my_tagId').val('');
                    $('#my_form_tag #my_tagName').val('');
                    handlerResult(result, function () {
                        hutao.successAlertAndReload("标签保存成功");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    });
                }
            });
        }
    });

    function deleteTag($id) {
        if ($id === '') {
            hutao.errorAlert({
                text: '标签 id 为空',
                title: '标签删除失败'
            });
            return;
        }

        swal({
                title: '确认删除该标签？',
                text: '您删除标签后，您的文章可能会受影响',
                type: "warning",
                showCancelButton: true,              //是否显示“取消”按钮。
                cancelButtonText: "取消",            //按钮内容
                cancelButtonColor: '#d33',
                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: '确定',
                closeOnConfirm: false,
                closeOnCancel: true
            },

            function () {
                hutao.post({
                    url: '<c:url value="/tag/delete/"/>' + $id,
                    success: function (result) {
                        handlerResult(result, function () {
                            $("#tag_" + $id).remove();
                            hutao.successAlert({
                                text: '标签删除成功',
                                title: '标签删除成功'
                            });
                        });
                    }
                });
            });
    }
</script>


<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>



