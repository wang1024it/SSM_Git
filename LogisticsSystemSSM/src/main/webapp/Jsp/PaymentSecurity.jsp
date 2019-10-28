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

<title>修改支付密码</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>
<style type="text/css">
* {
	font-family: "华文仿宋";
	font-weight: bolder;
}

#returnMainView:hover {
	background-color: #d58512;
}

.panel-body {
	padding: 10px 10px;
}

* {
	font-family: "华文仿宋";
	font-weight: bolder;
}

html,body {
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

.col-lg-6,.col-md-6,.col-sm-6,.col-xs-6 {
	padding-left: 0;
}
</style>

</head>

<body>

	<div class="container">
		<div class="row" style="padding-top: 10px;">
			<form role="form" class="form-horizontal" id="UpdatePayFrom"
				onsubmit="return false">
				<div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12"
					style="padding: 0px;margin-left: 0px;" id="MiMaXiuGai">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">原支付密码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="password" class="form-control " id="originalpassword"
							name="originalpassword">
					</div>
				</div>

				<div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12 DuanXinXiuGai"
					style="padding: 0px;margin-left: 0px; display: none;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">手机号码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="text" class="form-control " id="PhoneNumber"
							name="PhoneNumber" maxlength="11"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							onchange="YanZheng(this.id,value)" />
					</div>
				</div>

				<div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12 DuanXinXiuGai"
					style="padding: 0px;margin-left: 0px; display: none;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">验证码：</label>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-left: 0px">
						<input type="text" class="form-control " id="Code" name="Code" max="11"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					</div>
					<div class="col-lg-1 col-sm-1 col-md-1">
						<button class="btn btn-info HQ" onclick="HuoQuDongTaiMa()">获取验证码</button>
					</div>
				</div>

				<div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">新支付密码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="password" class="form-control " id="newpassword"
							name="newpassword" />
					</div>
				</div>
				<div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">确认新支付密码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="password" class="form-control " id="confirmpassword"
							name="confirmpassword">
					</div>
				</div>
				<div class="form-group col-lg-8 col-md-8 col-sm-8 col-xs-12"
					style="margin-top:20px;">
					<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5"></div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">

						<button type="button" class="btn btn-success" onclick="UpdatePay()"
							id="updatePayPass">确定修改</button>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-info" onclick="UpdateDuanXin()" id="DuanXin">短信修改</button>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-info" onclick="UpdatePass()" id="MiMa"
							style="display: none;">密码修改</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var admit = 0;
		var Miao = 120;
		var int;

		function UpdateDuanXin() {
			$("#MiMaXiuGai").hide();
			$(".DuanXinXiuGai").show();
			$("#YanZhengCode").show();
			$("#DuanXin").hide();
			$("#MiMa").show();
			empty();
		}
		function Clean() {
			$("#MiMaXiuGai").show();
			$("#DuanXinXiuGai").hide();
			$("#YanZhengCode").hide();
			empty();
		}
		function empty() {
			$("#originalpassword").val("");
			$("#PhoneNumber").val("");
			$("#newpassword").val("");
			$("#confirmpassword").val("");
			$("#Code").val("");
		}
		function UpdatePayPassword() {
			$("#modal").modal("toggle");

			$(".DuanXinXiuGai").hide();
			$("#YanZhengCode").hide();
			if (admit == 1) {
				$("#MiMaXiuGai").show();
				$("#DuanXin").show();
			}

			$("#MiMa").hide();
		}
		function UpdatePass() {
			$("#MiMaXiuGai").show();
			$(".DuanXinXiuGai").hide();
			$("#YanZhengCode").hide();
			$("#DuanXin").show();
			$("#MiMa").hide();
			empty();
		}
		function UpdatePay() {
			var UpdatePayFrom = $("#UpdatePayFrom").serializeArray();
			if (layer.confirm("是否修改？？", {
				icon : 0,
				offset : '100px',
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {
				layer.close(layerIndex);
				$.post("${ctx}/PersonalDataController/updatePay.do",
						UpdatePayFrom, function(data) {
							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							if (data.state == true) {

								layer.alert(data.msg, {
									icon : 1,
									title : "提示",
									offset : '100px'
								}, function(layerIndex) {
									layer.close(layerIndex);

									window.location.reload();

								});

							} else {
								layer.msg(data.msg, {
									icon : 0,
									title : "提示",
									offset : '100px'
								});

							}

						});
			}))
				;

		}
		function HuoQuDongTaiMa() {

			var PhoneNumber = $("#PhoneNumber").val();

			if (PhoneNumber != undefined && PhoneNumber != null
					&& PhoneNumber != '') {
				FaSong(PhoneNumber);
			} else {
				layer.msg("请输入您的手机号码", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function FaSong(ShouJiNumber) {
			$.post("${ctx}/LoginController/faSongYanZhengMa.do?ShouJiNumber="
					+ ShouJiNumber, function(data) {

				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {
					$(".HQ").attr("disabled", "disabled");
					int = setInterval(GaiBianShiJian, 1000)
					layer.alert(data.msg, {
						icon : 1,
						title : "提示",
						offset : '100px',
					});

				} else {
					layer.alert(data.msg, {
						icon : 0,
						title : "提示",
						offset : '100px',
					});

				}

			});
		}
		function GaiBianShiJian() {
			Miao = Miao - 1;
			if (Miao == 0) {
				$(".HQ").removeAttr("disabled");
				$(".HQ").html("获取手机验证码");
				clearInterval(int);
			} else if (Miao > 118) {
				$(".HQ").html("已发送");
			} else {

				$(".HQ").html("重新发送" + Miao + "秒");
			}

		}
	</script>
</body>
</html>
