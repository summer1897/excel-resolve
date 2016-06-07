<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript" src="${basePath}/asserts/js/admin.js"></script>
<style>
<!--
.upload-form-button{
	color:#5cb85c;
}
-->
</style>
<script type="text/javascript">
$(function(){
	$("#upload").click(function(){
		$($(this).attr("data-target")).trigger("click");
	});
	
	$("#uploadFile").change(function(){
		$("#upload").val($(this).val());
	});
	
	//$("#upload-form").hide();
	
		/*$('#uploadFile').uploadify({
	        //'buttonClass' : 'upload',
	        'swf'      : '${basePath}/asserts/js/uploadify.swf',  
	        'uploader' : '${basePath}/admin/dbsource/upload.html',
	        'cancelImg' : '${basePath}/asserts/img/uploadify-cancel.png',
	        'fileObjName' : 'uploadFile',  
	        'fileSizeLimit' : '0',  
	        'buttonText' : '请选择...',
	        //'cancelImg' : '${basePath}/asserts/img/uploadify-cancel.png',
	        //'fileExt' : '*.xls;*.xlsx',
	        'onQueueComplete' : function(data) {  
	        	alert(data.isSuccess);
	        } 
	          
	    });*/
	    $("#scan-data").hide();
	 $("#upload-handler").click(function(){
		 $.ajaxFileUpload({
	         url: '${basePath}/admin/dbsource/upload.html', 
	         type: 'post',
	         secureuri: false, //一般设置为false
	         fileElementId: 'uploadFile', // 上传文件的id、name属性名
	         dataType: 'application/json', //返回值类型，一般设置为json、application/json
	         success: function(data, status){  
	        	 if(status == "success"){
	        	 	layer.alert(data, {icon: 6});
	        	 	$("#data-panel").hide();
	        	 	$("#scan-data").show();
	        	 }
	            	// alert("上传成功!");
	         },
	         error: function(data, status, e){ 
	             alert(data);
	         }
	     });
		 return false;
	 });
	 
});
//-->
</script>
<div class="" style="width:80%;margin:auto;padding-top:30px;">
	<fieldset id="data-panel">
		<legend>数据源导入</legend>
		<form class="form-inline" method="post" enctype="multipart/form-data" id="dbsource-form">
			<div class="form-group">
				 <div class="col-sm-10">
				 	<input type="text" data-target="#uploadFile" id="upload"/>
				 	<button type="submit" class="btn btn-sm btn-success" id="upload-handler">
						<span class="glyphicon glyphicon-upload"></span>
						上传
					</button>
				 	<input type="file" name="uploadFile" class="form-control" id="uploadFile" style="visibility:hidden;"/>
				 </div>
			</div>
		</form>
	<!-- form-end -->
	</fieldset>
	<div class="settings" id="scan-data">
		<div class="model">
			<a class="btn btn-sm btn-success" href="javascript:void" data-target="${basePath}/admin/dbsource/readData.html" target="#admin-content">查看导入数据</a>
		</div>
	</div>
</div>