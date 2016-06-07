<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius:0px;margin-bottom:0px;clear:both;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#db-navbar" aria-expanded="false">
       			<span class="sr-only">Toggle navigation</span>
       			<span class="icon-bar"></span>
       			<span class="icon-bar"></span>
      				<span class="icon-bar"></span>
     			</button>
     			<a class="navbar-brand" href="${basePath}/index">Easy.reader</a>
		</div>
		<!-- navbar-header-end -->
		<div class="collapse navbar-collapse" id="db-navbar">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.webUser.getUserId() != null}">
						<li>
							<a href="">
							<span class="glyphicon glyphicon-log-in"></span>
								登陆
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="javascript::void;">你好，${sessionScope.webUser.getUserId()}</a>
						</li>
						<li>
							<a href="${basePath}/admin/login.html">
								<span class="glyphicon glyphicon-log-out"></span>
								退出
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- db-navbar-end -->
	</div>
	<!-- container-fluid-end -->
</nav>
<!-- nav-end -->