<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<c:choose>
	<c:when test="${cells.isEmpty()}">
		<div class="alert alert-danger">
			你导入的文件没有数据!
		</div>
	</c:when>
	<c:otherwise>
		<table class="table table-striped">
			<thead>
				<tr>
					<c:forEach items="${title}" var="t">
						<td align="center">${t}</td>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cells}" var="row">
					<tr>
						<c:forEach items="${row}" var="cell">
							<td align="center">${cell.toString()}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>