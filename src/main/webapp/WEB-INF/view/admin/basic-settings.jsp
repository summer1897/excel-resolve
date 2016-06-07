<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript" src="${basePath}/asserts/js/admin.js"></script>
<div class="settings">
	<div class="model">
		<a href="" data-target="${basePath}/admin/dbsource/info.html" target="#admin-content">
			<span class="glyphicon glyphicon-zoom-in"></span>
			连接信息
		</a>
	</div>
	<div class="model" >
		<a href="" data-target="${basePath}/admin/password/modify.html" target="#admin-content">
			<span class="glyphicon glyphicon-edit"></span>
			密码修改
		</a>
	</div>
	<div class="model" >
		<a href="" data-target="${basePath}/admin/product/introduce.html" target="#admin-content">	
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