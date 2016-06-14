<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${basePath}/asserts/js/aside.menu.js"></script>
<c:choose>
	<c:when test="${cells.isEmpty()}">
		<div class="alert alert-warning">
			没有查到该课程id对应的课程!
		</div>
	</c:when>
	<c:otherwise>
		<div class="query-result">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<c:forEach items="${title}" var="t">
							<td align="center" width="${t.width}" style="border-bottom:0px;">${t.content}</td>
						</c:forEach>
							<td align="center" width="5%" style="border-bottom:0px;">操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${classes}" var="clazz">
						<tr>
							<c:forEach items="${clazz}" var="cell">
								<td align="center">${cell.toString()}</td>
							</c:forEach>
							<td align="center" class="info-row">
								<a href="javascript:void" data-asyn-load="true" data-request-url="${basePath}/admin/dbsource/readDetailDataByRowNumber.html?row=${clazz.get(0)}&returnUrl=${basePath}/admin/dbsource/readDataByClassId.html" target="#query-info-result" class="btn btn-sm btn-info">
									<span class="glyphicon glyphicon-search"></span>
									查看
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:otherwise>
</c:choose>