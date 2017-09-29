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
            <div class="wrapper wrapper-content" style="padding: 0px">
                <form action="<c:url value="/admin/articleManege"/> " method="post" id="myform">

                    <input type="hidden" id="my_pageNow" name="pageNow" value="1">
                    <input type="hidden" id="my_state" name="state" value="${state}">
                    <input type="hidden" id="my_categoryId" name="categoryId" value="${categoryId}">
                    <input type="hidden" id="my_tagId" name="tagId" value="${tagId}">

                    <div class="row">
                        <%--管理--%>
                        <div class="col-sm-3">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="file-manager">
                                        <h5><i class="fa fa-th-list"></i> 状态</h5>
                                        <a href="javascript:;" onclick="findByState(-1)" class="file-control"
                                           id="file-control_All">
                                            <i class="fa fa-th"> 所有</i>
                                        </a>
                                        <a href="javascript:;" onclick="findByState(0)" class="file-control"
                                           id="file-control_0">
                                            <i class="fa fa-paperclip"> 草稿</i>
                                        </a>
                                        <a href="javascript:;" onclick="findByState(1)" class="file-control"
                                           id="file-control_1">
                                            <i class="fa fa-link"> 已发布</i>
                                        </a>
                                        <a href="javascript:;" onclick="findByState(2)" class="file-control"
                                           id="file-control_2">
                                            <i class="fa fa-unlink"> 已关闭</i>
                                        </a>

                                        <div class="hr-line-dashed"></div>

                                        <a href="<c:url value="/admin/publish"/> "
                                           class="btn btn-success btn-block">发布文章</a>

                                        <div class="hr-line-dashed"></div>
                                        <div class="media">
                                            <span class="pull-left"><h5><i class="fa fa-cloud"> 分类</i></h5></span>
                                            <div class="pull-right">
                                                <a href="<c:url value="/admin/categManege"/>"
                                                   class="btn btn-warning btn-xs temp">
                                                    <i class="fa fa-pencil"></i> 添加分类/标签</a>
                                            </div>
                                        </div>
                                        <ul class="folder-list" style="padding: 0">
                                            <li>
                                                <a href="javascript:;" onclick="findByCategory('-1')">
                                                    <span id="categ_all"><i class="fa fa-skyatlas"></i> 所有分类</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;" onclick="findByCategory('0')">
                                                <span id="categ_0">
                                                    <i class="fa fa-skyatlas"></i> 默认分类
                                                </span>
                                                </a>
                                            </li>
                                            <c:forEach items="${categoryList}" var="categ">
                                                <li>
                                                    <a href="javascript:;"
                                                       onclick="findByCategory('${categ.categoryid}')">
                                                    <span id="categ_${categ.categoryid}">
                                                        <i class="fa fa-skyatlas"></i> ${categ.categoryname}
                                                    </span>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <h5 class="tag-title"><i class="fa fa-tags"></i> 标签</h5>
                                        <c:if test="${empty categoryList}">
                                            <div class="find-nothing">
                                                <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                                                <div>没有属于自己的标签哦~</div>
                                            </div>
                                        </c:if>
                                        <c:if test="${!empty tagList}">
                                            <ul class="tag-list" style="padding: 0">
                                                <li id="tag_all">
                                                    <a href="javascript:;" onclick="findByTag('-1')">
                                                        <i class="fa fa-tag"></i> 所有标签
                                                    </a>
                                                </li>
                                                <c:forEach items="${tagList}" var="tag">
                                                    <li id="tag_${tag.tagid}">
                                                        <a href="javascript:;" onclick="findByTag('${tag.tagid}')">
                                                            <i class="fa fa-tag"></i> ${tag.tagname}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-sm-12" style="padding-left: 0px">
                                    <c:if test="${empty articleList}">
                                        <div class="find-nothing" style="padding-top: 80px">
                                            <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                                            <div>没有找到你需要的文章哦~</div>
                                        </div>
                                    </c:if>

                                    <%--表格数据--%>
                                    <c:if test="${!empty articleList}">
                                        <table class="footable table table-bordered" data-page-size="20" style="background: #fff"
                                               data-paging="false">
                                            <thead>
                                            <tr>
                                                <th width="30%" style="text-align:center;">文章标题</th>
                                                <th style="text-align:center;">发布时间</th>
                                                <th style="text-align:center;">浏览量</th>
                                                <th style="text-align:center;">所属分类</th>
                                                <th style="text-align:center;">发布状态</th>
                                                <th style="text-align:center;">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${articleList}" var="article">
                                                <tr>
                                                    <td>
                                                        <a href="<c:url value="/p/"/>${article.aid} "
                                                           title="${article.title}">
                                                        <span class="contentControl_2">
                                                                ${article.title}
                                                        </span>
                                                        </a>
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle">
                                                            ${article.createdDateTimeView}
                                                    </td>
                                                    <td style="text-align:center; vertical-align:middle">
                                                            ${article.views}
                                                    </td>
                                                    <td style="text-align:center;vertical-align:middle">
                                                        <a href="javascript:;"
                                                           onclick="findByCategory(${article.category.categoryid})">
                                                                ${article.category.categoryname}
                                                        </a>
                                                    </td>
                                                    <td style="text-align:center; vertical-align:middle">
                                                        <c:choose>
                                                            <c:when test="${article.state == 0}">
                                                                <span class="label label-default">${article.stateView}</span>
                                                            </c:when>
                                                            <c:when test="${article.state == 1}">
                                                                <span class="label label-info">${article.stateView}</span>
                                                            </c:when>
                                                            <c:when test="${article.state == 2}">
                                                                <span class="label label-warning">${article.stateView}</span>
                                                            </c:when>
                                                            <c:when test="${article.state == 3}">
                                                                <span class="label label-danger">${article.stateView}</span>
                                                            </c:when>
                                                        </c:choose>

                                                    </td>
                                                    <td style="vertical-align:middle">
                                                        <c:if test="${article.state == 2}">
                                                            <a href="" class="btn btn-dark btn-sm">
                                                                <i class="fa fa-history"></i> 恢复
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${article.state != 2}">
                                                            <a href="" class="btn btn-success btn-sm">
                                                                <i class="fa fa-edit"></i> 编辑
                                                            </a>
                                                            <a href="" class="btn btn-danger btn-sm">
                                                                <i class="fa fa-trash-o"></i> 删除
                                                            </a>
                                                            <c:if test="${article.state != 0}">
                                                                <a href="" class="btn btn-warning btn-sm"
                                                                   style="color: #686868 !important">
                                                                    <i class="fa fa-magic"></i> 预览
                                                                </a>
                                                            </c:if>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="6">
                                                        <%--分页--%>
                                                    <%@include file="/WEB-INF/jsps/format/tools/pading.jsp" %>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
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

<script src="<c:url value="/js/demo/articleManage.js"/> " cache="false"></script>
<script src="<c:url value="/js/plugins/footable/footable.all.min.js"/> "></script>
<script>
    $(document).ready(function () {
        $('.footable').footable({
            "paging": {
                paging:20,
                "enabled": false
            }
        });
    });

</script>

<%--导入底部文件--%>
<%@include file="/WEB-INF/jsps/format/admin/foot.jsp" %>



