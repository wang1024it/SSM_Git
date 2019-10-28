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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0069)http://www.chinawutong.com/login.html?url=http://www.chinawutong.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<link href="${ctx }/Content/css/pub_sty.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="${ctx }/Content/css/memberlogin.css"
	type="text/css"></link>

<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
<script src="${ctx }/Content/js/h.js"></script>


<title>登录</title>

<style type="text/css">
input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0px 1000px white inset;
}
</style>

</head>
<body>
	<form name="form1" method="post" onsubmit="return false"
		action="${ctx}/LoginController/userLogin.do" id="ForShuJu">

		<!--顶部-->
		<div class="top_warpper">
			<div class="top_box">
				<div class="logo fl">



					<span class="fl"> 广发物流 登 录</span>
				</div>

			</div>
		</div>
		<div class="cl"></div>
		<!--内容-->

		<div class="content"
			style="background-image:url(${ctx }/Content/image/timg1.jpg);background-size:100% 100%">
			<div class="content_bj" style="background-image:url()">
				<!--填写框-->
				<div class="login_mem fr">
					<div class="login_list01">
						<div class="login_box fl">员工登录</div>

					</div>

					<div class="text_uid cl">
						<ul class="login_namewar">
							<li><label class="login_name"></label> <input name="PhoneNumber"
								type="text" id="PhoneNumber" class="login_text" autocomplete="off"
								placeholder="请输入您的手机号码" value="${PhoneNumber }" maxlength="11"
								onkeyup="this.value=this.value.replace(/\D/g,'')"
								onafterpaste="this.value=this.value.replace(/\D/g,'')"
								onchange="YanZheng(this.id,value)" /><span
								style="color: red; display: none; float: right; margin: 5px;"
								id="Uidhide">*</span></li>
							<li><label class="login_pwd"></label> <input name="Password"
								type="password" id="txtPwd" class="login_text2" maxlength="20"
								placeholder="请输入您的密码" value="${Password }" /><span
								style="color: red; display: none; float: right; margin: 5px;"
								id="Pwdhide">*</span></li>
							<li><img src="${ctx}/LoginController/Identity.do" id="ValidateCode"
								class="control-label" style="margin: 0px;padding: 0px" /> <input
								type="text"
								style="position: absolute; top: 75%; border: solid 1px #cbcbcb;width: 168px;height: 40px;"
								id="YanZhengMa" name="YanZhengMa" placeholder="请输入验证码" maxlength="5"
								onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
							</li>

						</ul>

						<div class="checkbox" style="display:inline-block">
							<label style="vertical-align:middle;font-style: Verdana"><input
								type="checkbox" id="IsRemember" value="false"
								onclick="CheckBox(this.id)" style="vertical-align:middle" />记住密码</label>
						</div>
						<input style="display: none;" id="IsTrue" name="IsTrue" />

						<div style="display:inline-block;margin-left: 15%">
							<a href="#" onclick="cleanLogin()"
								style="vertical-align:middle;font-style: Verdana;font-size: 12px">
								清除痕迹</a>
						</div>
						<div class="fr rememr">
							<a href="${ctx }/LoginController/forget.do" target="_blank">忘记密码?</a>
						</div>

						<div class="login_btn" style="margin-top: 10px">
							<input type="button" name="btnLogin" value="登   录" onclick="Login()"
								id="btnLogin" class="btnnew">
						</div>
						<div class="service fr">
							<a>服务热线：400-010-5656</a>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!--底部-->
		<div class="cl"></div>
		<div class="foot_login">
			<a href="http://www.chinawutong.com/about/" target="_blank">关于我们</a> | <a
				href="http://www.chinawutong.com/feedback.html" title="挑错有礼" target="_blank"><font
				color="#F83636">挑错有礼</font> </a> | <a
				href="http://www.chinawutong.com/foot/zhaopin.html" title="招聘英才"
				target="_blank">诚聘英才</a> | <a
				href="http://www.chinawutong.com/about/fuwuyuchanpin.html" target="_blank">服务与产品</a>
			| <a href="http://help.chinawutong.com/" target="_blank">使用与帮助</a> | <a
				href="http://www.chinawutong.com/about/wtsmfwtk.html" target="_blank">服务条款</a>
			| <a href="http://jm.chinawutong.com/" target="_blank">加盟我们</a> | <a
				href="http://www.chinawutong.com/about/wtsmfkfs.html" target="_blank">付款方式</a>
			| <a href="http://www.chinawutong.com/about/link.html" target="_blank">友情链接</a>
			| <a href="http://www.chinawutong.com/about/kefuzhongxin.html"
				target="_blank">客服中心</a> | <a
				href="http://www.chinawutong.com/about/lianxiwomen.html" target="_blank">联系我们</a>
			<br>
		</div>

	</form>
	<script type="text/javascript">
		var check = '${ISTrue}';

		$(function() {
			if (check == "true") {
				$("#IsRemember").prop("checked", "true");
				$("#IsRemember").val(true);
				$("#IsTrue").val(true);
			} else {
				$("#IsRemember").prop("checked", false);
				$("#IsRemember").val(false);
				$("#IsTrue").val(false);
			}
		});

		//判断是否选中
		function CheckBox(ID) {
			var IsTrue = $("#" + ID).val();
			if (IsTrue == "true") {
				$("#" + ID).val(false);
				$("#IsTrue").val(false);
			} else {
				$("#" + ID).val(true);
				$("#IsTrue").val(true);
			}
		}

		//点击刷新二维码
		$("#ValidateCode").click(
				function() {
					$("#ValidateCode").attr(
							"src",
							"${ctx}/LoginController/Identity.do?ts="
									+ new Date().getTime());//浏览器有一个缓存机制，这里借用时间是为了生成不重复图片。
				});

		function Login() {

			var Form = $("#ForShuJu").serializeArray();
			$.post("${ctx}/LoginController/userLogin.do", Form, function(data) {

				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {

					window.location.href = "${ctx}/MainController/main.do";
				} else {
					layer.alert(data.msg, {
						icon : 0,
						title : "提示"
					});
					$("#ValidateCode").click();
				}

			});

		}

		$(document).keypress(function(e) {
			// 回车键事件
			if (e.which == 13) {
				Login();
			}
		});
		function YanZheng(ID, value) {

			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(value)) {
				$("#" + ID).val("");
			}

		}

		function cleanLogin() {

			$.post("${ctx}/LoginController/cleanLogin.do", function(data) {

				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {
					layer.alert(data.msg, {
						icon : 1,
						btn : [ "确定" ]
					}, function(layerIndex) {
						layer.close(layerIndex);//关闭提示框
						window.location.reload();
					});
				}
			});

		}
	</script>
</body>
</html>

