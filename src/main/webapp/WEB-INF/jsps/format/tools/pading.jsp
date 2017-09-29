<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-sm-4 hidden-xs">
        <c:set var="pagesize" value="${pageBean.pageSize}"/>
        <select class="input-sm form-control input-s-sm inline" name="pageSize">
            <option value="8" <c:if test="${'8' eq pagesize}">selected</c:if>>
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">每页8条记录</font>
                </font>
            </option>
            <option value="10" <c:if test="${'10' eq pagesize}">selected</c:if>>
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">每页10条记录</font>
                </font>
            </option>
            <option value="15" <c:if test="${'15' eq pagesize}">selected</c:if>>
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">每页15条记录</font>
                </font>
            </option>
            <option value="20" <c:if test="${'20' eq pagesize}">selected</c:if>>
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">每页20条记录</font>
                </font>
            </option>
        </select>
        <button class="btn btn-sm btn-default" onclick="mySubmit()">
            <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">应用</font></font>
        </button>
    </div>
    <div class="col-sm-4 text-center">
        <small class="text-muted inline m-t-sm m-b-sm">
            <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">
                    记录共${pageBean.totalCount}条　|　页数共${pageBean.totalPageCount}页
                </font>
            </font>
        </small>
    </div>
    <div class="col-sm-4 text-right text-center-xs">
        <ul class="pagination pagination-sm m-t-none m-b-none">
            <%--首页--%>
            <li>
                <a href="javascript:;" onclick="findByPageNow(1)"
                        <c:if test="${!pageBean.hasFirst}">
                            class="btn" disabled="disabled"</c:if>
                   data-toggle="tooltip" data-placement="top" title="首页">
                    <i class="fa fa-angle-double-left"></i>
                </a>
            </li>

            <li>
                <a href="javascript:;" onclick="findByPageNow(${pageBean.pageNow-1})"
                        <c:if test="${!pageBean.hasPre}">
                            class="btn" disabled="disabled"</c:if>
                   data-toggle="tooltip" data-placement="top" title="前一页">
                    <i class="fa fa-angle-left"></i>
                </a>
            </li>

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
                        <li>
                            <a class="active" data-toggle="tooltip" data-placement="top" title="当前页">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">${i }</font>
                                </font>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="javascript:;" onclick="findByPageNow(${i})">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">${i }</font>
                                </font>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li>
                <a href="javascript:;" onclick="findByPageNow(${pageBean.pageNow+1})"
                        <c:if test="${pageBean.pageNow>=pageBean.totalPageCount}">
                            class="btn" disabled="disabled" </c:if>
                   data-toggle="tooltip" data-placement="top" title="后一页">
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>

            <li>
                <a href="javascript:;" onclick="findByPageNow(${pageBean.totalPageCount})"
                        <c:if test="${pageBean.pageNow>=pageBean.totalPageCount}">
                            class="btn" disabled="disabled" </c:if>
                   data-toggle="tooltip" data-placement="top" title="尾页">
                    <i class="fa fa-angle-double-right"></i>
                </a>
            </li>
        </ul>
    </div>
</div>