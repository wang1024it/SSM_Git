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

<title>资讯管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
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
	font-size: 10px;
	vertical-align: middle
}
</style>
</head>

<body style="background: #f8f9fa">

	<div class="container-fluid">

		<div id="NeiRong">
			<table id="Tabinformation"
				class="display table table-hover table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align: center;vertical-align: middle;">资讯内容</th>
						<th style="text-align: center;vertical-align: middle;">资讯图片</th>
						<th style="text-align: center;vertical-align: middle;">启用否</th>
						<th style="text-align: center;vertical-align: middle;">操作</th>
					</tr>
				</thead>
			</table>



		</div>

		<div id="modal" style="margin-top: 20px">
			<form class="form-horizontal" onsubmit="return false" id="deployFrom"
				enctype="multipart/form-data" action="" method="post">
				<div class="form-group">
					<div class="col-lg-12 col-sm-12 col-sm-12">
						<label class="control-label col-lg-2 col-sm-2 col-md-2">资讯标题1:</label>
						<div class="col-lg-9 col-sm-9 col-md-9">
							<input class="form-control" id="title1" name="titleList[0]"
								maxlength="50" /> <input class="hidden" id="informationID"
								name="informationid" />

						</div>
					</div>

				</div>

				<div class="form-group">
					<div class="col-lg-8 col-sm-8 col-sm-8">
						<label class="control-label col-lg-3 col-sm-3 col-md-3">资讯内容1:</label>
						<div class="col-lg-9 col-sm-9 col-md-9">
							<div contenteditable="true" id="content"
								style="height: 150px;width: 100%;border: 1px solid black; "
								onkeyup="XianZhi(this.id)"></div>
							<input id="One" name="contentList[0]" class="hidden" />
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-sm-4">
						<input type="file" onchange="loadImg(0)" id="picture0" name="picture"
							accept="image/*"
							style="width:70%; height:95% ;cursor:pointer;opacity: 0; z-index: 99; position: absolute; " />
						<img id="imgContent0" style="width:70%;height:150px;z-index: 0" /><span
							class="tip" style="display: block; margin-left: 25%">资讯图片1</span><input
							id="FileName0" name="filelist[0]FileName" class="hidden">

					</div>

				</div>



				<div class="form-group">
					<div class="col-lg-12 col-sm-12 col-sm-12">
						<label class="control-label col-lg-2 col-sm-2 col-md-2">资讯标题2:</label>
						<div class="col-lg-9 col-sm-9 col-md-9">
							<input class="form-control" id="title2" name="titleList[1]"
								maxlength="50" />

						</div>
					</div>

				</div>


				<div class="form-group">
					<div class="col-lg-8 col-sm-8 col-sm-8">
						<label class="control-label col-lg-3 col-sm-3 col-md-3">资讯内容2:</label>
						<div class="col-lg-9 col-sm-9 col-md-9">
							<div id="content2" contenteditable="true"
								style="height: 150px;width: 100%;border: 1px solid black; "
								onkeyup="XianZhi(this.id)"></div>
							<input id="Two" name="contentList[1]" class="hidden" />
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-sm-4">
						<input type="file" onchange="loadImg(1)" id="picture1" name="picture"
							accept="image/*"
							style="width:70%; height:95% ;cursor:pointer;opacity: 0; z-index: 99; position: absolute; " />
						<img id="imgContent1" style="width:70%;height:150px;z-index: 0" /><span
							class="tip" style="display: block; margin-left: 25%">资讯图片2</span><input
							id="FileName1" name="filelist[1]FileName" class="hidden">
					</div>

				</div>


				<div class="form-group">
					<div class="col-lg-12 col-sm-12 col-sm-12">
						<label class="control-label col-lg-2 col-sm-2 col-md-2">资讯标题3:</label>
						<div class="col-lg-9 col-sm-9 col-md-9">
							<input class="form-control" id="title3" name="titleList[2]"
								maxlength="50" />

						</div>
					</div>

				</div>


				<div class="form-group">
					<div class="col-lg-8 col-sm-8 col-sm-8">
						<label class="control-label col-lg-3 col-sm-3 col-md-3">资讯内容3:</label>
						<div class="col-lg-9 col-sm-9 col-md-9">
							<div id="content3" contenteditable="true"
								style="height: 150px;width: 100%;border: 1px solid black; "
								onkeyup="XianZhi(this.id)"></div>
							<input id="Three" name="contentList[2]" class="hidden" />
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-sm-4">
						<input type="file" onchange="loadImg(2)" id="picture2" name="picture"
							accept="image/*"
							style="width:70%; height:95% ;cursor:pointer;  opacity: 0; z-index: 99; position: absolute; " />
						<img id="imgContent2" style="width:70%;height:150px;z-index: 0" /><span
							class="tip" style="display: block; margin-left: 25%">资讯图片3</span><input
							id="FileName2" name="filelist[2]FileName" class="hidden">
					</div>

				</div>
			</form>

			<div class="col-lg-10 col-sm-10 col-md-10"></div>


			<button class="btn btn-info" onclick="deployConfirm()">确定</button>
			<button class="btn btn-info" onclick="Close()">关闭</button>


		</div>
	</div>




	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>

	<script type="text/javascript">
		var Tabinformation;

		var informationID = 0;
		var PanDuan = 0;
		$(function() {
			$(".upload-file").hide();
			Close();
			var count = Math.round((window.screen.height - 400) / 50);
			Tabinformation = $('#Tabinformation')
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
									"url" : "${ctx}/InformationManagementController/getList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.Condition = $("#TabUser_filter input")
												.val();

									}
								},

								"columns" : [

										{
											"data" : "informationcontent",
											"width" : "50px"
										},
										{
											"data" : function(obj) {
												return ' <img onload="AutoResizeImage(60, 60, this)" src="${ctx}/LoginController/getPicture.do?fileName='
														+ obj.informationpicture
																.split("@")[0]
														+ '" id="'
														+ obj.informationid
														+ '0" onclick="showImg(this.id)"  />  <img onload="AutoResizeImage(60, 60, this)" src="${ctx}/LoginController/getPicture.do?fileName='
														+ obj.informationpicture
																.split("@")[1]
														+ '" id="'
														+ obj.informationid
														+ '1" onclick="showImg(this.id)" /> <img onload="AutoResizeImage(60, 60, this)" src="${ctx}/LoginController/getPicture.do?fileName='
														+ obj.informationpicture
																.split("@")[2]
														+ '" id="'
														+ obj.informationid
														+ '2" onclick="showImg(this.id)" />';

											},
											"width" : "100px"
										},
										{
											"data" : function(obj) {
												return obj.isenableno == true ? "已启用"
														: "未启用";
											},
											"width" : "50px"
										},
										{
											"data" : function(obj) {
												return ' <button class="btn btn-info"   onclick="insert()" >新增</button> <button class="btn btn-info"   onclick="update(this.id)" id="'
														+ obj.informationid
														+ '">修改</button> <button class="btn btn-info"   onclick="deleteInformation(this.id)" id="'
														+ obj.informationid
														+ '">删除</button>  <button class="btn btn-info"   onclick="apply(this.id)" id="'
														+ obj.informationid
														+ '">启用</button>'
											},
											"width" : "260px"

										} ]

							});

		});

		function Close() {
			$("#modal").hide();
			$("#NeiRong").show();
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
			if (Count == 1) {
				$("#FileName" + Count).val("one");
			} else if (Count == 2) {
				$("#FileName" + Count).val("two");
			} else {
				$("#FileName" + Count).val("three");

			}

		}

		function insert() {
			PanDuan = 1;
			$('#deployFrom')[0].reset();
			$("#imgContent3").attr2("src", "");
			$("#imgContent2").attr2("src", "");
			$("#imgContent1").attr2("src", "");

			$("#content").empty();
			$("#content2").empty();
			$("#content3").empty();

			$("#NeiRong").hide();
			$("#modal").show();
		}

		function deployConfirm() {
			$("#One").val($("#content").text());
			$("#Two").val($("#content2").text());
			$("#Three").val($("#content3").text());
			if (PanDuan == 1) {
				layer
						.confirm(
								"是否录入？？",
								{
									icon : 0,
									offset : '100px',
									btn : [ "确定", "取消" ]
								},
								function(layerIndex) {
									layer.close(layerIndex);//关闭提示框
									if ($("#FileName1").val() != ''
											&& $("#FileName2").val() != ''
											&& $("#FileName3").val() != '') {
										layer.load();
										$("#deployFrom")
												.attr("action",
														"${ctx}/InformationManagementController/insertinformation.do");
										$("#deployFrom")
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
																							.close(layerIndex);//关闭提示框}
																					location
																							.reload();
																				});

															} else {
																layer
																		.alert(
																				data.msg,
																				{
																					icon : 0,
																					offset : '100px',
																					title : "提示",

																				});
															}
														});
									} else {
										layer.alert("请选择图片！！", {
											icon : 0,
											offset : '100px',
											title : "提示",

										});
									}
								});

			} else {
				layer
						.confirm(
								"是否修改？？",
								{
									icon : 0,
									offset : "50px",
									btn : [ "确定", "取消" ]
								},
								function(layerIndex) {
									layer.close(layerIndex);//关闭提示框

									if ($("#FileName0").val() != ''
											&& $("#FileName1").val() != ''
											&& $("#FileName2").val() != '') {
										layer.load(0, {
											offset : "100px"
										});
										$("#deployFrom")
												.attr("action",
														"${ctx}/InformationManagementController/updateinformation.do");
										$("#deployFrom")
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
																					offset : "100px",
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
																		.msg(
																				data.msg,
																				{
																					icon : 0,
																					offset : '100px',

																				});

															}
														});
									} else {
										layer.alert("请选择图片！！", {
											icon : 0,
											offset : '100px',
											title : "提示",

										});
									}
								});
			}
		}

		function showImg(ID) {
			$(".layui-layer-close2").click();
			var url = $("#" + ID).prop("src");
			//alert(url);
			var img_infor = "<img src='" + url + "' style='height: 330px;width:500px;' />";
			layer.open({
				type : 1,
				closeBtn : 1,
				offset : '100px',
				shade : false,
				title : false, //不显示标题
				//skin: 'layui-layer-nobg', //没有背景色
				shadeClose : false,
				area : [ '500px', '330px' ],
				//area: [img.width + 'px', img.height+'px'],
				content : img_infor,
				//捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响

				cancel : function() {
					layer.msg('图片查看结束！', {
						time : 1000,
						offset : '100px',
						icon : 6
					});
				}

			})

		};

		function update(informationID) {
			if (informationID > 0) {
				$("#modal").show();
				$("#NeiRong").hide();
				PanDuan = 2;
				$("#informationID").val(informationID);

				$.post(
						"${ctx}/InformationManagementController/selectinformation.do?informationID="
								+ informationID, function(data) {

							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							if (data != "") {
								$(".upload-file").hide();
								$("#content").text(data.content);
								$("#content2").text(data.content2);
								$("#content3").text(data.content3);
								$("#title1").val(data.title1);
								$("#title2").val(data.title2);
								$("#title3").val(data.title3);
								$("#FileName0").val(data.image);
								$("#FileName1").val(data.image1);
								$("#FileName2").val(data.image2);

								$("#imgContent0").attr2(
										"src",
										"${ctx}/LoginController/getPicture.do?fileName="
												+ data.image);

								$("#imgContent1").attr2(
										"src",
										"${ctx}/LoginController/getPicture.do?fileName="
												+ data.image1);

								$("#imgContent2").attr2(
										"src",
										"${ctx}/LoginController/getPicture.do?fileName="
												+ data.image2);
							}
						});
			} else {
				layer.alert("请选择一条数据！！", {
					icon : 0,
					offset : '100px',
					title : "提示",
				});
			}
		}

		function deleteInformation(informationID) {
			if (informationID > 0) {

				layer.confirm("是否删除？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框

					$.post(
							"${ctx}/InformationManagementController/deleteinformation.do?informationID="
									+ informationID, function(data) {

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
									layer.alert(data.msg, {
										icon : 0,
										offset : '100px',
										title : "提示",

									});
								}
							});
				});
			} else {
				layer.alert("请选择一条数据！！", {
					icon : 0,
					offset : '100px',
					title : "提示",
				});
			}
		}

		function apply(informationID) {
			if (informationID > 0) {

				layer.confirm("是否启用？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框

					$.post(
							"${ctx}/InformationManagementController/applyinformation.do?informationID="
									+ informationID, function(data) {

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
									layer.alert(data.msg, {
										icon : 0,
										offset : '100px',
										title : "提示",

									});
								}
							});
				});
			} else {
				layer.alert("请选择一条数据！！", {
					icon : 0,
					offset : '100px',
					title : "提示",
				});
			}
		}
		var Text = undefined;
		function XianZhi(ID) {
			var tx = $("#" + ID).text();
			if (Text == undefined) {
				Text = tx;
			}
			if (tx.length > 180) {
				$("#" + ID).text(Text)
			} else {
				Text = undefined
			}

		}

		function ShowUpload(ID) {
			$("#" + ID).click();

		}
	</script>

</body>
</html>
