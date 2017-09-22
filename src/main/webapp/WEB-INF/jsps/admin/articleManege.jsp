<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--导入顶部信息--%>
<%@include file="/WEB-INF/jsps/format/admin/head-top.jsp" %>

<!-- 中间内容 -->
<section id="content">
    <section class="vbox">
        <section class="scrollable padder" id="topAnchor">
            <!--路径-->
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li>
                    <a href="<c:url value="/admin/index.html"/> "><i class="fa fa-home"></i> 主页</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/index.html"/> "><i class="fa fa-home"></i> 文章管理</a>
                </li>
                <li>
                    <i class="fa fa-dashboard "> 文章管理</i>
                </li>
            </ul>


        </section>
    </section>

</section>
</section>
<!-- /中间内容 -->


