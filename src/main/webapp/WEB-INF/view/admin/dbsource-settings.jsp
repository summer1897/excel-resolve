<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript" src="${basePath}/asserts/js/admin.js"></script>
<div class="settings">
	<div class="model">
		<a href="javascript:void" data-target="${basePath}/admin/dbsource/upload.html" target="#admin-content">
			<span class="glyphicon glyphicon-th-list"></span>
			数据源导入
		</a>
	</div>
	<div class="model" >
		<a href="javascript:void" data-target="${basePath}/admin/dbsource/add.html" target="#admin-content">
			<span class="glyphicon glyphicon-plus"></span>
			添加
		</a>
	</div>
	<div class="model" >
		<a href="javascript:void" data-target="${basePath}/admin/" target="#admin-content">
			<span class="glyphicon glyphicon-link"></span>
			产品介绍
		</a>
	</div>
	<div class="model">
		<a href="javascript:void">
			<span class="glyphicon glyphicon-option-horizontal"></span>
		</a>
	</div>
</div>