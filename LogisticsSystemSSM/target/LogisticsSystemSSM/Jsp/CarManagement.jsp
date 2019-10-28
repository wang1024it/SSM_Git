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

<title>车辆管理</title>

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
	filter: alpha(opacity =             0);
	cursor: pointer;
}
</style>
</head>

<body style="background: #f8f9fa">

	<div class="container-fluid">
		<div id="CarTab">


			<table id="TabCard"
				class="display table table-hover table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>

						<th>车牌号</th>
						<th>最大载重</th>
						<th>车厢规格</th>
						<th>车辆状态</th>
						<th>私家否</th>
						<th>操作</th>


					</tr>
				</thead>
			</table>

		</div>
		<div style="padding-top: 10px; display: none;" id="Modal">
			<form class="form-horizontal" onsubmit="return false" id="enterCarFrom"
				enctype="multipart/form-data"
				action="${ctx}/PersonalManageController/insertCar" method="post">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="form-group">

						<div class=" col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label lb">车牌号：</label>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">

								<input class="form-control" id="plateNumber" name="platenumber"
									maxlength="20" placeholder="请输入车牌号" /> <input class="hidden "
									id="carID" name="carid" />
							</div>
						</div>

						<div class=" col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">车辆类型：</label>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
								<select class="form-control" id="carTypeName" name="cartypeid">
									<option value="0">---请选择---</option>
									<c:forEach items="${carTypeList}" var="list">
										<option value="${list.getCartypeid()}">${list.getCartypename()}</option>
									</c:forEach>
								</select>

							</div>
						</div>

					</div>
					<div class="form-group">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3  control-label text-right text-primary lb">最大载重：</label>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
								<input class="form-control" id="maxLoad" name="maxload" maxlength="5"
									placeholder="请输入车辆的载重  单位：kg"
									onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3   control-label text-right text-primary lb">车厢规格：</label>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
								<input class="form-control" id="CarriageSpecification"
									name="carriagespecification" maxlength="4"
									placeholder="请输入车厢的规格  单位：/箱"
									onkeyup="this.value=this.value.replace(/\D/g,'')"
									onafterpaste="this.value=this.value.replace(/\D/g,'')" />
							</div>
						</div>
					</div>
					<div class="form-group">

						<div class=" col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3   control-label text-right text-primary lb">私家车：</label>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
								<select class="form-control" id="IsPrivate" name="isprivate"
									onchange="ChooseUser(this.value)">
									<option value="0">---请选择---</option>
									<option value="true">是</option>
									<option value="false">否</option>
								</select>
							</div>
						</div>
						<div class=" col-lg-6 col-md-6 col-sm-6 col-xs-12" id="privateCar">
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3 control-label text-right text-primary lb">私家车的用户：</label>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 interval">
								<select class="form-control" id="PrivateUserID" name="PrivateUserID"></select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class=" col-lg-6 col-md-6 col-sm-6 col-xs-12">



							<input type="file" onchange="loadImg()" id="picture" name="picture"
								accept="image/*"
								style="width:90%; height:95% ;opacity: 0; z-index: 99; position: absolute; " />
							<img id="imgContent" style="width:90%;height:60%;z-index: 0" /><span
								class="tip" style="display: block; margin-left: 35%">上传行驶证照片</span> <input
								id="FileName" name="FileName" class="hidden">

						</div>



						<div class="col-lg-3 col-md-3 col-sm-3 ">
							<div style="height:55%;"></div>

							<button class="btn btn-info" onclick="insert()">确定</button>
							<button class="btn btn-info" onclick="CarGuanBi()">关闭</button>

						</div>
					</div>


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
		var TabCard;
		$(function() {
			$("#privateCar").hide();

			var count = Math.round((window.screen.height - 400) / 50);
			TabCard = $('#TabCard')
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
									"url" : "${ctx}/PersonalManageController/getCarList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.CarCondition = $(
												"#TabCard_filter input").val();

									}
								},

								"columns" : [

										{
											"data" : "platenumber",
											"width" : "50px"
										},
										{
											"data" : "maxload",
											"width" : "50px"
										},
										{
											"data" : "carriagespecification",
											"width" : "50px"
										},
										{
											"width" : "40px",
											"data" : "statusname"
										},
										{
											"data" : function(obj) {
												return obj.isprivate == true ? "是"
														: "否";

											},
											"width" : "40px"
										},
										{
											"data" : function(obj) {
												return ' <button class="btn btn-info" value="'
														+ obj.carid
														+ '"  onclick="updateCar(this.value)" id="ChangeMoto">修改车辆信息</button> '
											},
											"width" : "260px"

										} ]

							});

			$("#TabCard_filter").append(
					'<button onclick="enterCar()">新增车辆</button>');

		});
		function enterCar() {
			QuFen = 1;

			$("#titleone").html("录入车辆：");
			$("#Modal select").val(0);
			$("#Modal").show();
			$("#CarTab").hide();
			$("#imgContent").attr2("src", " ");
			$("#Modal input").val("");
		}
		function CarGuanBi() {
			$("#Modal").hide();
			$("#CarTab").show();
			$("#privateCar").hide();
		}
		//读取图片
		function loadImg() {

			//获取文件
			var file = $("#picture")[0].files[0];
			$("#FileName").val(file.name);
			//创建读取文件的对象
			var reader = new FileReader();

			//创建文件读取相关的变量
			var imgFile;

			//为文件读取成功设置事件
			reader.onload = function(e) {

				imgFile = e.target.result;

				$("#imgContent").attr('src', imgFile);
			};

			//正式读取文件
			reader.readAsDataURL(file);

		}

		function ChooseUser(value) {
			if (value == "true") {
				$("#privateCar").show();

				BangDingXiaLaKuang("PrivateUserID",
						"${ctx}/PersonalManageController/selectUser.do?value="
								+ value);
			} else {
				$("#privateCar").hide();
			}
		}

		function updateCar(ID) {
			QuFen = 2;
			$("#titleone").html("修改车辆：");

			$("#Modal").show();

			$("#CarTab").hide();
			$("#imgContent").attr2("src", " ");
			$("#Modal input").val("");
			$("#Modal select").val(0);
			$.post("${ctx}/PersonalManageController/selectCar.do?CarID=" + ID,
					function(data) {
						if (data != '') {

							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							loadDataToForm("enterCarFrom", data);

							$("#IsPrivate").val(
									data.isprivate == true ? "true" : "false");
							$("#imgContent").attr2(
									"src",
									"${ctx}/PersonalManageController/getPicture.do?fileName="
											+ data.cardrivinglicensephoto);
						}
					});
		}

		function insert() {

			if (QuFen == 1) {

				layer.confirm("是否新增？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {

					layer.close(layerIndex);//关闭提示框
					layer.load();

					$("#enterCarFrom").attr("action",
							"${ctx}/PersonalManageController/insertCar.do");

					$("#enterCarFrom").ajaxSubmit(function(data) {

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
								layer.closeAll('loading');
								location.reload();
							}))
								;
						} else {
							layer.closeAll('loading');
							layer.alert(data.msg, {
								icon : 0,
								title : "提示",
								offset : '100px'
							});

						}

					});

				});

			} else {
				layer.confirm("是否修改？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框
					layer.load();
					$("#enterCarFrom").attr("action",
							"${ctx}/PersonalManageController/updateCar.do");

					$("#enterCarFrom").ajaxSubmit(function(data) {

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
								layer.closeAll('loading');
								location.reload();
							}))
								;
						} else {
							layer.closeAll('loading');
							layer.alert(data.msg, {
								icon : 0,
								title : "提示",
								offset : '100px'
							});

						}

					});

				});
			}
		}
	</script>
</body>
</html>
