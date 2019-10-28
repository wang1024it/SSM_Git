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

<title>签到界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx }/Content/css/public.css" type="text/css"></link>

<link rel="stylesheet" href="${ctx }/Content/css/signin.css" type="text/css"></link>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<link rel="stylesheet" href="${ctx }/Content/css/Map.css" type="text/css"></link>

<link rel="stylesheet" href="${ctx}/Content/css/datatables.min.css"
	type="text/css"></link>

<style type="text/css">
.panel-body {
	padding: 10px 10px;
}

* {
	font-family: "华文中宋";
	overflow: scroll;
	overflow-x: hidden;
	overflow-y: hidden;
}

label {
	float: inherit;
	height: 34px;
	font-family: '华文中宋';
	color: #6f7b8a;
	font-size: 13.5px;
	line-height: 20px;
	margin-right: -3px;
	text-align: center;
	font-weight: normal;
	background: #F4F4F4;
	border: #AAAAAA solid 1px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: none;
	z-index: 100;
	font-size: 13.5px;
	line-height: 20px;
	margin-right: -3px;
	text-align: center;
	font-weight: normal;
}

.control-label {
	padding-left: 0;
}

.col-lg-8,.col-md-8,.col-sm-8,.col-xs-8 {
	padding-left: 0;
}

td,th {
	vertical-align: middle;
	text-align: center;
}

#div tr,div {
	font-size: 12px
}
</style>
</head>

<body>
	<div class="container-fluid">


		<div id="PingChang">
			<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3">

				<div class="top flex flex-align-end flex-pack-center flex-warp"
					style="margin-top: 30px;">
					<div class="out-1 flex flex-align-center flex-pack-center" id="signIn">
						<div class="out-2 flex flex-align-center flex-pack-center"
							onclick="QianDao()" id="ShangBan">
							<div class="signBtn" style="cursor: pointer;">
								<strong id="sign-txt" style="font-size: 12px">${bol}</strong><img
									src="${ctx }/Content/image/328692.png" height="30px" width="30px"
									style="margin-left: 20px" />
							</div>

						</div>

					</div>

				</div>

				<div class="Calendar">
					<div id="toyear" class="flex flex-pack-center">
						<div id="idCalendarPre">
							<img src="${ctx }/Content/image/371404.png"
								style="margin-top: 50%;cursor: pointer;" width="16px" height="16px" />
						</div>
						<div class="year-month">
							<span id="idCalendarYear">2018</span>年<span id="idCalendarMonth">12</span>月
						</div>
						<div id="idCalendarNext">
							<img src="${ctx }/Content/image/37140.png"
								style="margin-top: 50%;cursor: pointer;" width="16px" height="16px" />
						</div>
					</div>
					<table border="1px" cellpadding="0" cellspacing="0">
						<thead>
							<tr class="tou">
								<td>日</td>
								<td>一</td>
								<td>二</td>
								<td>三</td>
								<td>四</td>
								<td>五</td>
								<td>六</td>
							</tr>
						</thead>
						<tbody id="idCalendar">
							<tr>
								<td><span>&nbsp;</span></td>
								<td><span>&nbsp;</span></td>
								<td><span>&nbsp;</span></td>
								<td><span>&nbsp;</span></td>
								<td><span>&nbsp;</span></td>
								<td><span>&nbsp;</span></td>
								<td><span>1</span></td>
							</tr>
							<tr>
								<td><span>2</span></td>
								<td><span>3</span></td>
								<td><span>4</span></td>
								<td><span>5</span></td>
								<td><span>6</span></td>
								<td><span>7</span></td>
								<td><span>8</span></td>
							</tr>
							<tr>
								<td><span>9</span></td>
								<td><span>10</span></td>
								<td><span>11</span></td>
								<td><span>12</span></td>
								<td class="onToday"><span>13</span></td>
								<td><span>14</span></td>
								<td><span>15</span></td>
							</tr>
							<tr>
								<td><span>16</span></td>
								<td><span>17</span></td>
								<td><span>18</span></td>
								<td><span>19</span></td>
								<td><span>20</span></td>
								<td><span>21</span></td>
								<td><span>22</span></td>
							</tr>
							<tr>
								<td><span>23</span></td>
								<td><span>24</span></td>
								<td><span>25</span></td>
								<td><span>26</span></td>
								<td><span>27</span></td>
								<td><span>28</span></td>
								<td><span>29</span></td>
							</tr>
							<tr>
								<td><span>30</span></td>
								<td><span>31</span></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>






			</div>
			<div class=" col-lg-9 col-sm-9 col-md-9 col-xs-9" id="div">
				<table id="TabAttendance"
					class="display table table-hover table-striped table-bordered"
					cellspacing="0" width="100%" style="margin-top: 30px;">
					<thead>
						<tr>
							<th style="text-align: center;">用户名称</th>
							<th style="vertical-align: middle">上班时间</th>
							<th style="vertical-align: middle">下班时间</th>
							<th style="vertical-align: middle">操作</th>

						</tr>
					</thead>
				</table>


			</div>






		</div>
		<div id="DiTu" style="display: none;">

			<div style=" width:100%;height:90%;border:#ccc soliud 1px;" id="dituContent">

			</div>
			<button class="btn " style="background-color:  #33AECC;padding: 8px"
				onclick="back()">返 回</button>
		</div>


		<div id="TuFaShiJian" style="margin-top: 30px;display: none;">
			<form class="form-horizontal" id="Form" onsubmit="return false">
				<div class="form-group">
					<div class="col-lg-2 col-sm-2 col-md-2"></div>
					<div class="col-lg-10 col-sm-10 col-sm-10">
						<label class="control-label col-lg-3 col-sm-3 col-md-3">请假理由：</label>
						<div class="col-lg-6 col-sm-6 col-md-6" style="padding-left: 0px">
							<input class="form-control" id="Reason" name="Reason"
								placeholder="请输入请假的理由（50个字以内）" maxlength="100" /> <input
								class="form-control hidden" id="AttendanceID" name="AttendanceID" />
						</div>
					</div>

				</div>
				<div class="form-group">
					<div class="col-lg-2 col-sm-2 col-md-2"></div>
					<div class="col-lg-10 col-sm-10 col-sm-10">

						<label class="control-label col-lg-3 col-sm-3 col-md-3">请假天数：</label>
						<div class="col-lg-6 col-sm-6 col-md-6" style="padding-left: 0px">
							<input class="form-control" id="LeaveDay" name="LeaveDay"
								placeholder="请输入请输入请假的天数（10个字以内）" maxlength="100" />
						</div>
					</div>

				</div>
				<div class="form-group">
					<div class="col-lg-8 col-sm-8 col-md-8"></div>
					<div class="col-lg-2 col-sm-2 col-md-2">
						<button class="btn" onclick="QueDing()">确定</button>
						<button class="btn" onclick="GuanBi()">关闭</button>
					</div>
				</div>
			</form>

		</div>

		<div class="modal fade" id="modalone">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">温馨提示：</h4>
					</div>
					<div class="modal-body">
						<p id="Tip"></p>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="GuanBiTip()">确定</button>

					</div>
				</div>
			</div>
		</div>



		<div class="modal fade" id="modaltwo">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">上传车辆信息:</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="FormCar" onsubmit="return false">
							<div class="form-group">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">油量：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="oilmass" name="oilmass"
											placeholder="请输入车辆剩余油量" maxlength="4"
											onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
											onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">里程：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="mileage" name="mileage"
											placeholder="请输入车辆里程" maxlength="4"
											onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
											onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
									</div>
								</div>

							</div>

							<div class="form-group">
								<div class="col-lg-12 col-sm-12 col-sm-12">
									<label class="control-label col-lg-2 col-sm-2 col-md-2">位置：</label>
									<div class="col-lg-10 col-sm-10 col-md-10" style="padding-left: 0px">
										<input class="form-control" id="location" name="location"
											placeholder="请保持网络通畅" maxlength="100" readonly="readonly" />
									</div>
								</div>

							</div>

						</form>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="ReFresh()">刷新位置</button>
						<button class="btn btn-info" onclick="uploadCar()">确定</button>

					</div>
				</div>
			</div>
		</div>




		<div class="modal fade" id="modalthree">
			<div class="modal-dialog" style="width: 1000px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="title"></h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="FormInfor" onsubmit="return false">

							<div class="form-group">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">上班签到时间：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="startworktime" name="startworktime"
											readonly="readonly" />
									</div>
								</div>

								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">下班签到时间：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="offwork" name="offwork"
											readonly="readonly" />
									</div>
								</div>


							</div>
							<div class="form-group driver" style="display: none;">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">上班车辆油量：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="startoilmass" name="startoilmass"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6 ">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">下班车辆油量：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="offoilmass" name="offoilmass"
											readonly="readonly" />
									</div>
								</div>

							</div>

							<div class="form-group driver" style="display: none;">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">上班车辆位置：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="startlocation" name="startlocation"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">下班车辆位置：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="offlocation" name="offlocation"
											readonly="readonly" />
									</div>
								</div>

							</div>
							<div class="form-group driver" style="display: none;">


								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">上班车辆里程：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="startmileage" name="startmileage"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6 ">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">下班车辆里程：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="offmileage" name="offmileage"
											readonly="readonly" />
									</div>
								</div>

							</div>



							<div class="form-group">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">请假理由：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="reason" name="reason"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">请假天数：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="leaveday" name="leaveday"
											readonly="readonly" />
									</div>
								</div>

							</div>



							<div class="form-group">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">申请时间：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="applicationtime"
											name="applicationtime" readonly="readonly" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">审核时间：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="audittime" name="audittime"
											readonly="readonly" />
									</div>
								</div>

							</div>

							<div class="form-group">
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">批准否：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="isratification" name="isratification"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-sm-6">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">备注：</label>
									<div class="col-lg-8 col-sm-8 col-md-8">
										<input class="form-control" id="remark" name="remark"
											readonly="readonly" />
									</div>
								</div>

							</div>
						</form>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<div class="driver" style="display: none;">
							<input class="hidden" id="KaiShi" /><input id="JieShu" class="hidden" /><input
								type="button" value="查看车辆上班位置" class="btn" id="start"
								onclick="ChaKan(this.id)" /> <input type="button" value="查看车辆下班位置"
								class="btn" id="end" onclick="ChaKan(this.id)" />
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/rili.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/OpenMap.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var Institutionalorganizationid = parseInt('${user.getInstitutionalorganizationid()}');
		var DangYueShuZu = new Array();
		var List = JSON.parse('${strList}');

		var Time;
		var TabAttendance;
		var AttendanceID;
		var offwork;
		var Remark;
		var QuFen = 0;
		var StartWorkTime;

		var reason;
		var tian = "";
		$(function() {
			if (Institutionalorganizationid == 3) {

				try {
					initMap();//创建和初始化地图
				} catch (e) {
					layer.closeAll('loading');
					layer.alert("地图加载失败，请刷新界面！！", {
						icon : 0,
						title : "提示",
						offset : '100px',
						btn : [ "确定" ]
					}, function(index) {
						layer.close(index);
						location.reload();
					});
				}
				$(".driver").show();
			} else {
				$("#dituContent").hide();
				$(".organization").remove();
			}

			$("#PingChang").show();
			var count = Math.round((window.screen.height - 450) / 50);
			var d = new Date();
			var years = d.getFullYear();
			var month = add_zero(d.getMonth() + 1);
			var days = add_zero(d.getDate());
			var hours = add_zero(d.getHours());
			var minutes = add_zero(d.getMinutes());
			var seconds = add_zero(d.getSeconds());
			Time = years + "-" + month + "-" + days;
			ChaKanChuQin();
			TabAttendance = $('#TabAttendance')
					.DataTable(
							{
								"pagingType" : "simple_numbers",//设置分页控件的模式  
								searching : false,//屏蔽datatales的查询框  
								aLengthMenu : [ count ],//设置一页展示10条记录  
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
									"url" : "${ctx}/SignController/getList.do",
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
											"data" : "userName"
										},
										{
											"data" : function(obj) {
												return ChangeDateFormat(obj.startworktime);
											}
										},
										{
											"data" : function(obj) {
												return ChangeDateFormat(obj.offwork);
											}
										},
										{
											"data" : function(obj) {
												return '<button class="btn" id="'
														+ obj.attendanceid
														+ '" onclick="detail(this.id)" >详情</button>   <button class="btn" id="'
														+ obj.attendanceid
														+ '" onclick="TuFa(this.id,value)" value="'
														+ obj.startworktime
														+ '" class="suddenly" >请假</button>';
											}
										} ]

							});

		});

		function ChaKanChuQin() {
			for ( var i = 0; i < List.length; i++) {
				$("#" + List[i]).css("background-color", "#1485ff");
			}
		}
		function TuFa(ID, StrartTime) {
			var ShiJian = new Date(Time + " 00:00:0000").getTime();

			if (ID > 0) {
				if (ShiJian < StrartTime) {

					if (offwork == null || offwork == "") {
						if (reason == null || reason == "") {
							$("#AttendanceID").val(ID);
							$("#PingChang").hide();
							$("#TuFaShiJian").show();
						} else {
							layer.msg("您已经申请业务，请耐心等待", {
								icon : 1,

								offset : '30px'
							});
						}
					} else {
						layer.msg("请选择其他出勤日期", {
							icon : 0,

							offset : '30px'
						});
					}

				} else {
					layer.msg("已经过期，不可以再次申请", {
						icon : 0,

						offset : '30px'
					});
				}
			} else {
				layer.msg("选择你需要请假的日期", {
					icon : 0,

					offset : '30px'
				});
			}
		}

		function GuanBi() {
			$("#PingChang").show();
			$("#TuFaShiJian").hide();
		}
		function QueDing() {
			var Form = $("#Form").serializeArray();
			$.post("${ctx}/SignController/updateQingJia.do", Form, function(
					data) {

				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {

					layer.alert(data.msg, {
						icon : 1,
						offset : '100px',
						btn : [ "确定" ]
					}, function(layerIndex) {
						layer.close(layerIndex);//关闭提示框

						location.reload();
					});
				} else {
					layer.msg(data.msg, {
						icon : 0,

						offset : '30px'
					});

				}

			});
		}

		function QianDao() {

			$.post("${ctx}/SignController/selectCar.do", function(da) {
				if ((typeof da) == "string") {
					da = JSON.parse(da);
				}
				if (da.state == true) {
					$("#modaltwo").modal("toggle");
				} else {
					var Form = $("#FormCar").serializeArray();
					$.post("${ctx}/SignController/insert.do", Form, function(
							data) {

						if ((typeof data) == "string") {
							data = JSON.parse(data);
						}
						if (data.state == true) {

							layer.alert(data.msg, {
								icon : 1,

								offset : '30px'
							}, function(layerIndex) {
								layer.close(layerIndex);
								location.reload();
							});

						} else {
							layer.msg(data.msg, {
								icon : 0,

								offset : '30px'
							});

						}

					});
				}

			});

		}

		function getCurDate() {
			var d = new Date();

			var years = d.getFullYear();
			var month = add_zero(d.getMonth() + 1);
			var days = add_zero(d.getDate());
			var hours = add_zero(d.getHours());
			var minutes = add_zero(d.getMinutes());
			var seconds = add_zero(d.getSeconds());
			var ndate = years + "-" + month + "-" + days + " " + hours + ":"
					+ minutes + ":" + seconds;

			return ndate;

		}
		function add_zero(temp) {
			if (temp < 10)
				return "0" + temp;
			else
				return temp;
		}

		function GuanBiTip() {
			$("#modalone").modal("toggle");

		}

		function uploadCar() {

			var Form = $("#FormCar").serializeArray();
			$.post("${ctx}/SignController/insert.do", Form, function(data) {

				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {

					layer.alert(data.msg, {
						icon : 1,
						title : "提示",
						offset : '30px'
					}, function(layerIndex) {
						layer.close(layerIndex);
						location.reload();
					});

				} else {
					layer.msg(data.msg, {
						icon : 0,
						title : "提示",
						offset : '30px'
					});

				}

			});
		}

		function ReFresh() {
			getlocation();
		}

		function detail(ID) {
			$
					.post(
							"${ctx}/SignController/selectInfor.do?AttendanceID="
									+ ID,
							function(data) {
								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}

								data.applicationtime = ChangeDateFormat(data.applicationtime);
								data.audittime = ChangeDateFormat(data.audittime);
								data.offwork = ChangeDateFormat(data.offwork);
								data.startworktime = ChangeDateFormat(data.startworktime);
								if (data.remark != ""
										&& data.isratification == false) {
									data.isratification = "否";
								} else if (data.remark != ""
										&& data.isratification == true) {
									data.isratification = "批准";
								} else {
									data.isratification = "";
								}
								loadDataToForm("FormInfor", data);
								$("#title").text("上下班详情");
								$("#KaiShi").val(data.startlocation);
								$("#JieShu").val(data.offlocation);
							});
			$("#modalthree").modal("toggle");
		}

		function ChaKan(ID) {
			if (ID == "start") {
				if ($("#KaiShi").val() != null && $("#KaiShi").val() != '') {
					serachlocal($("#KaiShi").val());
					$("#DiTu").show();
					$("#modalthree").modal("toggle");
					$("#PingChang").hide();
				} else {
					layer.msg("上班车辆位置为空！！！");
				}

			} else {
				if ($("#JieShu").val() != null && $("#JieShu").val() != '') {
					serachlocal($("#JieShu").val());
					$("#DiTu").show();
					$("#modalthree").modal("toggle");
					$("#PingChang").hide();
				} else {
					layer.msg("下班车辆位置为空！！！");
				}
			}

		}

		function back() {
			$("#DiTu").hide();

			$("#PingChang").show();
		}

		var myday = new Array(); //已签到的数组

		var cale = new Calendar("idCalendar", {
			qdDay : myday,
			onToday : function(o) {
				o.className = "onToday";
			},
			onSignIn : function() {

			},
			onFinish : function() {

				$$("idCalendarYear").innerHTML = this.Year;
				$$("idCalendarMonth").innerHTML = this.Month; //表头年份

			}
		});
		$$("idCalendarPre").onclick = function() {
			cale.PreMonth();
		}
		$$("idCalendarNext").onclick = function() {
			cale.NextMonth();
		}
	</script>

</body>
</html>
