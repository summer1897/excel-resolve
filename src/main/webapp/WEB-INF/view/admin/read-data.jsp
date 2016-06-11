<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript">
<!--

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

function queryByRowNumber(){
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
	
	$.ajax({
		type : "get",
		url : "${basePath}/admin/dbsource/readDataByRowNumber.html",
		data: {row : classNumber},
		dataType : "json",
		success : function(data){
			if(data.lengtn <= 0){
				layer.msg('没有该序号的课程!', {icon: 5});
				return false;
			}
			//alert(data.length);
			var html = "<tr data-row-number='"+data[0]+"' onclick='queryByRowNumber();'>";
			for(var i = 0; i < data.length; ++i){
				html += "<td align='center'>" + data[i] + "</td>";
			}
			html += "</tr>";
			
			$("#table-body").html(html);
		}
	});
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
		
		$.ajax({
			type : "get",
			url : "${basePath}/admin/dbsource/readDataByClassId.html",
			data : {"classId":classId},
			dataType : "json",
			success : function(data){
				var len = data.length;
				if(len <= 0){
					layer.msg('没有找到该课程号的课程!', {icon: 5});
					return false;
				}
				var html = "";
				//alert(data[0][1]);
				for(var i = 0; i < len; ++i){
					html += "<tr data-row-number='"+data[i][0]+"'>"
					for(var j = 0; j < 7; ++j){
						html += "<td align='center'>" + data[i][j] + "</td>";
					}
					html += "</tr>";
				}
				//alert(html);
				$("#table-body").html(html);
			}
		});
	});
	
	$("#class-number-query").on('click',queryByRowNumber);
	
	$("#table-body").on('mouseover','tr',function(){
		//alert("hell");
		layer.tips('点击查看课程详细信息!', $(this), {
 						tips: [4, '#78BA32']
		});
	});
	
	$("#table-body").on('click','tr',function(){
		
		//$(this).on('click',function(){
			var row = $(this).attr("data-row-number");
			//alert("heheh");
			$.ajax({
				type : "get",
				url : "${basePath}/admin/dbsource/readDetailDataByRowNumber.html",
				data : {row : row},
				dataType : "json",
				success : function(data){
					var title = data.title;
					var info = data.info;
					var html = "<table class='table table-bordered' id='info'>";
					for(var i = 0; i < title.length; ++i){
						html += "<tr><td align='center'>" + title[i].content + "</td>" +
								"<td align='center'>" + info[i] + "</td></tr>";
					}
					html += "</table>";
					//alert(html);
					layer.open({
						  type: 1,
						  shade: false,
						  title: false, //不显示标题
						  content: html, //捕获的元素,
						  area : ['800px','700px'],
						  cancel: function(index){
						    layer.close(index);
						    this.content.show();
						    //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', {time: 5000, icon:6});
						  }
					});
				}
			});
		//})
	});
});
//-->
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
		      			<input type="text" class="form-control" placeholder="请输入课程id" name="classId" id="class-id">
		      			<div class="input-group-btn">
		      				<a href="javascript:void" class="btn btn-success" id="class-id-query">课程id查询</a>
		      			</div>
		    		</div><!-- /input-group -->
				</div>
				<div class="col-sm-6">
					<div class="input-group">
		      			<input type="text" class="form-control" placeholder="请输入课程序号" id="class-number">
		      			<div class="input-group-btn">
		      				<a href="javascript:void" class="btn btn-success" id="class-number-query">课程序号查询</a>
		      			</div>
		    		</div><!-- /input-group -->
				</div>
			</div>
		</fieldset>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<c:forEach items="${title}" var="t">
						<td align="center" width="${t.getWidth()}" style="border-bottom:0px;">${t.getContent()}</td>
					</c:forEach>
				</tr>
			</thead>
			<tbody id="table-body">
				<c:forEach items="${cells}" var="row">
					<tr data-row-number="${row.get(0)}" class="info-row">
						<c:forEach items="${row}" var="cell">
							<td align="center">${cell.toString()}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>