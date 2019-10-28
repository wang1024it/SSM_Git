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

<title>员工信息</title>

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
	font-weight: bolder;
}

td,th {
	vertical-align: middle;
	text-align: center;
}

tr {
	font-size: 10px;
	vertical-align: middle
}

.dataTable {
	text-align: center;
	vertical-align: middle;
}

.lb {
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

<body style="background: #f8f9fa">
	<div id="employeeData" class="tab-pane fade   active in"
		style="border-top: 1px solid #337AB7;padding-bottom:5px;">
		<div class="container-fluid">
			<div id="EmployeeTab">


				<div style="margin-top: 5px">
					<label class="control-label col-lg-2 col-sm-2 col-md-2 lb"
						style="line-height: 30px">部门名称：</label>
					<div class="col-lg-3 col-sm-3 col-md-3 interval ">

						<select class="form-control" id="department" name="department"
							onchange="Change()">
							<option value="">---请选择---</option>
							<c:forEach items="${list}" var="strlist">
								<option value="${strlist.getInstitutionalorganizationid()}">${strlist.getInstitutionalorganizationname()}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-lg-1 col-sm-1 col-md-1">
						<img src="${ctx }/Content/image/255097.png" width="30px" height="30px"
							style="cursor: pointer;" alt="新增员工" title="新增员工"
							onclick="inputEmployee()" id="insert" />
					</div>

					<table id="TabEmployee"
						class="display table table-hover table-striped table-bordered"
						cellspacing="0" width="100%">
						<thead>
							<tr>

								<th style="text-align:center;vertical-align: middle;">员工名称</th>
								<th style="text-align:center;vertical-align: middle;">身份证号码</th>
								<th style="text-align:center;vertical-align: middle;">性别</th>
								<th style="text-align:center;vertical-align: middle;">手机号码</th>
								<th style="text-align:center;vertical-align: middle;">居住地址</th>
								<th style="text-align:center;vertical-align: middle;">所属部门</th>
								<th style="text-align:center;vertical-align: middle;">角色类型</th>
								<th style="text-align:center;vertical-align: middle;">操作</th>

							</tr>
						</thead>
					</table>


				</div>
			</div>
			<div class="row" id="ModalOne" style="display: none;">
				<form role="form" class="form-horizontal" onsubmit="return false"
					id="enterEmployeeFrom" enctype="multipart/form-data"
					action="${ctx}/EmployeeInformationController/inputemployee.do"
					method="post">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding:0px;margin-top:10px;">

						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">员工名称：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">

								<input class="form-control" id="UserName" name="username" maxlength="20"
									placeholder="请输入员工的名称" /> <input class="hidden" id="UserID"
									name="userid" /> <input class="hidden" name="usertypedetailid"
									id="usertypedetailid" />
							</div>
						</div>


						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">员工类型：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">
								<select class="form-control" id="EmployeeType" name="usertypeid">
									<option value="0">---请选择---</option>
									<c:forEach items="${strlist}" var="list">
										<option value="${list.getUsertypeid()}">${list.getUsertypename()}</option>
									</c:forEach>
								</select>

							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">身份证号码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">
								<input class="form-control" id="IDNumber" name="idnumber" maxlength="18"
									onkeyup="value=value.replace(/[^\w\.\/]/ig,'');judgeID(this.id,value)"
									placeholder="请输入身份证号码" onchange="YanZhengShenFenZheng(this.id,value)" />
								<input class="hidden" id="YongHuID" name="YongHuID" />

							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">所属部门：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">
								<select class="form-control" id="departmentName"
									name="institutionalorganizationid" onchange="change(this.value)">
									<option value="">---请选择---</option>
									<c:forEach items="${list}" var="strlist">
										<option value="${strlist.getInstitutionalorganizationid()}">${strlist.getInstitutionalorganizationname()}</option>
									</c:forEach>
								</select>

							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">手机号码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">
								<input class="form-control" id="PhoneNumber" name="phonenumber"
									maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')"
									onafterpaste="this.value=this.value.replace(/\D/g,'')"
									placeholder="请输入手机号码" onchange="YanZheng(this.id,value)" />
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">性别：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">
								<select class="form-control" id="Sex" name="sex">
									<option>男</option>
									<option>女</option>
								</select>
							</div>
						</div>
						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">居住地址：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">
								<input class="form-control" id="adress" name="address" maxlength="100"
									placeholder="请输入地址" />
							</div>
						</div>

						<div style="padding: 0px;margin-left: 0px;"
							class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 row ">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary"></label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">


								<input class="form-control" style="visibility: hidden;">
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">登录密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">

								<input class="form-control" id="LoginPassWord" name="loginpassword"
									type="password" maxlength="50" placeholder="请输入登录密码,初始密码：12345" />
							</div>
						</div>

						<div style="padding: 0px;margin-left: 0px;"
							class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">确认登录密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">

								<input class="form-control" id="confirmLoginPassWord"
									name="confirmLoginPassWord" type="password" maxlength="50"
									placeholder="请确认登录密码,初始密码：12345" />
							</div>
						</div>

						<div style="padding: 0px;margin-left: 0px;"
							class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">支付密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">

								<input class="form-control" id="PayPassWord" name="paymentpassword"
									type="password" maxlength="50" placeholder="请输入支付密码,初始密码：12345" />
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">确认支付密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 interval">

								<input class="form-control" id="confirmPayPassWord"
									name="confirmPayPassWord" type="password" maxlength="50"
									placeholder="请确认支付密码,初始密码：12345" />
							</div>
						</div>

						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">

							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
								<input type="file" onchange="loadImg(0)" id="picture0" name="picture"
									accept="image/*"
									style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
								<img id="imgContent0" style="width:100%;height:60%;z-index: 0" /><span
									class="tip" style="display: block; margin-left: 35%">上传个人照片</span><input
									id="FileName0" name="filelist[0]FileName" class="hidden">
							</div>
						</div>


						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
							style="margin-left: 10px">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
								<input type="file" onchange="loadImg(1)" id="picture1" name="picture"
									accept="image/*"
									style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
								<img id="imgContent1" style="width:100%;height:60%;z-index: 0" /><span
									class="tip" style="display: block; margin-left: 35%">上传身份证照片</span> <input
									id="FileName1" name="filelist[1]FileName" class="hidden">
							</div>
						</div>


						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 driver"
							style="display: none;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
								<input type="file" onchange="loadImg(2)" id="picture2" name="picture"
									accept="image/*"
									style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
								<img id="imgContent2" style="width:100%;height:60%;z-index: 0" /><span
									class="tip" style="display: block; margin-left: 35%">上传驾驶证照片</span> <input
									id="FileName2" name="filelist[2]FileName" class="hidden">
							</div>
						</div>



						<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 driver"
							style="margin-left: 10px;display: none;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
								<input type="file" onchange="loadImg(3)" id="picture3" name="picture"
									accept="image/*"
									style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
								<img id="imgContent3" style="width:100%;height:60%;z-index: 0" /><span
									class="tip" style="display: block; margin-left: 35%">上传人车合照照片</span> <input
									id="FileName3" name="filelist[3]FileName" class="hidden">

							</div>
						</div>
						<div class="form-group col-lg-12 col-md-12 col-sm-12 ">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<button class="btn btn-info" onclick="inputemployee()"
									style="float: right;">确定</button>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<button class="btn btn-info" onclick="userGuanBi()">关闭</button>
							</div>



						</div>


					</div>



				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/ValidateIDCardNumber.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var TabEmployee;
		$(function() {
			var count = Math.round((window.screen.height - 430) / 50);
			TabEmployee = $('#TabEmployee')
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
									"url" : "${ctx}/EmployeeInformationController/getList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.institutionalorganizationid = $(
												"#department").val();

									}
								},

								"columns" : [

										{
											"data" : "username",
											"width" : "60px"
										},
										{
											"data" : "idnumber",
											"width" : "50px"
										},
										{
											"data" : "sex",
											"width" : "50px"
										},
										{
											"data" : "phonenumber",
											"width" : "50px"
										},
										{
											"data" : "address",
											"width" : "40px"
										},
										{

											"data" : "institutionalorganizationname",
											"width" : "50px"

										},
										{
											"data" : "usertypename",
											"width" : "50px"
										},

										{
											"data" : function(obj) {
												return ' <button class="btn btn-info AuditRecord" value="'
														+ obj.userid
														+ '"  onclick="updateEmployee(this.value)" id="update">修改员工信息</button> '
											},
											"width" : "80px"

										} ]

							});

		});

		function Change() {
			TabEmployee.ajax.reload();
		}
		function inputEmployee() {
			PanDuan = 1;

			$("#enterEmployeeFrom input").val("");
			$("#enterEmployeeFrom img").attr("src", "");
			$("#ModalOne").show();
			$("#EmployeeTab").hide();
			$(".password").show();
		}
		function userGuanBi() {
			$("#ModalOne").hide();
			$("#EmployeeTab").show();
		}

		function inputemployee() {
			if (PanDuan == 1) {

				layer
						.confirm(
								"是否新增？？",
								{
									icon : 0,
									offset : '100px',
									btn : [ "确定", "取消" ]
								},
								function(layerIndex) {
									layer.close(layerIndex);//关闭提示框
									if ($("#FileName0").val() != ''
											&& $("#FileName1").val() != '') {

										layer.load();
										$("#enterEmployeeFrom")
												.attr("action",
														"${ctx}/EmployeeInformationController/inputemployee.do");
										$("#enterEmployeeFrom")
												.ajaxSubmit(
														function(data) {

															if ((typeof data) == "string") {
																data = JSON
																		.parse(data);
															}
															if (data.state == true) {
																layer
																		.alert(
																				data.msg,
																				{
																					icon : 1,
																					btn : [ "确定" ]
																				},
																				function(
																						layerIndex) {
																					layer
																							.close(layerIndex);//关闭提示框
																					layer
																							.closeAll('loading');
																					location
																							.reload();
																				});

															} else {
																layer
																		.closeAll('loading');
																layer
																		.msg(
																				data.msg,
																				{
																					icon : 0,
																					offset : "100px"

																				});

															}
														});
									} else {
										layer.msg("请选择图片！！", {
											icon : 0,
											offset : "100px"
										});
									}
								});

			} else {
				layer
						.confirm(
								"是否修改？？",
								{
									icon : 0,
									offset : "100px",
									btn : [ "确定", "取消" ]
								},
								function(layerIndex) {

									layer.close(layerIndex);//关闭提示框

									layer.load(0, {
										offset : "100px"
									});

									$("#enterEmployeeFrom")
											.attr("action",
													"${ctx}/EmployeeInformationController/updateemployee.do");
									$("#enterEmployeeFrom")
											.ajaxSubmit(
													function(data) {

														if ((typeof data) == "string") {
															data = JSON
																	.parse(data);
														}
														if (data.state == true) {
															layer
																	.alert(
																			data.msg,
																			{
																				icon : 1,
																				offset : '100px',
																				btn : [ "确定" ]
																			},
																			function(
																					layerIndex) {
																				layer
																						.close(layerIndex);//关闭提示框
																				layer
																						.closeAll('loading');
																				window.location
																						.reload();
																			});

														} else {
															layer
																	.closeAll('loading');
															layer
																	.msg(
																			data.msg,
																			{
																				icon : 0,

																				offset : '100px'
																			});

														}
													});
								});
			}
		}
		function judgeID(ID, value) {
			if (value.length == 18) {
				checkCard(value);
			} else {
				var reg = /^[a-zA-Z]+$/;
				if (reg.test(value)) {
					layer.msg("请输入正确的身份证号码！！", {
						icon : 0,

						offset : '100px'
					});
					$("#" + ID).val("");
				}

			}

		}

		function YanZhengShenFenZheng(ID, value) {
			if (value.length != 18) {
				layer.msg("请输入正确的身份证号码！！", {
					icon : 0,

					offset : '100px'
				});
				$("#" + ID).val("");
			}

		}
		function YanZheng(ID, value) {

			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(value)) {
				$("#" + ID).val("");
			}

		}

		//读取图片
		function loadImg(Count) {

			//获取文件
			var file = $("#picture" + Count)[0].files[0];
			$("#FileName" + Count).val(file.name);
			//创建读取文件的对象
			var reader = new FileReader();

			//创建文件读取相关的变量
			var imgFile;

			//为文件读取成功设置事件
			reader.onload = function(e) {

				imgFile = e.target.result;

				$("#imgContent" + Count).attr('src', imgFile);
			};

			//正式读取文件
			reader.readAsDataURL(file);
			if (Count == 0) {
				$("#FileName" + Count).val("personPhoto");
			} else if (Count == 2) {
				$("#FileName" + Count).val("driverPhoto");
			} else if (Count == 3) {
				$("#FileName" + Count).val("manCarPhoto");
			} else if (Count == 1) {
				$("#FileName" + Count).val("idPhoto");
			}

		}
		function change(ID) {
			if (ID == 3) {
				$(".driver").show();
			} else {
				$(".driver").hide();
				$("#imgContent3").attr("src", "");

				$("#imgContent2").attr("src", "");
			}
		}
		function updateEmployee(UserID) {
			$(".driver").hide();

			$("#enterEmployeeFrom input").val("");
			$("#enterEmployeeFrom img").attr("src", "");
			if (UserID > 0) {

				PanDuan = 2;
				$.post(
						"${ctx}/EmployeeInformationController/selectDriver.do?UserID="
								+ UserID, function(data) {

							$("#ModalOne").show();
							$("#EmployeeTab").hide();
							$(".password").hide();
							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							if (data != '') {
								loadDataToForm("enterEmployeeFrom", data);
							}
							if (data.institutionalorganizationid == 3) {
								$(".driver").show();
							}
							$("#imgContent0").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.photo);
							$("#imgContent1").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.idphoto);
							$("#imgContent2").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.drivinglicencephoto);
							$("#imgContent3").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.mancarphoto);
						});

			} else {
				layer.msg("请选择一条数据！！", {
					icon : 0,
					offset : '100px'

				});
			}
		}
	</script>
</body>
</html>
