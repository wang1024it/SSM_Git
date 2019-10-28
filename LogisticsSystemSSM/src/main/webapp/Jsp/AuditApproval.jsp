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

<title>审批界面</title>

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
	font-family: "华文仿宋";
	font-weight: bolder;
}

td,th {
	vertical-align: middle;
	text-align: center;
}

tr {
	font-size: 11px;
	vertical-align: middle
}

.dataTable {
	text-align: center;
	vertical-align: middle;
}

thead {
	background: #cfecf3;
}

.lb {
	height: 34px;
	font-family: '华文中宋';
	color: #6f7b8a;
	font-size: 13.5px;
	line-height: 34px;
	margin-right: -3px;
	text-align: right;
	font-weight: normal;
	background: #F4F4F4;
	border: #AAAAAA solid 1px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: none;
	z-index: 100;
}

.control-label {
	padding-left: 0;
}

.interval {
	padding-left: 0;
}

.btn-info {
	background-color: #33AECC;;
	padding: 5px;
	border-radius: 20px;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div id="EmployeeTab">


			<div class="form-group">
				<div class="col-lg-3 col-sm-3 col-sm-3">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary lb">审核否：</label>
					<div class="col-lg-8 col-sm-8 col-md-8 interval">

						<select class="form-control" id="Auditing" name="Auditing"
							onchange="Chooose()">
							<option value="">-----请选择-----</option>
							<option value="1">-----已审核-----</option>
							<option value="0">-----未审核-----</option>
						</select>

					</div>
				</div>
				<div class="col-lg-3 col-sm-3 col-sm-3">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary lb">选择用户：</label>
					<div class="col-lg-8 col-sm-8 col-md-8 interval">

						<select class="form-control" id="UserID" name="UserID"
							onchange="Chooose()">
							<option value="">-----请选择-----</option>
							<c:forEach items="${list}" var="strlist">
								<option value="${strlist.getUserid()}">${strlist.getUsername()}</option>
							</c:forEach>
						</select>

					</div>
				</div>
				<div class="col-lg-3 col-sm-3 col-sm-3">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary lb">起始时间：</label>
					<div class="col-lg-8 col-sm-8 col-md-8 interval">

						<input type="date" class="form-control" id="start" name="start"
							onchange="Chooose()" />

					</div>
				</div>
				<div class="col-lg-3 col-sm-3 col-sm-3">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary lb">截止日期：</label>
					<div class="col-lg-8 col-sm-8 col-md-8 interval">

						<input type="date" class="form-control" id="end" name="end"
							onchange="Chooose()" />

					</div>
				</div>
			</div>
			<table id="TabFundRecord"
				class="display table table-hover table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>

						<th>内容</th>
						<th>提现金额</th>
						<th>申请时间</th>

						<th>批准人</th>
						<th>是否批准</th>

						<th>批准时间</th>
						<th>备注</th>
						<th>操作</th>



					</tr>
				</thead>

			</table>

		</div>



	</div>





	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var TabFundRecord;

		var startTime;
		var endTime;
		var CurDate;
		$(function() {

			var count = Math.round((window.screen.height - 480) / 50);
			TabFundRecord = $('#TabFundRecord')
					.DataTable(
							{
								"pagingType" : "simple_numbers",//设置分页控件的模式
								searching : false,//屏蔽datatales的查询框
								aLengthMenu : [ count ],//设置一页展示10条记录
								"bSort" : false,// 是否排序功能
								"bLengthChange" : false,//屏蔽tables的一页展示多少条记录的下拉列表
								"bAutoWidth" : false,// 是否非自动宽度  设置为false
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
								"lengthMenu" : [ 5, 10, 20, 50, 100 ],
								"processing" : true, //打开数据加载时的等待效果
								"serverSide" : true,//打开后台分页
								"ajax" : {
									"url" : "${ctx}/AdministratorsController/getList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.startTime = $("#start").val();
										d.endTime = $("#end").val();
										d.Auditing = $("#Auditing").val();
										d.UserID = $("#UserID").val();

									}
								},

								"columns" : [

										{
											"data" : "operationlog",
											"width" : "150px"
										},
										{
											"data" : "extractmoney",
											"width" : "50px"
										},
										{
											"data" : function(obj) {
												return ChangeDateFormat(obj.applicationtime);
											},
											"width" : "50px"
										},
										{

											"data" : "auditorname",
											"width" : "40px"

										},
										{
											"data" : function(obj) {
												return obj.isaudit == true ? "已批准"
														: "未批准";
											},
											"width" : "50px"
										},

										{
											"data" : function(obj) {
												return ChangeDateFormat(obj.audittime);
											},
											"width" : "40px"
										},
										{
											"data" : "remark"
										},
										{
											"data" : function(obj) {
												return ' <button class="btn btn-info AuditRecord" value="'
														+ obj.fundrecordid
														+ '"  onclick="Audit(this.value)">审核</button> '
											},
											"width" : "30px"

										} ]

							});

		});

		function Chooose() {

			ChangDay();
			if (startTime > CurDate) {
				layer.alert("开始日期不可以超过当前日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#start").val("");
				return;
			}
			if (startTime > endTime) {
				layer.alert("开始日期不可以超过结束日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#start").val("");
				return;
			}

			if (endTime > CurDate) {
				layer.alert("结束日期不可以超过当前日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#end").val("");
				return;
			}

			TabFundRecord.ajax.reload();
		}

		function Audit(fundRecordID) {
			if (fundRecordID > 0) {
				layer.confirm("是否审批？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框
					$.post(
							"${ctx}/AdministratorsController/auditMenoy.do?fundRecordID="
									+ fundRecordID, function(data) {
								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}
								if (data.state == true) {

									if (layer.alert(data.msg, {
										icon : 1,
										offset : '100px',
										btn : [ "确定" ]
									}, function(layerIndex) {
										layer.close(layerIndex);//关闭提示框

										parent.location.reload();
									}))
										;
								} else {
									layer.alert(data.msg, {
										icon : 0,
										title : "提示",
										offset : '100px'
									});

								}

							});

				});

			} else {
				layer.alert("请选择数据！！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}

		}
		function ChangDay() {

			startTime = new Date($("#start").val().replace("-", "/").replace(
					"-", "/"));
			endTime = new Date($("#end").val().replace("-", "/").replace("-",
					"/"));
			CurDate = new Date(GetTime().replace("-", "/").replace("-", "/"));
		}
	</script>
</body>
</html>
