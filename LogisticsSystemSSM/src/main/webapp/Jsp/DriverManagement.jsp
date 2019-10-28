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

<title>司机管理</title>

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
	color: #6c6c6c;
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

.upload-file {
	position: relative;
	width: 120px;
	padding: 10px 15px;
	border: 1px solid rgb(119, 154, 80);
	border-radius: 5px;
	background-color: rgb(66, 215, 142);
	color: #333333;
	font-size: 14px;
	text-align: center;
	overflow: hidden;
}

.upload-file span {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.upload-file:hover {
	font-size: 15px;
	border-color: rgb(39, 226, 81);
}

.upload-file input {
	height: 100%;
	width: 100%;
	position: absolute;
	top: 0;
	right: 0;
	opacity: 0;
	filter: alpha(opacity =                   0);
	cursor: pointer;
}
</style>
</head>

<body style="background: #f4f5f6">

	<div class="container-fluid">
		<div id="UserTab">

			<table id="TabUser"
				class="display table table-hover table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>

						<th>司机名称</th>
						<th>身份证号码</th>
						<th>性别</th>
						<th>手机号码</th>
						<th>居住地址</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>

		</div>
		<div style="display: none;" id="ModalOne">
			<form role="form" class="form-horizontal" onsubmit="return false"
				id="enterUserFrom" enctype="multipart/form-data"
				action="${ctx}/DriverManagementController/insertDriver" method="post">


				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">司机名称：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">

						<input class="form-control" id="UserName" name="username" maxlength="20"
							placeholder="请输入司机的名称" /> <input class="hidden" id="userid"
							name="userid" />
					</div>
				</div>

				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">身份证号码：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
						<input class="form-control" id="IDNumber" name="idnumber" maxlength="18"
							onkeyup="value=value.replace(/[^\w\.\/]/ig,'');judgeID(this.id,value)"
							placeholder="请输入司机的身份证号码" onchange="YanZhengShenFenZheng(this.id,value)" />

					</div>
				</div>


				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">手机号码：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
						<input class="form-control" id="PhoneNumber" name="phonenumber"
							maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							placeholder="请输入司机的手机号码" onchange="YanZheng(this.id,value)" />
					</div>
				</div>

				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">性别：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
						<select class="form-control" id="Sex" name="sex">
							<option>男</option>
							<option>女</option>
						</select>
					</div>
				</div>
				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">居住地址：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
						<input class="form-control" id="adress" name="address" maxlength="100"
							placeholder="请输入司机的地址" />
					</div>
				</div>

				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">有车否：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
						<select class="form-control" id="IsHaveCar" name="ishavecar">
							<option value="1">有</option>
							<option value="0">无</option>
						</select>

					</div>
				</div>


				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password"
					style="padding: 0px;margin-left: 0px;">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">登录密码：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">

						<input class="form-control" id="LoginPassWord" name="loginpassword"
							type="password" maxlength="50" placeholder="请输入登录密码，默认为：12345" />
					</div>
				</div>

				<div style="padding: 0px;margin-left: 0px;"
					class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">确认登录密码：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">

						<input class="form-control" id="confirmLoginPassWord"
							name="confirmLoginPassWord" type="password" maxlength="50"
							placeholder="请确认登录密码，默认为：12345" />
					</div>
				</div>

				<div style="padding: 0px;margin-left: 0px;"
					class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">支付密码：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">

						<input class="form-control" id="PayPassWord" name="paymentpassword"
							type="password" maxlength="50" placeholder="请输入支付密码，默认为：12345" />
					</div>
				</div>

				<div style="padding: 0px;margin-left: 0px;"
					class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 password">
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4  control-label text-right text-primary lb">确认支付密码：</label>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">

						<input class="form-control" id="confirmPayPassWord"
							name="confirmPayPassWord" type="password" maxlength="50"
							placeholder="请确认支付密码，默认为：12345" />
					</div>
				</div>

				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<input type="file" onchange="loadImg(0)" id="picture0" name="picture"
						accept="image/*"
						style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
					<img id="imgContent0" style="width:100%;height:60%;z-index: 0" /><span
						class="tip" style="display: block; margin-left: 35%">上传个人照片</span><input
						id="FileName0" name="filelist[0]FileName" class="hidden">

				</div>


				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="margin-left: 10px">

					<input type="file" onchange="loadImg(1)" id="picture1" name="picture"
						accept="image/*"
						style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
					<img id="imgContent1" style="width:100%;height:60%;z-index: 0" /><span
						class="tip" style="display: block; margin-left: 35%">上传身份证照片</span> <input
						id="FileName1" name="filelist[1]FileName" class="hidden">
				</div>


				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">

					<input type="file" onchange="loadImg(2)" id="picture2" name="picture"
						accept="image/*"
						style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
					<img id="imgContent2" style="width:100%;height:60%;z-index: 0" /><span
						class="tip" style="display: block; margin-left: 35%">上传驾驶证照片</span> <input
						id="FileName2" name="filelist[2]FileName" class="hidden">
				</div>



				<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
					style="margin-left: 10px">

					<input type="file" onchange="loadImg(3)" id="picture3" name="picture"
						accept="image/*"
						style="width:100%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
					<img id="imgContent3" style="width:100%;height:60%;z-index: 0" /><span
						class="tip" style="display: block; margin-left: 35%">上传人车合照照片</span> <input
						id="FileName3" name="filelist[3]FileName" class="hidden">

				</div>
				<div class="form-group col-lg-6 col-md-6 col-sm-6 ">

					<button class="btn btn-info" onclick="Adddriver()" style="float: right ;">确定</button>

				</div>
				<div class="form-group col-lg-6 col-md-6 col-sm-6">
					<button class="btn btn-info" onclick="userGuanBi()" style="margin-left: 2%">关闭</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/ValidateIDCardNumber.js"></script>
	<script type="text/javascript">
		var TabUser;
		$(function() {

			var count = Math.round((window.screen.height - 400) / 50);
			TabUser = $('#TabUser')
					.DataTable(
							{
								"pagingType" : "simple_numbers",//设置分页控件的模式
								searching : true,//屏蔽datatales的查询框
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
									"url" : "${ctx}/DriverManagementController/getUserList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.Condition = $("#TabUser_filter input")
												.val();

									}
								},

								"columns" : [

										{
											"data" : "username",
											"width" : "50px"
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
											"width" : "40px"

										},
										{
											"data" : "address",
											"width" : "40px"
										},

										{
											"data" : "statusname",
											"width" : "40px"
										},
										{
											"data" : function(obj) {
												return ' <button class="btn btn-info" value="'
														+ obj.userid
														+ '"  onclick="updateDriver(this.value)" id="upDriver">修改司机信息</button> '
											},
											"width" : "260px"

										} ]

							});
			$("#TabUser_filter").append(
					'<button onclick="inputDriver()" >新增司机</button>');
		});

		function inputDriver() {
			QuFen = 3;

			$('#enterUserFrom')[0].reset();
			$("#ModalOne").show();
			$("#UserTab").hide();
			$(".password").show();

		}

		function updateDriver(UserID) {

			if (UserID > 0) {
				QuFen = 4;

				$(".password").hide();
				$("#ModalOne").show();
				$("#UserTab").hide();
				$("#userid").val(UserID);
				$("#ModalOne input").val("");
				$("#ModalOne select").val(0);
				$("#imgContent0").attr2("src", "");
				$("#imgContent1").attr2("src", "");
				$("#imgContent2").attr2("src", "");
				$("#imgContent3").attr2("src", "");
				$.post(
						"${ctx}/DriverManagementController/selectDriver.do?UserID="
								+ UserID, function(data) {

							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							loadDataToForm("ModalOne", data);
							var ishavecar = data.ishavecar == true ? "1" : "0";
							$("#IsHaveCar").val(ishavecar);
							$("#FileName0").val(data.photo);
							$("#FileName2").val(data.drivinglicencephoto);
							$("#FileName3").val(data.mancarphoto);
							$("#FileName1").val(data.idphoto);
							$("#imgContent0").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.photo);
							$("#imgContent2").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.drivinglicencephoto);
							$("#imgContent3").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.mancarphoto);
							$("#imgContent1").attr2(
									"src",
									"${ctx}/LoginController/getPicture.do?fileName="
											+ data.idphoto);
						});

			} else {
				layer.alert("请选择一条数据！！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}

		}

		function userGuanBi() {
			$("#ModalOne").hide();
			$("#UserTab").show();
		}

		function Adddriver() {
			if (QuFen == 3) {

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
									layer.load(0, {
										offset : "100px"
									});
									if ($("#FileName1").val() != ''
											&& $("#FileName2").val() != ''
											&& $("#FileName3").val() != ''
											&& $("#FileName4").val() != '') {

										$("#enterUserFrom")
												.attr("action",
														"${ctx}/DriverManagementController/insertDriver.do");
										$("#enterUserFrom")
												.ajaxSubmit(
														function(data) {

															if ((typeof data) == "string") {
																data = JSON
																		.parse(data);
															}
															if (data.state == true) {
																layer
																		.closeAll('loading');
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

																					location
																							.reload();
																				});

															} else {
																layer
																		.closeAll(
																				'loading',
																				{
																					offset : "100px"
																				});
																layer
																		.alert(
																				data.msg,
																				{
																					icon : 0,
																					title : "提示",
																					offset : '100px'
																				});
															}
														});
									} else {
										layer.closeAll('loading'

										);
										layer.alert("图片不能为空！！", {
											icon : 0,
											title : "提示",
											offset : '100px'
										});
									}
								});

			} else if (QuFen == 4) {
				layer
						.confirm(
								"是否修改？？",
								{
									icon : 0,
									offset : '100px',
									btn : [ "确定", "取消" ]
								},
								function(layerIndex) {

									layer.close(layerIndex);//关闭提示框
									layer.load(0, {
										offset : "100px"
									});
									$("#enterUserFrom")
											.attr("action",
													"${ctx}/DriverManagementController/updateDriver.do");
									$("#enterUserFrom")
											.ajaxSubmit(
													function(data) {

														if ((typeof data) == "string") {
															data = JSON
																	.parse(data);
														}
														if (data.state == true) {
															layer
																	.closeAll('loading');
															layer
																	.alert(
																			data.msg,
																			{
																				icon : 1,
																				offset : '200px',
																				btn : [ "确定" ]
																			},
																			function(
																					layerIndex) {
																				layer
																						.close(layerIndex);//关闭提示框

																				location
																						.reload();
																			});

														} else {
															layer
																	.closeAll('loading');
															layer
																	.alert(
																			data.msg,
																			{
																				icon : 0,
																				title : "提示",
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
					layer.alert("请输入正确的身份证号码！！", {
						icon : 0,
						title : "提示：",
						offset : '100px'
					});
					$("#" + ID).val("");
				}

			}

		}

		function YanZhengShenFenZheng(ID, value) {
			if (value.length != 18) {
				layer.alert("请输入正确的身份证号码！！", {
					icon : 0,
					title : "提示：",
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
	</script>
</body>
</html>
