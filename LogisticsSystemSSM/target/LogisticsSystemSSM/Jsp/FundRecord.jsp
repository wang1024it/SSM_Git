<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath }" scope="page" var="ctx"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>资金记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx}/Content/css/datatables.min.css"
	type="text/css"></link>

<style type="text/css">
* {
	font-family: "华文中宋";
	overflow: scroll;
	overflow-x: hidden;
	overflow-y: hidden;
}

.control-label {
	float: inherit;
	height: 34px;
	font-family: '华文中宋';
	color: #6f7b8a;
	font-size: 13.5px;
	line-height: 20px;
	margin-right: -3px;
	text-align: right;
	font-weight: normal;
	background: #F4F4F4;
	border: #AAAAAA solid 1px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: none;
	z-index: 100;
	font-size: 13.5px;
	line-height: 30px;
	margin-right: -3px;
	font-weight: normal;
	vertical-align: middle;
	display: inline-block;
}

.control-label {
	padding-left: 0;
}

.col-sm-8,.col-lg-8,.col-md-8 {
	padding-left: 0;
	margin: 0px
}

td,th {
	vertical-align: middle;
	text-align: center;
	color: #6c6c6c;
}

tr {
	font-size: 14px
}
</style>
</head>

<body style="background: #f8f9fa">
	<div class="container-fluid" style="padding: 0px">

		<div class="col-md-4 col-lg-4 col-xs-4 col-sm-4 "
			style="padding: 0px;margin-top: 5px">
			<label class="control-label col-md-4 col-lg-4 col-xs-4 col-sm-4 text-right">提现审核：</label>
			<div class="col-md-8 col-lg-8 col-xs-8 col-sm-8">
				<select class="form-control" id="Auditing" name="Auditing"
					onchange="Chooose()">
					<option value="">-----请选择-----</option>
					<option value="1">-----已审核-----</option>
					<option value="0">-----未审核-----</option>
				</select>
			</div>

		</div>

		<table id="example"
			class="display table table-hover table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th style="text-align: center;">内容</th>
					<th style="vertical-align: middle">金额</th>
					<th style="vertical-align: middle">申请时间</th>
					<th style="vertical-align: middle">是否批准</th>
					<th style="vertical-align: middle">批准人</th>
					<th style="vertical-align: middle">批准日期</th>
					<th style="vertical-align: middle">备注</th>
				</tr>
			</thead>
		</table>

	</div>


	<div class="modal fade bs-example-modal-lg" id="improt">
		<div class="modal-dialog modal-lg" style="width:800px!important">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h5 class="modal-title">导入单价Execl数据</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-4">
								<form action="${ctx}/servlet/fundRecordServlet?Type=importExcel"
									method="post" enctype="multipart/form-data" id="formImportExcel">
									<input type="reset" class="hidden" /> <input type="file" name="file"
										accept=".xls" value="dd" id="bb" onchange="upExcel()" />
								</form>
							</div>
							<div class="col-md-2 col-md-offset-6">
								<button type="button" class="btn btn-danger btn-radius btn-sm"
									onclick="saveImport()">导入到数据库</button>
							</div>
						</div>
						<div class="col-md-12 table-responsive">
							<table id="tabPiceImport">
								<tr>
									<th w_num="total_line">序号</th>
									<th w_index="RoomCode">房间代码</th>
									<th w_index="StructureArea">建筑面积</th>
									<th w_index="BuildingUitPice">建筑单价</th>
									<th w_index="StandardTotalPrice">标准总价</th>
									<th w_index="CoverInArea">套内面积</th>
									<th w_index="InnerUitPice">套内单价</th>
									<th w_index="BuildingSurvey">建筑实测</th>
									<th w_index="RoomDetailID" w_hidden="true">房间明细ID</th>

								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->





	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>

	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript">
		var table;
		$(function() {

			table = $('#example').DataTable({
				"pagingType" : "simple_numbers",//设置分页控件的模式  
				searching : false,//屏蔽datatales的查询框  
				aLengthMenu : [ 10 ],//设置一页展示10条记录  
				"bSort" : false,
				"bLengthChange" : false,//屏蔽tables的一页展示多少条记录的下拉列表  
				"bAutoWidth" : false,
				"oLanguage" : { //对表格国际化  
					"sLengthMenu" : "每页显示 _MENU_条",
					"sZeroRecords" : "没有找到符合条件的数据",
					//  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",    
					"sInfo" : "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
					"sInfoEmpty" : "木有记录",
					"sInfoFiltered" : "(从 _MAX_ 条记录中过滤)",
					"sSearch" : "搜索：",
					"sProcessing" : "正在加载中......",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "前一页",
						"sNext" : "后一页",
						"sLast" : "尾页"

					}
				},
				"processing" : true, //打开数据加载时的等待效果  
				"serverSide" : true,//打开后台分页  
				"ajax" : {
					"url" : "${ctx}/FundRecordController/getList.do",
					"dataSrc" : "aaData",
					"data" : function(d) {
						var Auditing = $("#Auditing").val();

						d.Auditing = Auditing;

					}
				},
				"aoColumnDefs" : [ {
					"sWidth" : "5%",
				}, {
					"sWidth" : "5%",

				}, {
					"sWidth" : "5%",

				}, {
					"sWidth" : "5%",

				}, {
					"sWidth" : "5%",

				} ],
				"columns" : [

				{
					"data" : "operationlog"
				}, {
					"data" : "extractmoney"
				}, {
					"data" : function(obj) {
						return ChangeDateFormat(obj.applicationtime);
					}
				}, {
					"data" : function(obj) {
						return obj.isaudit == "false" ? "未批准" : "已批准";
					}
				}, {
					"data" : "auditorname"
				}, {
					"data" : function(obj) {
						return ChangeDateFormat(obj.audittime);
					}
				}, {
					"data" : "remark"
				}, ]

			});

		});

		function Chooose() {

			table.ajax.reload();
		}

		//刷新模态框的数据
		function upExcel() {

			$("#formImportExcel").ajaxSubmit(function(tip) {

				// tabPiceImport.search();

			});

		}
	</script>
</body>
</html>
