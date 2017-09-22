<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${errorList != null}">
    <div class="container aside-xxl">
        <div class="alert alert-danger alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">×</span>
            </button>
            <h4>数据出错！</h4>
            <ol>
                <c:forEach items="${errorList}" var="error">
                    <li> ${error.defaultMessage} </li>
                </c:forEach>
            </ol>
        </div>
    </div>
</c:if>
