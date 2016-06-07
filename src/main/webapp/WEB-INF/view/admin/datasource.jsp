<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<style>
<!--
.db-source table thead tr td{
border-bottom:0px;
}
tr td{
text-align:center;
font-size:16px;
}
thead tr td span{
font-size:14px;
cursor:pointer;
color:gray;
}
.pagination-container{
	padding:0px 20px;
	text-align:center;
}
-->
</style>
<div>
	<div>
		<ul class="breadcrumb no-radius">
		  <li><a href="${basePath}/admin/admin.html">首页</a></li>
		  <li class="active">数据源</li>
		</ul>
	</div>
	<!-- page header navigation end -->
	<div class="db-source">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<td class="no-bottom-border">选择</td>
					<td class="no-bottom-border">
						数据库
						<span class="glyphicon glyphicon-triangle-top"></span>
						<span class="glyphicon glyphicon-triangle-bottom"></span>
					</td>
					<td class="no-bottom-border">
						表数量
						<span class="glyphicon glyphicon-triangle-top"></span>
						<span class="glyphicon glyphicon-triangle-bottom"></span>
					</td>
					<td class="no-bottom-border">
						创建时间
						<span class="glyphicon glyphicon-triangle-top"></span>
						<span class="glyphicon glyphicon-triangle-bottom"></span>
					</td>
					<td class="no-bottom-border">操作</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>mysql_train</td>
					<td>4</td>
					<td>2016/05/27 15:33:40</td>
					<td>
						<button class="btn btn-xs btn-info">
							<span class="glyphicon glyphicon-search"></span>
							查看
						</button>
						<button class="btn btn-xs btn-warning">
							<span class="glyphicon glyphicon-pencil"></span>
							修改
						</button>
						<button class="btn btn-xs btn-danger">
							<span class="glyphicon glyphicon-trash"></span>
							删除
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>mysql_train</td>
					<td>4</td>
					<td>2016/05/27 15:33:40</td>
					<td>
						<button class="btn btn-xs btn-info">
							<span class="glyphicon glyphicon-search"></span>
							查看
						</button>
						<button class="btn btn-xs btn-warning">
							<span class="glyphicon glyphicon-pencil"></span>
							修改
						</button>
						<button class="btn btn-xs btn-danger">
							<span class="glyphicon glyphicon-trash"></span>
							删除
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>mysql_train</td>
					<td>4</td>
					<td>2016/05/27 15:33:40</td>
					<td>
						<button class="btn btn-xs btn-info">
							<span class="glyphicon glyphicon-search"></span>
							查看
						</button>
						<button class="btn btn-xs btn-warning">
							<span class="glyphicon glyphicon-pencil"></span>
							修改
						</button>
						<button class="btn btn-xs btn-danger">
							<span class="glyphicon glyphicon-trash"></span>
							删除
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>mysql_train</td>
					<td>4</td>
					<td>2016/05/27 15:33:40</td>
					<td>
						<button class="btn btn-xs btn-info">
							<span class="glyphicon glyphicon-search"></span>
							查看
						</button>
						<button class="btn btn-xs btn-warning">
							<span class="glyphicon glyphicon-pencil"></span>
							修改
						</button>
						<button class="btn btn-xs btn-danger">
							<span class="glyphicon glyphicon-trash"></span>
							删除
						</button>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- table end -->
	</div>
	<!-- dbsource end -->
	<div class="pagination-container">
		<nav>
		  <ul class="pagination">
		    <li>
		      <span>
		        <span aria-hidden="true">&laquo;</span>
		      </span>
		    </li>
		    <li>
		      <span>1 <span class="sr-only">(current)</span></span>
		    </li>
		    <li class="active">
		      <span>2<span class="sr-only">(current)</span></span>
		    </li>
		    <li>
		      <span>3<span class="sr-only">(current)</span></span>
		    </li>
		    <li>
		      <span>4 <span class="sr-only">(current)</span></span>
		    </li>
		    <li>
		      <span>
		        <span aria-hidden="true">&raquo;</span>
		      </span>
		    </li>
		  </ul>
		</nav>
	</div>
</div>