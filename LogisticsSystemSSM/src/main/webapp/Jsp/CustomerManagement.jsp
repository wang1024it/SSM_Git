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

<title>客户管理</title>

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

.dataTable {
	text-align: center;
	vertical-align: middle;
}

td,th {
	vertical-align: middle;
	text-align: center;
}

tr {
	font-size: 14px;
	vertical-align: middle
}

thead {
	background: #cfecf3;
}
</style>
</head>

<body>
	<div id="Table">

		<table id="TabCustom"
			class="display table table-hover table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>

					<th style="vertical-align: middle">客户名称</th>
					<th style="vertical-align: middle">客户昵称</th>
					<th style="text-align: center;vertical-align: middle">客户类型</th>
					<th style="vertical-align: middle">客户手机号码</th>

					<th style="vertical-align: middle">QQ</th>
					<th style="vertical-align: middle">邮箱</th>

				</tr>
			</thead>
		</table>
	</div>
	<div class="container-fluid" style="display: none;margin-top: 20px" id="custom">

		<form id="insertCustom" class="form-horizontal" onsubmit="return false">
			<div class="form-group">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">客户类型：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<select class="form-control" id="customertypeid" name="customertypeid"
						onchange="change(this.value)">
						<option value="0">---请选择---</option>
						<c:forEach items="${listcustom}" var="list">

							<option value="${list.getCustomertypeid()}">${list.getCustomername()}</option>
						</c:forEach>
					</select>
				</div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1" id="Name">客户姓名：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="customname" name="customname"
						maxlength="20" placeholder="请输入客户名称" />
				</div>

			</div>
			<div class="form-group ">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
				<div style="display: none;" class="company">
					<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">法人代表：</label>
					<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
						<input class="form-control" id="corporaterepresentative"
							name="corporaterepresentative" maxlength="20" placeholder="请输入公司法人名称" />
					</div>
				</div>
				<div class="personal">
					<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">客户昵称：</label>
					<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
						<input class="form-control" id="customerusername" name="customerusername"
							maxlength="20" placeholder="请输入客户昵称" />
					</div>
				</div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">手机号码：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="customphonenumber" name="customphonenumber"
						maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')"
						onafterpaste="this.value=this.value.replace(/\D/g,'')"
						placeholder="请输入手机号码" onchange="YanZheng(this.id,value)" />
				</div>

			</div>
			<div class="form-group personal">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">性别：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<select class="form-control" id="sex" name="sex">
						<option value="0">---请选择---</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>

				</div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">身份证：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="customidnumber" name="customidnumber"
						maxlength="18"
						onkeyup="value=value.replace(/[^\w\.\/]/ig,'');judgeID(this.id,value)"
						placeholder="请输入身份证号码" onchange="YanZhengShenFenZheng(this.id,value)" />

				</div>


			</div>
			<div class="form-group">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">登录密码：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" type="password" id="custompassword"
						name="custompassword" maxlength="20" placeholder="请输入登录密码，初始密码：12345" />
				</div>

				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">确认密码：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" type="password" id="confimcustompassword"
						name="confimcustompassword" maxlength="20"
						placeholder="请确认登录密码，初始密码：12345" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">QQ：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="qq" name="qq" maxlength="12"
						placeholder="请输入QQ，可选填" />
				</div>

				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">邮箱：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="mailbox" name="mailbox" maxlength="20"
						placeholder="请输入邮箱，可选填" />
				</div>
			</div>
			<div class="form-group company" style="display: none;">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">电话号码：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="telephonenumber" name="telephonenumber"
						maxlength="12" placeholder="请输入公司的电话号码" />
				</div>
				<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">公司地址：</label>
				<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 ">
					<input class="form-control" id="companyadress" name="companyadress"
						maxlength="100" placeholder="请输入公司地址" />
				</div>

			</div>
			<div class="form-group">
				<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
				<div class="col-lg-4  col-md-4 col-xs-4 col-sm-4 ">
					<button class="btn btn-info" style="float:right;" onclick="regist()">注册</button>
				</div>
				<div class="col-lg-4  col-md-4 col-xs-4 col-sm-4 ">
					<button class="btn btn-info" style="float:left;" onclick="back()">返回</button>
				</div>
			</div>


		</form>

	</div>


	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>

	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/ValidateIDCardNumber.js"></script>
	<script type="text/javascript" src="${ctx }/Content/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var TabCustom;
		$(function() {
			var count = Math.round((window.screen.height - 300) / 50);
			TabCustom = $('#TabCustom')
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
									"url" : "${ctx}/CustomController/getList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.condition = $(
												".dataTables_filter input")
												.val();

									}
								},

								"columns" : [

										{
											"data" : "customname",
											"width" : "60px"
										},
										{
											"data" : "customerusername",
											"width" : "130px"
										},
										{
											"data" : "customername",
											"width" : "60px"
										},
										{
											"data" : function(obj) {
												var customphonenumber = obj.customphonenumber
														.substring(0, 3)
														+ "*****"
														+ obj.customphonenumber
																.substring(8,
																		11);
												return customphonenumber;
											}

										}, {
											"data" : "qq",
											"width" : "130px"
										}, {
											"data" : "mailbox",
											"width" : "140px"
										}

								]

							});

			$("#TabCustom_filter").append(
					"<button onclick='insert()'>新增客户</button>");
		});

		function insert() {
			$("#custom").show();
			$("#Table").hide();
		}
		function back() {
			$("#custom").hide();
			$("#custom input").val("");
			$("#custom select").val(0);
			$("#Table").show();
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
		function change(value) {
			$("#insertCustom input").val("");
			if (value == 1) {
				$(".company").hide();
				$(".personal").show();
				$("#Name").text("客户名称：");

			} else {
				$(".company").show();
				$(".personal").hide();
				$("#Name").text("公司名称：");
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
		function judgeID(ID, value) {
			if (value.length == 18) {

				if (!checkCard(value)) {
					layer.msg("请输入正确的身份证号码！！", {
						icon : 0,

						offset : '100px'
					});
					$("#" + ID).val("");
				}

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
		function regist() {
			layer.confirm("是否新增？？", {
				icon : 0,
				offset : "100px",
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {

				layer.close(layerIndex);//关闭提示框

				layer.load(0, {
					offset : "100px"
				});

				$("#insertCustom").attr("action",
						"${ctx}/CustomController/insertCustom.do");
				$("#insertCustom").ajaxSubmit(function(data) {
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
							layer.closeAll('loading');
							window.location.reload();
						});

					} else {
						layer.closeAll('loading');
						layer.msg(data.msg, {
							icon : 0,

							offset : '100px'
						});

					}
				});
			});
		}
	</script>
</body>
</html>
