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

<!DOCTYPE html>
<!-- saved from url=(0038)http://demo1.mycodes.net/zhuce/verify/ -->
<html>
<head>

<title>注册</title>
<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/gloab.css" type="text/css"></link>
<script type="text/javascript" src="${ctx }/Content/Content/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="${ctx }/Content/css/css-mima.css" type="text/css"></link>
<script type="text/javascript" src="${ctx }/Content/js/register.js"></script>
<style type="text/css">
.upload-file {
	position: relative;
	width: 120px;
	padding: 10px 15px;
	border: 1px solid rgb(119, 154, 80);
	border-radius: 5px;
	background-color: white;
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
	filter: alpha(opacity =         
		                                                         
		           0);
	cursor: pointer;
}
</style>
</head>
<body class="bgf4">
	<div class="content">
		<div class="top">
			<div class="logo-fl">

				<span class="fl"
					style=" margin-top:5%;text-decoration:none; font-family:'微软雅黑'; font-size:24px;color:#999;">
					广发物流 注册账号</span>

			</div>
			<div class="logo-fr">
				&emsp; &emsp; &emsp; <a href="${ctx }/FrontJsp/Register.jsp">注册账号</a> <a
					href="${ctx }/FrontJsp/CustomLogin.jsp">登录</a> <a
					href="${ctx }/FrontJsp/RetrievePassword.jsp">找回密码</a> <a href="${ctx }">帮助</a>
				<a href="${ctx }/FrontJsp/HomePage.jsp">返回首页</a>
				<div class="logo-fb">客服热线：400—010—5656</div>
			</div>
		</div>
	</div>
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
							<p class="lbg-txt">注册成功</p>
						</li>
					</ul>
				</div>
				<div class="reg-box" id="verifyCheck" style="margin-top:20px;">
					<form onsubmit="return false" enctype="multipart/form-data" method="post"
						id="formdata">
						<div class="part1">

							<div class="item col-xs-12">
								<span class="intelligent-label f-fl "><b class="ftx04">*</b>注册类型：
								</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block;">

									<select class="form-control" style="width: 270px"
										onchange="isChoose(this.id,value)" id="customertypeid"
										name="customertypeid">
										<option value="0">----请选择----</option>
										<option value="1">个体商户</option>
										<option value="2">企业商户</option>
										<option value="3">司机注册</option>
									</select> <span class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"
										id="choose"><span>请选择需要注册的类型</span> </label> <label
										class="focus valid"></label>
								</div>
							</div>

							<div class="item col-xs-12 custom">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>用 户 名：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="20" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty||between:3-20||isUname"
										data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头"
										id="customerusername" name="customerusername"
										placeholder="请输入你需要注册用户名" /> <span class="ie8 icon-close close hide"></span>
									<label class="icon-sucessfill blank hide"></label> <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span>
									</label> <label class="focus valid"></label>
								</div>
							</div>

							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>手 机 号：</span>
								<div class="f-fl item-ifo" style="width:300px;display: inline-block">
									<input type="text" class="txt03 f-r3 required v_error" keycodes="tel"
										tabindex="2" data-valid="isNonEmpty||isPhone"
										data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										onchange="YanZheng(this.id,value)"> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus hide">请填写11位有效的手机号码</label>
									<label class="focus valid error">手机号码不能为空</label> <input class="hidden"
										name="customphonenumber" id="customphonenumber" />
								</div>
							</div>
							<div class="item col-xs-12 custom">
								<span class="intelligent-label f-fl">&emsp;Q&emsp;&ensp;&ensp;&ensp;
									Q：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" class="txt03 f-r3 " tabindex="2" maxlength="11"
										id="QQ" name="qq" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" />
									<span class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">可选填</label>
									<label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12 custom">
								<span class="intelligent-label f-fl">&emsp;邮&emsp;&emsp;箱：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" class="txt03 f-r3 " tabindex="2" maxlength="11"
										id="mailbox" name="mailbox"> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">可选填</label>
									<label class="focus valid"></label>
								</div>
							</div>

							<div class="item col-xs-12 custom">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>密&emsp;&ensp;&ensp;码：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="password" id="password" name="custompassword"
										maxlength="20" class="txt03 f-r3 required" tabindex="3"
										style="ime-mode:disabled;" onpaste="return  false" autocomplete="off"
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
										data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword"> <span
										class="ie8 icon-close close hide" style="right:55px"></span> <span
										class="showpwd" data-eye="rePassword"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">请再输入一遍上面的密码</label>
									<label class="focus valid"></label>
								</div>
							</div>


							<div class="item col-xs-12 user">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>密&emsp;&ensp;&ensp;码：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="password" id="loginpassword" name="loginpassword"
										maxlength="16" class="txt03 f-r3 required" tabindex="3"
										style="ime-mode:disabled;" onpaste="return  false" autocomplete="off"
										data-valid="isNonEmpty||between:6-20||level:2"
										data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合"> <span
										class="ie8 icon-close close hide" style="right:55px"></span> <span
										class="showpwd" data-eye="loginpassword"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
									<label class="focus valid"></label> <span class="clearfix"></span> <label
										class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i>
									</b> </label>
								</div>
							</div>
							<div class="item col-xs-12 user">
								<span class="intelligent-label f-fl "><b class="ftx04">*</b>确认密码：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="password" maxlength="16" name="confirmLoginPassWord"
										class="txt03 f-r3 required" onclick="clickthis(this.id)"
										id="confirmloginpassword" onmouseout="PanDaun(this.id)"> <span
										class="ie8 icon-close close hide" style="right:55px"></span> <span
										class="showpwd" data-eye="confirmloginpassword"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"
										id="confirmloginpassword1">请再输入一遍上面登录的密码</label>
								</div>
							</div>

							<div class="item col-xs-12 user">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>支付密码：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="password" id="paymentpassword" name="paymentpassword"
										maxlength="16" class="txt03 f-r3 required" tabindex="3"
										style="ime-mode:disabled;" onpaste="return  false" autocomplete="off"
										data-valid="isNonEmpty||between:6-20||level:2"
										data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合"> <span
										class="ie8 icon-close close hide" style="right:55px"></span> <span
										class="showpwd" data-eye="paymentpassword"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
									<label class="focus valid"></label> <span class="clearfix"></span> <label
										class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i>
									</b> </label>
								</div>
							</div>
							<div class="item col-xs-12 user">
								<span class="intelligent-label f-fl "><b class="ftx04">*</b>确认支密：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="password" maxlength="16" id="confirmpaymentpassword"
										name="confirmPayPassWord" class="txt03 f-r3 required"
										onclick="clickthis(this.id)" onmouseout="PanDaun(this.id)"> <span
										class="ie8 icon-close close hide" style="right:55px"></span> <span
										class="showpwd" data-eye="confirmpaymentpassword"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"
										id="confirmpaymentpassword1">请再输入一遍上面支付的密码</label>
								</div>
							</div>



							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>验 证 码：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="4" class="txt03 f-r3 f-fl required"
										tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty"
										data-error="验证码不能为空" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"
										maxlength="5" placeholder="请输入验证码" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="f-size12 c-999 f-fl f-pl10"> <img id="verificationImg"
										src="${ctx}/LoginController/Identity.do" onclick="changeCode()">
									</label> <label class="icon-sucessfill blank hide" style="left:380px"></label>
									<label class="focusa">看不清？<a href="javascript:;" class="c-blue"
										onclick="changeCode()">换一张</a> </label> <label class="focus valid"
										style="left:370px"></label>
								</div>
							</div>
							<div class="item col-xs-12" style="height:auto">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<p class="f-size14 required" data-valid="isChecked" data-error="请先同意条款">
									<input type="checkbox" checked=""><a
										href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
								</p>
								<label class="focus valid"></label>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a>
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
									<a href="javascript:;" class="btn btn-blue f-r3" id="back"
										onclick="backFirst()">上一步</a>
								</div>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" id="btn_part2">注册</a>
								</div>

							</div>
						</div>
						<div class="part5" style="display:none;padding-left: 150px;">
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>公司名称：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="10" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty||between:2-10||isZh"
										data-error="公司名称不能为空||公司名称长度2-10位||只能输入中文" id="companyname"
										name="companyname" placeholder="请输入公司名称" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">2-10位，中文公司名称</label>
									<label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>法人代表：</span>

								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="10" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty||between:3-10||isZh"
										data-error="法人名称不能为空||法人名称长度3-20位||只能输入中文"
										id="corporaterepresentative" name="corporaterepresentative"
										placeholder="请输入公司法人代表名称" /> <span class="ie8 icon-close close hide"></span>
									<label class="icon-sucessfill blank hide"></label> <label class="focus"><span>中文，10个字以内</span>
									</label> <label class="focus valid"></label>
								</div>
							</div>

							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>联系电话：</span>

								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="11" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty" data-error="公司的联系电话不能为空"
										id="telephonenumber" name="telephonenumber" placeholder="请输入公司的联系电话"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"><span>公司联系电话</span>
									</label> <label class="focus valid"></label>
								</div>
							</div>

							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>公司地址：</span>

								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="100" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty||between:3-100"
										data-error="公司地址不能为空||公司地址长度3-20位" id="companyadress"
										name="companyadress" placeholder="请输入公司的地址" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"><span>中文，50个字以内</span>
									</label> <label class="focus valid"></label>
								</div>
							</div>

						
							


							<div class="item col-xs-12">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" onclick="backSecond()">上一步</a>
								</div>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" onclick="next3()">下一步</a>
								</div>

							</div>
						</div>


						<div class="part3" style="display:none">
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>真实姓名：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="10" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty||between:2-10||isZh"
										data-error="真实姓名不能为空||真实姓名长度2-10位||只能输入中文" id="adminNo"
										name="customname" placeholder="请输入真实姓名" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">2-10位，中文真实姓名</label>
									<label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>性&emsp;&emsp;别：</span>

								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<select name="sex" class="form-control" style="width: 270px"><option>---请选择---</option>
										<option>男</option>
										<option>女</option>
									</select>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>身份证号：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" class="txt03 f-r3 required" tabindex="2"
										data-valid="isNonEmpty||isCard" data-error="身份证号不能为空||身份证号码格式不正确"
										maxlength="18" id="customidnumber" name="customidnumber"
										onkeyup="value=value.replace(/[^\w\.\/]/ig,'');judgeID(this.id,value)"
										placeholder="请输入身份证号码" onchange="YanZhengShenFenZheng(this.id,value)" />
									<span class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">请填写18位有效的身份证号码</label>
									<label class="focus valid"></label>
								</div>
							</div>
						


							<div class="item col-xs-12">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" onclick="next3()">下一步</a>
								</div>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" onclick="backSecond()">上一步</a>
								</div>
							</div>
						</div>




						<div class="part6" style="display:none;padding-left: 150px;">
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>司机名称：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="10" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty||between:2-10||isZh"
										data-error="司机名称不能为空||司机名称长度2-10位||只能输入中文" id="username"
										name="username" placeholder="请输入司机名称" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">2-10位，中文司机名称</label>
									<label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>性&emsp;&emsp;别：</span>

								<input class="hidden" id="phonenumber" name="phonenumber" />
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<select name="driversex" class="form-control" style="width: 270px"
										onchange="choosesex(this.value)"><option value="-1">---请选择---</option>
										<option value="男">男</option>
										<option value="女">女</option>
									</select><input class="hidden" id="Sex" name="Sex" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"
										id="sexchoose"><span>请选择性别</span> </label> <label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>是否有车：</span>


								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<select name="ishavecar" id="ishavecar" class="form-control"
										style="width: 270px" onchange="choose(this.id,value)"><option
											value="-1">---请选择---</option>
										<option value="1">有</option>
										<option value="0">无</option>
									</select><span class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"
										id="carchoose"><span>请选择是否有车</span> </label> <label
										class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>居住地址：</span>

								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" maxlength="100" class="txt03 f-r3 required"
										tabindex="1" data-valid="isNonEmpty" data-error="居住地址不能为空"
										id="address" name="address" placeholder="请输入居住地址" /> <span
										class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus"><span>请输入的您的居住地址</span>
									</label> <label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl"><b class="ftx04">*</b>身份证号：</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<input type="text" class="txt03 f-r3 required" tabindex="2"
										data-valid="isNonEmpty||isCard" data-error="身份证号不能为空||身份证号码格式不正确"
										maxlength="18" id="idnumber" name="idnumber"
										onkeyup="value=value.replace(/[^\w\.\/]/ig,'');judgeID(this.id,value)"
										placeholder="请输入身份证号码" onchange="YanZhengShenFenZheng(this.id,value)" />
									<span class="ie8 icon-close close hide"></span> <label
										class="icon-sucessfill blank hide"></label> <label class="focus">请填写18位有效的身份证号码</label>
									<label class="focus valid"></label>
								</div>
							</div>
							<div class="item col-xs-12" style="height: 280px">
								<span class="intelligent-label f-fl"><a style="float: left"><b
										class="ftx04">*</b>身 份 证：</a> </span>

								<div class="upload-file f-fl item-ifo"
									style="margin:0 auto; ;width: 340px; display: inline-block">
									<img id="image2" height="200px;" width="300px" /> <input type="file"
										class="addBorder" onchange="loadImg(2)" id="picture2" name="picture"
										accept="image/*" /> <input class="hidden" id="fileName2" /> <span
										class="tip">点击上传身份证图片</span>
								</div>
							</div>
							<div class="item col-xs-12" style="height: 280px">
								<span class="intelligent-label f-fl"><a style="float: left"><b
										class="ftx04">*</b>个人照片：</a> </span>

								<div class="upload-file f-fl item-ifo"
									style="margin:0 auto; ;width: 340px; display: inline-block">
									<img id="image3" height="200px;" width="300px" /> <input type="file"
										class="addBorder" onchange="loadImg(3)" id="picture3" name="picture"
										accept="image/*" /> <input class="hidden" id="fileName3" /> <span
										class="tip">点击上传个人照片</span>
								</div>
							</div>
							<div class="item col-xs-12" style="height: 280px">
								<span class="intelligent-label f-fl"><a style="float: left"><b
										class="ftx04">*</b>驾 驶 证：</a> </span>

								<div class="upload-file f-fl item-ifo"
									style="margin:0 auto; ;width: 340px; display: inline-block">
									<img id="image4" height="200px;" width="300px" /> <input type="file"
										class="addBorder" onchange="loadImg(4)" id="picture4" name="picture"
										accept="image/*" /> <input class="hidden" id="fileName4" /> <span
										class="tip">点击上传驾驶证照片</span>
								</div>
							</div>
							<div class="item col-xs-12 mancar" style="height: 280px">
								<span class="intelligent-label f-fl"><a style="float: left"><b
										class="ftx04">*</b>人车合照：</a> </span>

								<div class="upload-file f-fl item-ifo"
									style="margin:0 auto; ;width: 340px; display: inline-block">
									<img id="image5" height="200px;" width="300px" /> <input type="file"
										class="addBorder" onchange="loadImg(5)" id="picture5" name="picture"
										accept="image/*" /> <input class="hidden" id="fileName5" /> <span
										class="tip">点击上传人车合照</span>
								</div>
							</div>
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:;" class="btn btn-blue f-r3" onclick="next3()">下一步</a>
								</div>
								<div class="f-fl item-ifo " style="width:300px;display: inline-block">
									<a href="javascript:; " class="btn btn-blue f-r3"
										onclick="backSecond()">上一步</a>
								</div>
							</div>
						</div>

						<div class="part4 text-center" style="display:none">
							<h3 id="promt"></h3>
							<p class="c-666 f-mt30 f-mb50">
								页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a
									href="${ctx }/Jsp/HomePage.jsp" class="c-blue">物流首页</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="m-sPopBg" style="z-index:998;"></div>
	<div class="m-sPopCon regcon">
		<div class="m-sPopTitle">
			<strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose"
				onclick="closeClause()">×</b>
		</div>
		<div class="apply_up_content">
			<pre class="f-r0">		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
		</div>
		<center>
			<a
				class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3"
				href="javascript:closeClause();">已阅读并同意此条款</a>
		</center>
	</div>
	<div class="footer">
		<div class="top">
			<div class="bottom-link">
				<a href="http://www.chinawutong.com/about/">关于我们</a> | <a
					href="http://www.chinawutong.com/feedback.html"> 挑错有礼 </a> | <a
					href="http://www.chinawutong.com/foot/zhaopin.html">诚聘英才</a> | <a
					href="http://www.chinawutong.com/about/fuwuyuchanpin.html">服务与产品</a> | <a
					href="http://help.chinawutong.com/"> 使用与帮助 </a> | <a
					href="http://www.chinawutong.com/about/wtsmfwtk.html">服务条款</a> | <a
					href="http://jm.chinawutong.com/">加盟我们</a> | <a
					href="http://www.chinawutong.com/about/wtsmfkfs.html"> 付款方式 </a> | <a
					href="http://www.chinawutong.com/about/link.html">友情链接</a> | <a
					href="http://www.chinawutong.com/about/kefuzhongxin.html"> 客服中心 </a> | <a
					href="http://www.chinawutong.com/about/lianxiwomen.html">联系我们</a>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/ValidateIDCardNumber.js"></script>

	<script>
		var customertypeid = 0;

		$(function() {

			$("#tip").hide();
			$(".user").hide();

			changeCode();
			//第一页的确定按钮
			$("#btn_part1").click(
					function() {
						customertypeid = $("#customertypeid").val();
						if (customertypeid != 3) {
							if (!verifyCheck._click())
								return;
						}

						var code = $("#randCode").val();
						var PhoneCode = $("#phone").val();

						$.post("${ctx}/ClientController/checkedCode.do?code="
								+ code + "&PhoneCode=" + PhoneCode
								+ "&customertypeid=" + customertypeid,
								function(data) {
									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									if (data.state == true) {
										$("#phonenumber").val(PhoneCode);
										$(".part1").hide();
										$("#Phonenumber").text(
												$("#phone").val());
										$("#customphonenumber").val(
												$("#phone").val());
										$(".step li").eq(1).addClass("on");
										$("#phonenumber")
												.val($("#phone").val());
										var customertypeid = $(
												"#customertypeid").val();
										$(".part2").show();

									} else {

										layer.alert(data.msg, {
											icon : 0,
											offset : '100px',
											btn : [ "确定" ]
										});
										changeCode();
									}
								});

					});
			//第二页的确定按钮
			$("#btn_part2").click(
					function() {
						if (!verifyCheck._click())
							return;
						var phoneCode = $("#verifyNo").val();

						$.post(
								"${ctx}/ClientController/verficationPhone.do?PhoneCode="
										+ phoneCode, function(data) {
									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}

									if (data == "1") {

										if (customertypeid != null
												&& customertypeid != ""
												&& customertypeid == "1") {
											$(".part2").hide();
											$(".part3").show();
										} else if (customertypeid != null
												&& customertypeid != ""
												&& customertypeid == "2") {
											$(".part2").hide();
											$(".part5").show();
										} else if (customertypeid != null
												&& customertypeid != ""
												&& customertypeid == "3") {
											$(".part2").hide();
											$(".part6").show();
										}

									} else {
										layer.alert("验证码错误！！", {
											icon : 0,
											offset : '100px',
											btn : [ "确定" ]
										});
									}
								});

					});

		});

		//第三页的确定按钮
		function next3() {
			if (!verifyCheck._click())
				return;
			layer.load();
			if (customertypeid != 3) {

				$("#formdata").attr("action",
						"${ctx}/ClientController/insertCustom.do");

				$("#formdata")
						.ajaxSubmit(
								function(data) {

									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									if (data.state == true) {
										layer.closeAll('loading');
										$("#promt")
												.html(
														"恭喜"
																+ $(
																		"#customerusername")
																		.val()
																+ "，您已注册成功，现在开始您的物流之旅吧！");

										$(".part3").hide();
										$(".part5").hide();
										$(".part4").show();
										$(".part6").hide();
										$(".step li").eq(2).addClass("on");
										countdown({
											maxTime : 10,
											ing : function(c) {
												$("#times").text(c);
											},
											after : function() {
												window.location.href = "${ctx}/FrontJsp/HomePage.jsp";
											}
										});
									} else {
										layer.closeAll('loading');
										layer.alert(data.msg, {
											icon : 0,
											title : "提示",
											offset : '30px'
										});

									}
								});
			} else {
				$("#formdata").attr("action",
						"${ctx}/ClientController/insertDriver.do");

				$("#formdata")
						.ajaxSubmit(
								function(data) {

									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									if (data.state == true) {
										layer.closeAll('loading');
										$(".part6").hide();
										$("#promt")
												.html(
														"恭喜"
																+ $(
																		"#customerusername")
																		.val()
																+ "，您已注册成功，现在开始您的物流之旅吧！");

										$(".part3").hide();

										$(".part5").hide();
										$(".part4").show();
										$(".step li").eq(2).addClass("on");
										countdown({
											maxTime : 10,
											ing : function(c) {
												$("#times").text(c);
											},
											after : function() {
												if (customertypeid == 3) {
													window.location.href = "${ctx}/LoginController/login.do";
												} else {
													window.location.href = "${ctx}/FrontJsp/HomePage.jsp";
												}

											}
										});
									} else {
										layer.closeAll('loading');
										layer.alert(data.msg, {
											icon : 0,
											title : "提示",
											offset : '30px'
										});

									}
								});

			}

		}

		function showoutc() {
			$(".m-sPopBg,.m-sPopCon").show();
		}
		function closeClause() {
			$(".m-sPopBg,.m-sPopCon").hide();
		}

		function isChoose(ID, value) {
			if (value == "----请选择----") {
				$("#choose").removeClass("hide");
				$("#choose").css("color", "red");
			} else {
				$("#choose").addClass("hide");
				$("#choose").css("color", "#999");
			}
			if ($("#" + ID).val() == "3") {
				$(".user").show();
				$(".custom").hide();
			} else {
				$(".user").hide();
				$(".custom").show();
			}

		}

		function changeCode() {
			$("#verificationImg").attr(
					"src",
					"${ctx}/LoginController/Identity.do?ts="
							+ new Date().getTime());//浏览器有一个缓存机制，这里借用时间是为了生成不重复图片。
		}

		function backFirst() {
			changeCode();
			$(".part1").show();
			$(".part2").hide();
			$(".step li").eq(1).removeClass("on");
			scrollTo(".bgf4", 1000);
		}
		function backSecond() {
			$(".part2").show();
			$(".part3").hide();

		}

		//点击回到指定的位置
		function scrollTo(ele, speed) {
			if (!speed)
				speed = 300;
			if (!ele) {
				$("html,body").animate({
					scrollTop : 0
				}, speed);
			} else {
				if (ele.length > 0)
					$("html,body").animate({
						scrollTop : $(ele).offset().top
					}, speed);
			}
			return false;
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
					layer.alert(data.msg, {
						icon : 1,
						offset : '100px',
						btn : [ "确定" ]
					});
				}
			});

		}

		//读取图片
		function loadImg(Count) {

			//获取文件$('#input').get(0).files[0]
			var file = $("#picture" + Count).get(0).files[0];

			//创建读取文件的对象
			var reader = new FileReader();

			//创建文件读取相关的变量
			var imgFile;

			//为文件读取成功设置事件
			reader.onload = function(e) {

				imgFile = e.target.result;

				$("#image" + Count).attr('src', imgFile);

			};

			//正式读取文件
			reader.readAsDataURL(file);

			$("#fileName" + Count).val(file.name);

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
		function choose(ID, value) {
			if (value == "1") {
				$(".mancar").show();
			} else if (value == "0") {
				$(".mancar").hide();
			}
			if (value == "-1") {
				$("#carchoose").removeClass("hide");
				$("#carchoose").css("color", "red");
			} else {
				$("#carchoose").addClass("hide");
				$("#carchoose").css("color", "#999");
			}
		}
		function choosesex(value) {
			if (value == "-1") {
				$("#sexchoose").removeClass("hide");
				$("#sexchoose").css("color", "red");
				$("#Sex").val("");
			} else {
				$("#sexchoose").addClass("hide");
				$("#sexchoose").css("color", "#999");
				$("#Sex").val(value);
			}
		}

		function PanDaun(ID) {
			if ($("#" + ID).val() != null && $("#" + ID).val() != '') {
				if ("confirmpaymentpassword" != ID) {

					if ($("#" + ID).val() != $("#loginpassword").val()) {
						$("#" + ID).css("border", "1px solid red");
						$("#" + ID + 1).show();
						$("#" + ID + 1).css("color", "red");
						$("#" + ID + 1).text("两次密码输入不一致");
					} else {
						$("#" + ID).css("border", "1px solid #ccc");
						$("#" + ID + 1).hide();
						$("#" + ID + 1).css("color", "red");
						$("#" + ID + 1).text("两次密码输入不一致");
					}
				} else {
					if ($("#" + ID).val() != $("#paymentpassword").val()) {
						$("#" + ID).css("border", "1px solid red");
						$("#" + ID + 1).show();
						$("#" + ID + 1).css("color", "red");
						$("#" + ID + 1).text("两次密码输入不一致");
					} else {
						$("#" + ID).css("border", "1px solid #ccc");
						$("#" + ID + 1).hide();
						$("#" + ID + 1).css("color", "red");
						$("#" + ID + 1).text("两次密码输入不一致");
					}
				}

			} else {
				$("#" + ID).css("border", "1px solid red");
				$("#" + ID + 1).show();
				$("#" + ID + 1).css("color", "red");
				$("#" + ID + 1).text("确认密码不能为空");
			}
		}

		function clickthis(ID) {
			$("#" + ID + 1).show();
			$("#" + ID + 1).css("color", "#999");
			$("#" + ID).css("border", "1px solid #ccc");
			$("#" + ID + 1).text("请再输入一遍上面密码");

		}
	</script>

</body>
</html>
