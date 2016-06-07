<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="./common.jsp" />
<div class="input-group" style="margin-bottom:5px;">
	<div class="input-group-btn">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			查询条件<span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li><a href="#">where</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="#">SQL</a></li>
		</ul>
	</div>
	<!-- /btn-group -->
	<input type="text" class="form-control" aria-label="...">
	<span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
    </span>
</div>
<!-- /input-group -->
<table class="table table-striped">
	<c:if test="${!records.isEmpty()}">
		<thead>
			<tr>
				<c:forEach items="${records.get(0).getFields()}" var="field">
					<td>${field.getFieldName()}</td>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${records}" var="record">
				<tr>
					<c:forEach items="${record.getFields()}" var="field">
						<td>${field.getValue() }</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</c:if>
</table>