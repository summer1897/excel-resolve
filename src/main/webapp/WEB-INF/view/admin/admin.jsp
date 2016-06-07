<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/common.jsp"/>
<link rel="stylesheet" type="text/css" href="${basePath}/asserts/css/admin.menu.css">
<link rel="stylesheet" type="text/css" href="${basePath}/asserts/css/admin.css">
<script type="text/javascript" src="${basePath}/asserts/js/aside.menu.js"></script>
<title>后台管理页面</title>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function(){
		var rightPageHeight = $(".right").height();
		var windowHeight = $(window).height();
		if(windowHeight >= rightPageHeight){
			$(".left").css("height",windowHeight+"px");
		}else{
			$(".left").css("height",rightPageHeight+"px");
		}
		$(".left").css("maxHeight",windowHeight+"px");
		$(".right").css("maxHeight",windowHeight+"px");
		$(".aside-menu").find(".list-item").each(function(){
			$(this).find("a").mouseover(function(){
				//alert("hehe");
				$(this).addClass("list-item-high");
			}).mouseout(function(){
				$(this).removeClass("list-item-high");
			});
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container margin-left-clear margin-top-clear padding-left-clear width-all padding-right-clear padding-bottom-clear margin-bottom-clear">
		<div class="row margin-left-clear margin-right-clear padding-right-clear">
			<div class="col-md-2 left margin-left-clear padding-left-clear padding-right-clear ">
				<jsp:include page="./aside-menu.jsp"/>
			</div>
			<div class="col-md-10 right" id="admin-content" style="padding-left:30px;padding-right:30px;">
				<h1 style="color:green;">Easy.reader</h1>
			</div>
		</div>
	</div>
</body>
</html>