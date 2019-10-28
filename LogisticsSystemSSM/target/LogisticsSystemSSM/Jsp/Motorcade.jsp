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

<title>人员管理</title>

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

label {
	float: right;
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


	<div class="container-fluid"
		style="margin: auto auto;height: 100%;position: absolute;top: 0px;bottom: 0px;left: 0px;right: 0px;">

		<div class="tab-content">
			<div id="motorcadeData" class="tab-pane fade active in"
				style="border-top: 1px solid #337AB7;padding-bottom:5px;">
				<div class="container-fluid">
					<form class="form-horizontal" style="margin-top: 20px;">
						<div class="form-group">
							<div class="col-lg-6 col-sm-6 col-sm-6">
								<label class="control-label col-lg-3 col-sm-3 col-md-3 text-primary">车队名称：</label>
								<div class="col-lg-6 col-sm-6 col-md-6 interval">

									<select class="form-control" id="Motorcade" name="Motorcade"
										onchange="Change()">
										<option value="0">---请选择---</option>
										<c:forEach items="${Motolist}" var="list">
											<option value="${list.getMotorcadeid()}">${list.getMotorcadename()}</option>
										</c:forEach>
									</select>

								</div>
								<img style="cursor: pointer;" src="${ctx }/Content/image/143345.png"
									height="30px" width="30px" onclick="addMotorcade()" id="AddMoto"
									alt="新增车队" title="新增车队" /> <img style="cursor: pointer;"
									src="${ctx }/Content/image/90648.png" height="30px" width="30px"
									alt="修改车队" title="修改车队" onclick="updateMotorcade()" />

							</div>

						</div>
					</form>
					<table id="TabMotorcade"
						class="display table table-hover table-striped table-bordered"
						cellspacing="0" width="100%">
						<thead>
							<tr>

								<th>车队名称</th>
								<th>司机名称</th>
								<th>人员状态</th>
								<th>配车否</th>
								<th>车牌号</th>
								<th>最大载重</th>
								<th>车厢规格</th>
								<th>车辆状态</th>
								<th>操作</th>
							</tr>
						</thead>

					</table>
					<div class="col-lg-6 col-sm-6 col-sm-6" style="margin-top: 20px"></div>


					<div class="modal fade" id="modalone">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="title">变更车队：</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" onsubmit="return false" id="CarFrom">
										<div class="form-group">
											<div class="col-lg-11 col-sm-11 col-sm-11" id="YuanCheDui">
												<label class="control-label col-lg-4 col-sm-4 col-md-4">当前车队：</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<select class="form-control" id="NowMotorcadeName"
														name="NowMotorcadeName" disabled="disabled">
														<c:forEach items="${Motolist}" var="list">
															<option value="${list.getMotorcadeid()}">${list.getMotorcadename()}</option>
														</c:forEach>
													</select> <input id="UserID" name="UserID" class="hidden" /> <input
														id="NowMotorcadeNameID" name="NowMotorcadeNameID" class="hidden" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-11 col-sm-11 col-sm-11">
												<label class="control-label col-lg-4 col-sm-4 col-md-4" id="CheDui">变更车队：</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<select class="form-control" id="ChangeMotorcadeName"
														name="ChangeMotorcadeName">
														<c:forEach items="${Motolist}" var="list">
															<option value="${list.getMotorcadeid()}">${list.getMotorcadename()}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>

									</form>
								</div>
								<div class="modal-footer">
									<p style="display: inline-block;"></p>
									<button class="btn btn-info" onclick="QueDing()">确定</button>

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
									<h4 class="modal-title">配置车辆：</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" onsubmit="return false"
										id="deployCarFrom">
										<div class="form-group">
											<div class="col-lg-6 col-sm-6 col-sm-6">
												<label class="control-label col-lg-4 col-sm-4 col-md-4 lb">车牌号：</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<select class="form-control" id="CarID" name="CarID"
														onchange="CarChange(this.value)">
														<option value="0">---请选择---</option>
														<c:forEach items="${Carlist}" var="list">
															<option value="${list.getCarid()}">${list.getPlatenumber()}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-lg-6 col-sm-6 col-sm-6">
												<label class="control-label col-lg-4 col-sm-4 col-md-4 lb">车辆类型:</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<input class="form-control" id="CarTypeName" name="CarTypeName"
														readonly="readonly" />

												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-6 col-sm-6 col-sm-6">
												<label class="control-label col-lg-4 col-sm-4 col-md-4 lb">最大载重:</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<input class="form-control" id="MaxLoad" name="MaxLoad"
														readonly="readonly" placeholder="请输入车辆的载重" />
												</div>
											</div>
											<div class="col-lg-6 col-sm-6 col-sm-6">
												<label class="control-label col-lg-4 col-sm-4 col-md-4 lb">车辆规格:</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<input class="form-control" id="CarriageSpecification"
														name="CarriageSpecification" readonly="readonly"
														placeholder="请输入车厢的规格" />

												</div>
											</div>
										</div>


									</form>
								</div>
								<div class="modal-footer">
									<p style="display: inline-block;"></p>
									<button class="btn btn-info" onclick="deployConfirm()">确定</button>

								</div>
							</div>
						</div>
					</div>

					<div class="modal fade" id="modalfour">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="updatetitle">增加车队：</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" onsubmit="return false"
										id="deployCarFrom">
										<div class="form-group insert">
											<div class="col-lg-11 col-sm-11 col-sm-11">
												<label class="control-label col-lg-4 col-sm-4 col-md-4">车队名称：</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<input class="form-control" id="MotorcadeName" name="MotorcadeName"
														maxlength="10" placeholder="请输入车队名称" />
												</div>
											</div>

										</div>
										<div class="form-group updatemotorcade" style="display: none;">
											<div class="col-lg-11 col-sm-11 col-sm-11">
												<label class="control-label col-lg-4 col-sm-4 col-md-4">原车队名称：</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<select class="form-control" id="OriginalMotorcadeName"
														name="OriginalMotorcadeName">
														<option value="0">---请选择---</option>
														<c:forEach items="${Motolist}" var="list">
															<option value="${list.getMotorcadeid()}">${list.getMotorcadename()}</option>
														</c:forEach>
													</select>
												</div>
											</div>

										</div>
										<div class="form-group updatemotorcade" style="display: none;">
											<div class="col-lg-11 col-sm-11 col-sm-11">
												<label class="control-label col-lg-4 col-sm-4 col-md-4">新车队名称：</label>
												<div class="col-lg-8 col-sm-8 col-md-8 interval">
													<input class="form-control" id="currently" name="currently"
														maxlength="10" placeholder="请输入车队名称" />
												</div>
											</div>

										</div>


									</form>
								</div>
								<div class="modal-footer">
									<p style="display: inline-block;"></p>
									<button class="btn btn-info" onclick="insert()">确定</button>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>

	</div>





	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>

	<script type="text/javascript">
		var TabMotorcade;
		var QuFen = 0;

		var userid;

		$(function() {

			$("#Modal").hide();

			$("#ModalOne").hide();

			var count = Math.round((window.screen.height - 480) / 50);

			TabMotorcade = $('#TabMotorcade')
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
									"url" : "${ctx}/MotorcadeController/getList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.MotorcadeID = $("#Motorcade").val();

									}
								},

								"columns" : [

										{
											"data" : "motorcadename",
											"width" : "50px"
										},
										{
											"data" : "username",
											"width" : "50px"
										},
										{
											"data" : "statusname",
											"width" : "50px"
										},
										{
											"width" : "40px",
											"data" : "carmatching"
										},
										{
											"data" : "platenumber",
											"width" : "40px"
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
											"data" : "carstatusname",
											"width" : "50px"
										},
										{
											"data" : function(obj) {
												userid = obj.userid == null ? 0
														: obj.userid;
												var teammembersid = obj.teammembersid == null ? 0
														: obj.teammembersid;
												var carid = obj.carid == null ? 0
														: obj.carid;
												var motorcadeid = obj.motorcadeid == null ? 0
														: obj.motorcadeid;

												return ' <button class="btn btn-info" value="'
														+ userid
														+ ','
														+ teammembersid
														+ '" onclick="distributeMotorcade(this.value)" id="disMoto">分配车队</button>  <button class="btn btn-info" value="'
														+ userid
														+ ','
														+ teammembersid
														+ ','
														+ carid
														+ ','
														+ motorcadeid
														+ '"  onclick="ChangeMotorcade(this.value)" id="ChangeMoto">更换车队</button>  <button value="'
														+ userid
														+ ','
														+ carid
														+ '" class="btn btn-info" onclick="ConfigureCar(this.value)" id="ConfigCar">配置车辆</button>'
											},
											"width" : "260px"

										} ]

							});

		});

		function Change() {
			TabMotorcade.ajax.reload();
		}

		function carTeam() {
			userGuanBi();
			CarGuanBi();
		}

		function power() {
			userGuanBi();
			CarGuanBi();
		}

		function ChangeMotorcade(ID) {
			$("#title").html("变更车队:");
			$("#YuanCheDui").show();
			$("#CheDui").html("变更车队:");
			if (ID.split(",")[0] != undefined && ID.split(",")[0] != null
					&& ID.split(",")[0] != "") {

				if (ID.split(",")[1] > 0) {
					if (ID.split(",")[2] > 0) {
						if (ID.split(",")[3] > 0) {
							$("#modalone").modal("toggle");
							$("#NowMotorcadeName").val(ID.split(",")[3]);
							$("#NowMotorcadeNameID").val(ID.split(",")[3]);
							$("#ChangeMotorcadeName").val(ID.split(",")[3]);
							$("#UserID").val(ID.split(",")[0]);
						} else {
							layer.alert("车队都没有，不可以变更！！", {
								icon : 0,
								title : "提示",
								offset : '100px'
							});
						}

					} else {
						layer.alert("还没有配车，怎么可以更换车队！！", {
							icon : 0,
							title : "提示",
							offset : '100px'
						});
					}

				} else {
					layer.alert("没有车队，请分配车队！！！！", {
						icon : 0,
						title : "提示",
						offset : '100px'
					});
				}

			} else {
				layer.alert("请选择一条数据！！！！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function QueDing() {
			var CarFrom = $("#CarFrom").serializeArray();
			layer.confirm("是否更换？？", {
				icon : 0,
				offset : '100px',
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {
				layer.close(layerIndex);//关闭提示框
				$.post("${ctx}/MotorcadeController/carMatching.do", CarFrom,
						function(data) {

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

									location.reload();
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
		}

		function ConfigureCar(ID) {
			$("#deployCarFrom input").val("");
			$("#deployCarFrom select").val(0);
			if (ID.split(",")[1] == 0) {

				if (ID.split(",")[0] != undefined && ID.split(",")[0] != null
						&& ID.split(",")[0] != "") {
					$("#modaltwo").modal("toggle");
				} else {
					layer.alert("没有司机怎么分配车辆！！！！", {
						icon : 0,
						title : "提示",
						offset : '100px'
					});

				}

			} else {
				layer.alert("已经有车了，不用再次配车，可以进行更换车辆！！！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}

		}

		function CarChange(ID) {

			$("#deployCarFrom input").val("");
			$("#MaxLoad").val("");
			$("#CarriageSpecification").val("");
			$("#CarTypeName").val("");
			$.post("${ctx}/MotorcadeController/selectCarInfor.do?CarID=" + ID,
					function(data) {
						if (data != null) {
							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}

							$("#MaxLoad").val(data[0].maxload);
							$("#CarriageSpecification").val(
									data[0].carriagespecification);
							$("#CarTypeName").val(data[0].cartypename);
						}

					});

		}

		function deployConfirm() {
			var CarID = $("#CarID").val();

			layer.confirm("是否配置？？", {
				icon : 0,
				offset : '100px',
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {
				layer.close(layerIndex);//关闭提示框
				$.post("${ctx}/MotorcadeController/deployCar.do?CarID=" + CarID
						+ "&userID=" + userid, function(data) {

					if ((typeof data) == "string") {
						data = JSON.parse(data);
					}
					if (data.state == true) {

						if (layer.alert(data.msg, {
							icon : 1,
							offset : '100px',
							btn : [ "确定" ]
						}, function(layerIndex) {
							layer.close(layerIndex);//关闭提示框}

							location.reload();
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
		}

		function distributeMotorcade(ID) {
			$("#title").html("分配车队");
			$("#YuanCheDui").hide();
			$("#CheDui").html("请选择车队:");

			if (ID.split(",")[0] != undefined && ID.split(",")[0] != null
					&& ID.split(",")[0] != "") {
				if (ID.split(",")[1] == 0) {

					$("#modalone").modal("toggle");
					$("#UserID").val(ID.split(",")[0]);
				} else {
					layer.alert("已经车队了，请选择变更车队！！", {
						icon : 0,
						title : "提示",
						offset : '100px'
					});
				}
			} else {
				layer.alert("请选择用户！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}

		}

		function enterCar() {
			QuFen = 1;
			QingKong();
			$("#titleone").html("录入车辆：");

			$("#Modal").show();
			$("#CarTab").hide();
			$("#imgContent0").attr2("src", " ");
		}

		function addMotorcade() {
			$("#updatetitle").text("新增车队");
			$(".updatemotorcade").hide();
			$(".insert").show();
			$("#modalfour").modal("toggle");
			QuFen = 1;
		}
		function updateMotorcade() {
			$("#updatetitle").text("修改车队");
			$(".updatemotorcade").show();
			$(".insert").hide();
			$("#modalfour").modal("toggle");
			QuFen = 2;
		}

		function insert() {
			var MotorcadeName = $("#MotorcadeName").val();
			var OriginalMotorcadeName = $("#OriginalMotorcadeName").val();
			var currently = $("#currently").val();
			if (QuFen == 1) {

				layer.confirm("是否新增？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框
					$.post(
							"${ctx}/MotorcadeController/insertMotorcade.do?MotorcadeName="
									+ MotorcadeName, function(data) {

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

										location.reload();
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
				layer.confirm("是否修改？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框
					$.post(
							"${ctx}/MotorcadeController/updateMotorcade.do?OriginalMotorcadeName="
									+ OriginalMotorcadeName
									+ "&NowMotorcadeName=" + currently,
							function(data) {

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

										location.reload();
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

			}
		}
	</script>
</body>
</html>
