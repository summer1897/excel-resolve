<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript" src="${basePath}/asserts/js/aside.menu.js"></script>
<script type="text/javascript">

function isEmpty(data){
	if(data.length <= 0){
		return true;
	}
	return false;
}

function isNumber(num){
	var regExp = /[1-9]\d*/;
	if(num.match(regExp))
		return true;
	return false;
}

$(function(){
	$("#class-id-query").on('click',function(){
		var classId = $("#class-id").val();
		//alert(classId);
		if(isEmpty(classId)){
			layer.msg('请输入课程id!', {icon: 5});
			return false;
		}else{
			if(!isNumber(classId) && classId.length == 6){
				layer.msg('请输入六位数字的课程id!', {icon: 5});
				return false;
			}
		}
		
		var requestUrl = $(this).attr("data-request-url") + classId;
		//alert(requestUrl);
		$($(this).attr("target")).load(requestUrl);
		
	});
	
	$("#class-number-query").on('click',function(){
		var classNumber = $("#class-number").val();
		//alert(classNumber);
		if(isEmpty(classNumber)){
			layer.msg('请输入课程序号!', {icon: 5});
			return false;
		}else{
			if(!isNumber(classNumber) && classNumber.length >= 1){
				layer.msg('输入的课程序号必须是正数!', {icon: 5});
				return false;
			}
		}
		
		var requestUrl = $(this).attr("data-request-url") + classNumber +"&returnUrl=${basePath}/admin/dbsource/readDataByClassId.html";
		alert(requestUrl);
		$($(this).attr("target")).load(requestUrl);
	});
	
});

</script>
<c:choose>
	<c:when test="${cells.isEmpty()}">
		<div class="alert alert-danger">
			你导入的文件没有数据!
		</div>
	</c:when>
	<c:otherwise>
		<fieldset>
			<legend>查询</legend>
			<div class="row" style="margin-bottom:30px;">
				<div class="col-sm-6">
					<div class="input-group">
		      			<input type="text" class="form-control" placeholder="请输入课程id" id="class-id">
		      			<div class="input-group-btn">
		      				<a href="javascript:void" data-request-url="${basePath}/admin/dbsource/readDataByClassId.html?classId=" target="#query-info-result" class="btn btn-success" id="class-id-query">课程id查询</a>
		      			</div>
		    		</div><!-- /input-group -->
				</div>
				<div class="col-sm-6">
					<div class="input-group">
		      			<input type="text" class="form-control" placeholder="请输入课程序号" id="class-number">
		      			<div class="input-group-btn">
		      				<a href="javascript:void" class="btn btn-success" data-request-url="${basePath}/admin/dbsource/readDetailDataByRowNumber.html?row=" target="#query-info-result" id="class-number-query">课程序号查询</a>
		      			</div>
		    		</div><!-- /input-group -->
				</div>
			</div>
		</fieldset>
		<div id="content"></div>
		<div id="query-info-result">
			<table class="table table-striped table-bordered" id="simple-table">
				<thead>
					<tr>
						<c:forEach items="${title}" var="t">
							<td align="center" width="${t.getWidth()}" style="border-bottom:0px;">${t.getContent()}</td>
						</c:forEach>
						<td align="center" width="5%" style="border-bottom:0px;">操作</td>
					</tr>
				</thead>
				<tbody id="table-body">
					<c:forEach items="${cells}" var="row">
						<tr>
							<c:forEach items="${row}" var="cell">
								<td align="center">${cell.toString()}</td>
							</c:forEach>
							<td align="center">
								<a href="javascript:void" data-asyn-load="true" data-request-url="${basePath}/admin/dbsource/readDetailDataByRowNumber.html?row=${row.get(0)}&returnUrl=${basePath}/admin/dbsource/readDataByClassId.html" target="#query-info-result" class="btn btn-sm btn-info">
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