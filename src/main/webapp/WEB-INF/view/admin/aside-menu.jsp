<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="aside-menu" id="admin-menu">
	<li class="list-item">
		<a href="javascript:void" data-target="${basePath}/admin/settings.html" target="#admin-content">
			<span class="glyphicon glyphicon-user"></span>
			基本设置
		</a>
	</li>
	<li class="list-item">
		<a href="javascript:void" data-target="${basePath}/admin/dbsource/settings.html" target="#admin-content">
			<span class="glyphicon glyphicon-cog"></span>
			数据源设置
		</a>
	</li>
	<li class="list-item">
		<a href="javascript:void" data-target="${basePath}/admin/dbsource.html" target="#admin-content">
			<span class="glyphicon glyphicon-list"></span>
			数据源
			<span class="badge">4</span>
		</a>
	</li>
	<li class="list-item">
		<a href="${basePath}/admin/login.html">
			<span class="glyphicon glyphicon-log-out"></span>
			退出
		</a>
	</li>
</ul>