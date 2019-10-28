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
<!-- saved from url=(0053)http://www.chinawutong.com/FindPSW/InputUserName.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>找回登录密码</title>
<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/gloab.css" type="text/css"></link>
<script type="text/javascript" src="${ctx }/Content/Content/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="${ctx }/Content/css/css-mima.css" type="text/css"></link>
<script type="text/javascript" src="${ctx }/Content/js/register.js"></script>

<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
</head>
<body>
	<form onsubmit="return false" id="form1">


		<div class="content">
			<div class="top">
				<div class="logo-fl">

					<span class="fl"
						style=" margin-top:5%;text-decoration:none; font-family:'微软雅黑'; font-size:24px;color:#999;">
						广发物流 找回密码</span>

				</div>
				<div class="logo-fr">
					&emsp; &emsp; &emsp; <a href="${ctx }/FrontJsp/Register.jsp">注册账号</a> <a
						href="${ctx }/FrontJsp/CustomLogin.jsp">登录</a> <a
						href="${ctx }/FrontJsp/RetrievePassword.jsp">找回密码</a> <a
						href="${ctx }">帮助</a> <a href="${ctx }/FrontJsp/HomePage.jsp">返回首页</a>
					<div class="logo-fb">客服热线：400—010—5656</div>
				</div>
			</div>
		</div>
		<!--[if !IE ]>顶部结束<![endif]-->
		<div class="login-box f-mt10 f-pb50">
			<div class="main bgf">
				<div class="reg-box-pan display-inline">
					<div class="step">
						<ul>
							<li class="col-xs-4 on"><span class="num"><em class="f-r5"></em><i>1</i>
							</span> <span class="line_bg lbg-r"></span>
								<p class="lbg-txt">填写账户信息</p>
							</li>
							<li class="col-xs-4"><span class="num"><em class="f-r5"></em><i>2</i>
							</span> <span class="line_bg lbg-l"></span> <span class="line_bg lbg-r"></span>
								<p class="lbg-txt">验证账户信息</p>
							</li>
							<li class="col-xs-4"><span class="num"><em class="f-r5"></em><i>3</i>
							</span> <span class="line_bg lbg-l"></span>
								<p class="lbg-txt">重置成功</p>
							</li>
						</ul>
					</div>




					<div class="reg-box" id="verifyCheck" style="margin-top:20px;">
						<form onsubmit="return false" enctype="multipart/form-data" method="post"
							id="formdata">
							<div class="part1">

								<div class="item col-xs-12">
									<span class="intelligent-label f-fl"><b class="ftx04">*</b>请输入的您的手机号码：</span>
									<div class="f-fl item-ifo" style="width:300px;display: inline-block">
										<input type="text" class="txt03 f-r3 required v_error" keycodes="tel"
											tabindex="2" data-valid="isNonEmpty||isPhone"
											data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone"
											onkeyup="this.value=this.value.replace(/\D/g,'')"
											onafterpaste="this.value=this.value.replace(/\D/g,'')"
											onchange="YanZheng(this.id,value)"> <span
											class="ie8 icon-close close hide"></span> <label
											class="icon-sucessfill blank hide"></label> <label class="focus hide">请填写11位有效的手机号码</label>
										<label class="focus valid error">手机号码不能为空</label>
									</div>
								</div>
								<div class="item col-xs-12">
									<span class="intelligent-label f-fl"><b class="ftx04">*</b>验&emsp;
										&emsp;&emsp;证 &emsp;&emsp;&emsp;码：</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<input type="text" maxlength="4" class="txt03 f-r3 f-fl required"
											tabindex="4" style="width:167px" id="randCode"
											data-valid="isNonEmpty" data-error="验证码不能为空"
											onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="5"
											placeholder="请输入验证码" /> <span class="ie8 icon-close close hide"></span>
										<label class="f-size12 c-999 f-fl f-pl10"> <img
											id="verificationImg" src="${ctx}/LoginController/Identity.do"
											onclick="changeCode()"> </label> <label
											class="icon-sucessfill blank hide" style="left:380px"></label> <label
											class="focusa">看不清？<a href="javascript:;" class="c-blue"
											onclick="changeCode()">换一张</a> </label> <label class="focus valid"
											style="left:370px"></label>
									</div>
								</div>
								<div class="item col-xs-12">
									<span class="intelligent-label f-fl">&nbsp;</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a>
									</div>
								</div>
							</div>

							<div class="part3" style="display:none">

								<div class="item col-xs-12 custom">
									<span class="intelligent-label f-fl"><b class="ftx04">*</b>密&emsp;&ensp;&ensp;码：</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<input type="password" id="password" name="password" maxlength="20"
											class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;"
											onpaste="return  false" autocomplete="off"
											data-valid="isNonEmpty||between:6-20||level:2"
											data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合"> <span
											class="ie8 icon-close close hide" style="right:55px"></span> <span
											class="showpwd" data-eye="password"></span> <label
											class="icon-sucessfill blank hide"></label> <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
										<label class="focus valid"></label> <span class="clearfix"></span> <label
											class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i>
										</b> </label>
									</div>
								</div>
								<div class="item col-xs-12 custom">
									<span class="intelligent-label f-fl "><b class="ftx04">*</b>确认密码：</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<input type="password" maxlength="20" name="confirmPassword"
											class="txt03 f-r3 required" tabindex="4" style="ime-mode:disabled;"
											onpaste="return  false" autocomplete="off"
											data-valid="isNonEmpty||between:6-16||isRepeat:password"
											data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="confirmPassword">
										<span class="ie8 icon-close close hide" style="right:55px"></span> <span
											class="showpwd" data-eye="rePassword"></span> <label
											class="icon-sucessfill blank hide"></label> <label class="focus">请再输入一遍上面的密码</label>
										<label class="focus valid"></label>
									</div>
								</div>
								<div class="item col-xs-12">
									<span class="intelligent-label f-fl">&nbsp;</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<a href="javascript:;" class="btn btn-blue f-r3" onclick="rest()">重置密码</a>
									</div>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<a href="javascript:;" class="btn btn-blue f-r3"
											onclick="backsecond()">上一步</a>
									</div>
								</div>
							</div>



							<div class="part2" style="display:none">
								<div class="alert alert-info" style="width:700px" id="tip">短信已发送至您手机，请输入短信中的验证码，确保您的手机号真实有效。</div>
								<div class="item col-xs-12 f-mb10" style="height:auto">
									<span class="intelligent-label f-fl">手机号：</span>
									<div class="f-fl item-ifo c-blue" style="display: inline-block"
										id="Phonenumber"></div>
								</div>
								<div class="item col-xs-12">
									<span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<input type="text" maxlength="6" id="verifyNo"
											class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px"
											data-valid="isNonEmpty||isInt" data-error="验证码不能为空||请输入4位数字验证码">
										<span class="btn btn-gray f-r3 f-ml5 f-size13" id="time_box"
											disabled="" style="width:97px;display:none;">发送验证码</span> <span
											class="btn btn-gray f-r3 f-ml5 f-size13" id="verifyYz"
											style="width:97px;" onclick="sendCode()">发送验证码</span> <span
											class="ie8 icon-close close hide" style="right:130px"></span> <label
											class="icon-sucessfill blank hide"></label> <label class="focus"><span>请查收手机短信，并填写短信中的验证码（此验证码2分钟内有效）</span>
										</label> <label class="focus valid"></label>
									</div>
								</div>
								<div class="item col-xs-12">
									<span class="intelligent-label f-fl">&nbsp;</span>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<a href="javascript:;" class="btn btn-blue f-r3" onclick="next()">下一步</a>
									</div>
									<div class="f-fl item-ifo " style="width:300px;display: inline-block">
										<a href="javascript:;" class="btn btn-blue f-r3" onclick="backfirst()">上一步</a>
									</div>
								</div>
							</div>
							<div class="part4 text-center" style="display:none">
								<h3 id="promt"></h3>
								<p class="c-666 f-mt30 f-mb50">
									页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a
										href="${ctx }/FrontJsp/Login.jsp" class="c-blue">物流登录界面</a>
								</p>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>

		<!--[if !IE ]>表单结束<![endif]-->
		<!--[if !IE ]>底部开始<![endif]-->
		<div class="footer">
			<div class="top">
				<div class="bottom-link">
					<a href="http://www.chinawutong.com/about/">关于我们</a> | <a
						href="http://www.chinawutong.com/feedback.html">挑错有礼</a> | <a
						href="http://www.chinawutong.com/foot/zhaopin.html">诚聘英才</a> | <a
						href="http://www.chinawutong.com/about/fuwuyuchanpin.html">服务与产品</a> | <a
						href="http://help.chinawutong.com/">使用与帮助</a> | <a
						href="http://www.chinawutong.com/about/wtsmfwtk.html">服务条款</a> | <a
						href="http://jm.chinawutong.com/">加盟我们</a> | <a
						href="http://www.chinawutong.com/about/wtsmfkfs.html"> 付款方式 </a> | <a
						href="http://www.chinawutong.com/about/link.html">友情链接</a> | <a
						href="http://www.chinawutong.com/about/kefuzhongxin.html">客服中心</a> | <a
						href="http://www.chinawutong.com/about/lianxiwomen.html">联系我们</a>
				</div>

			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			$("#tip").hide();
		});
		$("#btn_part1").click(
				function() {
					var phone = $("#phone").val();
					var code = $("#randCode").val();
					$.post("${ctx}/ClientController/selectCustom.do?phone="
							+ phone + "&txtCode=" + code, function(data) {

						if ((typeof data) == "string") {
							data = JSON.parse(data);
						}
						if (data == true) {
							$(".part1").hide();
							$(".part2").show();
							$("#Phonenumber").text(phone);
							$(".step li").eq(1).addClass("on");
						} else {
							changeCode();
							layer.msg(data, {
								icon : 0,
								title : "提示："
							});
						}

					});

				});
		function YanZheng(ID, value) {

			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(value)) {
				$("#" + ID).val("");
			}

		} //点击刷新二维码
		function changeCode() {
			$("#verificationImg").attr(
					"src",
					"${ctx}/LoginController/Identity.do?ts="
							+ new Date().getTime());//浏览器有一个缓存机制，这里借用时间是为了生成不重复图片。
		}

		function sendCode() {
			$("#tip").show();
			var phoneNumber = $("#phone").val();
			$.post("${ctx}/ClientController/faSongYanZhengMa.do?ShouJiNumber="
					+ phoneNumber, function(data) {
				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {
					layer.msg("发送成功", {
						icon : 1,
						offset : '100px',

					});
				} else {
					layer.msg(data.msg, {
						icon : 1,
						offset : '100px',

					});
				}
			});

		}
		function backfirst() {
			$(".part1").show();
			$(".part2").hide();
			$("#tip").hide();
		}
		function backsecond() {
			$(".part2").show();
			$(".part3").hide();
		}
		function next() {

			$(".part2").hide();
			$(".part3").show();

		}

		function rest() {
			var password = $("#password").val();
			var confirmPassword = $("#confirmPassword").val();
			var phoneNumber = $("#phone").val();
			$
					.post(
							"${ctx}/ClientController/setNewPassword.do?password="
									+ password + "&confirmPassword="
									+ confirmPassword + "&phoneNumber="
									+ phoneNumber,
							function(data) {
								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}
								if (data.state == true) {
									$("#promt").html("重置成功，请记住您的密码");

									$(".part3").hide();

									$(".part4").show();
									$(".step li").eq(2).addClass("on");
									countdown({
										maxTime : 10,
										ing : function(c) {
											$("#times").text(c);
										},
										after : function() {

											window.location.href = "${ctx}/FrontJsp/CustomLogin.jsp";

										}
									});
								} else {
									layer.msg(data.msg, {
										icon : 1,
										title : "提示："

									});
								}
							});

		}
	</script>


</body>
</html>