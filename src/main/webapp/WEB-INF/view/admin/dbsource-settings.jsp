<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript" src="${basePath}/asserts/js/aside.menu.js"></script>
<div class="settings">
	<div class="model">
		<a href="javascript:void" data-request-url="${basePath}/admin/dbsource/upload.html" data-asyn-load="true" target="#admin-content">
			<span class="glyphicon glyphicon-th-list"></span>
			数据源导入
		</a>
	</div>
	<div class="model" >
		<a href="javascript:void" data-request-url="${basePath}/admin/dbsource/add.html" data-asyn-load="true" target="#admin-content">
			<span class="glyphicon glyphicon-plus"></span>
			添加
		</a>
	</div>
	<div class="model" >
		<a href="javascript:void" data-request-url="${basePath}/admin/" data-asyn-load="true" target="#admin-content">
			<span class="glyphicon glyphicon-link"></span>
			产品介绍
		</a>
	</div>
	<c:if test="${!cells.isEmpty()}">
		<div class="model">
			<a class="javascript:void" data-request-url="${basePath}/admin/dbsource/readData.html" data-asyn-load="true" target="#admin-content">
				<span class="glyphicon glyphicon-search"></span>
				查看数据源
			</a>
		</div>
	</c:if>
	<div class="model">
		<a href="javascript:void">
			<span class="glyphicon glyphicon-option-horizontal"></span>
		</a>
	</div>
</div>