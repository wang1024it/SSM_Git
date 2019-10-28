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

<title>分配权限</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
</style>
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>


<style type="text/css">
* {
	font-family: "华文中宋";
	font-weight: bolder;
}
</style>
</head>
<body style="background: #f8f9fa">
	<div class="container-fluid">
		<div id="ModuleTab">
			<form class="form-horizontal" style="margin-top: 5px;margin-left: 20%">
				<div class="form-group">
					<div class="col-lg-8 col-sm-8 col-sm-8">
						<label class="control-label col-lg-4 col-sm-4 col-md-4">角色名称：</label>
						<div class="col-lg-8 col-sm-8 col-md-8">

							<select class="form-control" id="UserType" name="UserType"
								onchange="ChangeType(this.value)">
								<option value="">---请选择---</option>
								<c:forEach items="${strlist}" var="list">
									<option value="${list.getUsertypeid()}">${list.getUsertypename()}</option>
								</c:forEach>
							</select>

						</div>
					</div>

				</div>
			</form>
			<table id="TabModuleShang" class="table table-bordered">
				<thead>
					<tr align='center'>
						<td>模块名称</td>
						<td>操作</td>
					</tr>
					<tr align='center'>
						<td style="vertical-align:middle">管理层首页</td>
						<td>
							<button onclick="Open(1)" class="1 btn_open">开启</button>
							<button onclick="Close(1)">关闭</button></td>

					</tr>
					<tr align='center'>
						<td>客户管理</td>
						<td><button onclick="Open(18)" class="18 btn_open">开启</button>
							<button onclick="Close(18)">关闭</button></td>
					</tr>
					<tr align='center'>
						<td style="vertical-align:middle">签到</td>
						<td>
							<button onclick="Open(2)" class="2 btn_open">开启</button>
							<button onclick="Close(2)">关闭</button></td>

					</tr>
					<tr align='center'>
						<td>员工首页</td>
						<td><button onclick="Open(3)" class="3 btn_open">开启</button>
							<button onclick="Close(3)">关闭</button></td>


					</tr>
					<tr align='center'>
						<td>司机首页</td>
						<td>
							<button onclick="Open(4)" class="4 btn_open">开启</button>
							<button onclick="Close(4)">关闭</button></td>
					</tr>

					<tr align='center'>
						<td id="JuJue">司机订单管理</td>
						<td>
							<button onclick="Open(5)" class="5 btn_open">开启</button>
							<button onclick="Close(5)">关闭</button></td>
					</tr>
					<tr align='center'>
						<td>数据统计</td>
						<td><button onclick="Open(6)" class="6 btn_open">开启</button>
							<button onclick="Close(6)">关闭</button></td>
					</tr>
					<tr align='center'>
						<td>员工信息</td>
						<td><button onclick="Open(7)" class="7 btn_open">开启</button>
							<button onclick="Close(7)">关闭</button></td>
					</tr>
					<tr align='center'>
						<td>分配权限</td>
						<td><button onclick="Open(8)" class="8 btn_open">开启</button>
							<button onclick="Close(8)">关闭</button></td>

					</tr>

					<tr align='center'>
						<td>资讯推荐</td>

						<td><button onclick="Open(9)" class="9 btn_open">开启</button>
							<button onclick="Close(9)">关闭</button></td>

					</tr>
					<tr align='center'>
						<td>资金记录</td>

						<td><button onclick="Open(10)" class="10 btn_open">开启</button>
							<button onclick="Close(10)">关闭</button>
						</td>

					</tr>
					<tr align='center'>
						<td>关于我们</td>
						<td><button onclick="Open(11)" class="11 btn_open">开启</button>
							<button onclick="Close(11)">关闭</button></td>
					</tr>

					<tr align='center'>
						<td>员工订单管理</td>


						<td><button onclick="Open(12)" class="12 btn_open">开启</button>
							<button onclick="Close(12)">关闭</button></td>

					</tr>

					<tr align='center'>
						<td style="vertical-align:middle">车队信息</td>
						<td><button onclick="Open(13)" class="13 btn_open">开启</button>
							<button onclick="Close(13)">关闭</button></td>
					</tr>
					<tr align='center'>

						<td>司机管理</td>
						<td><button onclick="Open(14)" class="14 btn_open">开启</button>
							<button onclick="Close(14)">关闭</button></td>
					</tr>

					<tr align='center'>
						<td>车辆管理</td>
						<td><button onclick="Open(15)" class="15 btn_open">开启</button>
							<button onclick="Close(15)">关闭</button></td>

					</tr>

					<tr align='center'>

						<td>个人中心</td>
						<td><button onclick="Open(16)" class="16 btn_open">开启</button>
							<button onclick="Close(16)">关闭</button></td>

					</tr>

					<tr align='center'>
						<td>聊天室</td>
						<td><button onclick="Open(17)" class="17 btn_open">开启</button>
							<button onclick="Close(17)">关闭</button></td>
					</tr>
				</thead>

			</table>

			<button onclick="AllOpen(20)">全部开启</button>
			<button onclick="AllClose(20)">全部关闭</button>

		</div>

	</div>

	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		function Open(ID) {
			var UserType = $("#UserType").val();
			if (UserType > 0 && ID > 0) {
				$.post("${ctx}/PowerController/insertPower.do?UserType="
						+ UserType + "&ModuleID=" + ID, function(data) {
					if ((typeof data) == "string") {
						data = JSON.parse(data);
					}
					if (data.state == true) {
						layer.alert(data.msg, {
							icon : 1,
							offset : "100px",
							btn : [ "确定" ]
						}, function(layerIndex) {
							layer.close(layerIndex);//关闭提示框

							$("." + ID).css("background-color", "red");
							$("." + ID).attr("disabled", "disabled");
						});
					} else {
						layer.msg(data.msg, {
							icon : 0,
							offset : "100px",

						});
					}
				});

			} else {
				layer.msg("请选择需要分配权限的角色！！", {
					icon : 0,
					offset : "100px",

				});
			}
		}

		function Close(ID) {
			var UserType = $("#UserType").val();
			if (UserType > 0 && ID > 0) {
				$.post("${ctx}/PowerController/deletePower.do?UserType="
						+ UserType + "&ModuleID=" + ID, function(data) {
					if ((typeof data) == "string") {
						data = JSON.parse(data);
					}
					if (data.state == true) {
						layer.alert(data.msg, {
							icon : 1,
							offset : "100px",
							btn : [ "确定" ]
						}, function(layerIndex) {
							layer.close(layerIndex);//关闭提示框
							$("." + ID).css("background-color", "white");
							$("." + ID).removeAttr("disabled");
						});
					} else {
						layer.msg(data.msg, {
							icon : 0,
							offset : "100px",

						});
					}
				});

			} else {
				layer.msg("请选择需要分配权限的角色！！", {
					icon : 0,
					offset : "100px",

				});
			}
		}

		function AllOpen(ID) {
			layer.confirm("是否全部开启？？", {
				icon : 0,
				offset : "100px",
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {
				layer.close(layerIndex);
				Open(ID);
				$(".btn_open").css("background-color", "red");
			});
		}

		function AllClose(ID) {

			layer.confirm("是否全部关闭？？", {
				icon : 0,
				offset : "100px",
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {
				layer.close(layerIndex);
				Close(ID);
				$(".btn_open").css("background-color", "white");
			});
		}

		function ChangeType(value) {
			$(".btn_open").css("background-color", "white");
			$(".btn_open").removeAttr("disabled");
			$.post("${ctx}/PowerController/select0perate.do?UserTypeID="
					+ value, function(data) {
				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data != "") {

					for ( var i = 0; i < data.length; i++) {
						$("." + data[i].moduleid)
								.css("background-color", "red");
						$("." + data[i].moduleid).attr("disabled", "disabled");
					}
				}

			});
		}
	</script>
</body>
</html>
