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

<title>账号安全</title>
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
			<form role="form" class="form-horizontal" onsubmit="return false"
				id="UpdateFromPassword">
				<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
					style="padding: 0px;margin-left: 0px;" id="MiMaXiuGai1">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">当前密码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="password" class="form-control " id="originalpassword1"
							name="originalpassword1" maxlength="20">
					</div>
				</div>
				<div
					class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12 DuanXinXiuGai1"
					style="padding: 0px;margin-left: 0px; display: none;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">手机号码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="text" class="form-control " id="PhoneNumber"
							name="PhoneNumber" maxlength="11"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							onchange="YanZheng(this.id,value)">
					</div>
				</div>

				<div
					class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12 DuanXinXiuGai1"
					style="padding: 0px;margin-left: 0px; display: none;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">验证码：</label>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="padding-left: 0px">
						<input type="text" class="form-control " id="Code1" name="Code1"
							maxlength="7" onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')">
					</div>
					<div class="col-lg-1 col-sm-1 col-md-1">
						<button class="btn btn-info HQ" onclick="HuoQuDongTaiMa()">获取验证码</button>
					</div>
				</div>


				<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">新密码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="password" class="form-control " id="newpassword1"
							name="newpassword1" maxlength="20">
					</div>
				</div>
				<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
					style="padding: 0px;margin-left: 0px;">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
					<label for="firstname"
						class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">确认新密码：</label>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<input type="password" class="form-control " id="confirmpassword1"
							name="confirmpassword1" maxlength="20">
					</div>
				</div>
				<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
					style="margin-top:20px;">
					<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5"></div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
						<button type="button" class="btn btn-success"
							onclick="UpdateLoginPassword()" id="updateLoginPassword">确定修改</button>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-sm-lg-2 ">
						<button class="btn btn-info" onclick="UpdateLoginDuanXin()" id="DuanXin1">短信修改</button>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-sm-lg-2 ">

						<button class="btn btn-info" onclick="UpdateLoginPass()"
							style="display: none;" id="MiMa1">密码修改</button>
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
		var Miao = 120;
		var int;

		function UpdateLoginPass() {
			$("#MiMaXiuGai1").show();
			$(".DuanXinXiuGai1").hide();
			$("#YanZhengCode1").hide();
			$("#DuanXin1").show();
			$("#MiMa1").hide();
			empty1();
		}
		function UpdateLoginDuanXin() {
			$("#MiMaXiuGai1").hide();
			$(".DuanXinXiuGai1").show();
			$("#YanZhengCode1").show();
			$("#DuanXin1").hide();
			$("#MiMa1").show();
			empty1();
		}

		function Cleanr() {
			$("#MiMaXiuGai1").show();
			$(".DuanXinXiuGai1").hide();
			$("#YanZhengCode1").hide();
			empty1();
		}
		function empty1() {
			$("#originalpassword1").val("");
			$("#PhoneNumber1").val("");
			$("#newpassword1").val("");
			$("#confirmpassword1").val("");
			$("#Code1").val("");
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
					layer.msg(data.msg, {
						icon : 0,
						title : "提示",
						offset : '100px',
					});

				}

			});
		}
		function UpdateLoginPassword() {
			var UpdatePayFrom = $("#UpdateFromPassword").serializeArray();
			if (layer.confirm("是否修改？？", {
				icon : 0,
				offset : '100px',
				btn : [ "确定", "取消" ]
			}, function(layerIndex) {
				layer.close(layerIndex);
				$.post("${ctx}/PersonalDataController/updatePassword.do",
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
