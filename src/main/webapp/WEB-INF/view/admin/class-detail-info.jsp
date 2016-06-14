<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${basePath}/asserts/js/aside.menu.js"></script>
<c:choose>
	<c:when test="${cells.isEmpty()}">
		<div class="alert alert-warning">
			没有查到该课程序号对应的课程!
		</div>
	</c:when>
	<c:otherwise>
		<div class="path-nav">
			<ol class="breadcrumb">
  				<li><a href="javascript:void" data-request-url="${returnUrl}" data-asyn-load="true" target="#query-info-result">返回</a></li>
  				<li class="active">${classInfos.get(2).classInfo}</li>
			</ol>
		</div>
		<div class="query-result">
			<table class="table table-striped table-bordered">
				<tbody>
					<c:forEach items="${classInfos}" var="info">
						<tr>
							<td align="center">${info.title.content}</td>
							<td align="center">${info.classInfo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:otherwise>
</c:choose>