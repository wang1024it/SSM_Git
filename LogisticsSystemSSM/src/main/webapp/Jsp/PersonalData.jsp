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

<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="generator" content="" />
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>



<title>个人资料</title>
<style>
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

.file {
	position: relative;
	display: inline-block;
	background: #D0EEFF;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}

.file:hover {
	background: #AADFFD;
	border-color: #78C3F3;
	color: #004974;
	text-decoration: none;
}
</style>
</head>
<body style="background: #f8f9fa">
	<div class="container-fluid"
		style="margin: auto auto;height: 100%;position: absolute;top: 0px;bottom: 0px;left: 0px;right: 0px;">


		<div class="tab-content">
			<div id="userData" class="tab-pane fade active in"
				style="border-top: 1px solid #337AB7;padding-bottom:5px;">
				<div class="container-fluid">
					<div class="row" style="padding-top: 10px;">
						<form role="form" class="form-horizontal">
							<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12"
								style="padding:0px;margin-top:30px;">

								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">姓名：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input value="${user.getUsername()}" type="text" readonly="readonly"
											class="form-control disabled">
									</div>
								</div>

								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">性别：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input value="${user.getSex()}" type="text" readonly="readonly"
											class="form-control disabled">
									</div>
								</div>


								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">身份证号码：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input id="IDNumber" value="${user.getIdnumber()}"
											onkeyup="keypressWeiXin(event,this)" type="text"
											class="form-control disabled" readonly="readonly">
									</div>
								</div>
								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">手机号码：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input id="LoginName" value=" ${user.getPhonenumber()}" type="text"
											class="form-control disabled" readonly="readonly"
											onkeyup="keypressPhone(event,this)"
											onbeforepaste="clipboardData.setData('text', clipboardData.getData('text').replace(/[^\d]/g, ''))"
											maxlength="11" />
									</div>
								</div>
								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">所属部门：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input value=" ${user.getInstitutionalorganizationname()}" type="text"
											class="form-control disabled" readonly="readonly">
									</div>
								</div>
								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">入职时间：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input id="RuZhiShiJian" value="${Time}" type="text"
											class="form-control disabled" readonly="readonly">
									</div>
								</div>
								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">状态：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input value="${user.getStatusname()}" type="text"
											class="form-control " readonly="readonly" />
									</div>
								</div>
								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">住址：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input value=" ${user.getAddress()}" type="text" class="form-control "
											readonly="readonly" />
									</div>
								</div>

								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
									style="padding: 0px;margin-left: 0px;">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">余额：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input id="YuE" value=" ${user.getRemainingsum()}元" type="text"
											class="form-control disabled" readonly="readonly" />
									</div>
								</div>


								<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12 "
									style="padding: 0px;margin-left: 0px;" id="Car">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
									<label for="firstname"
										class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">是否有车：</label>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<input id="haveCar" type="text" class="form-control "
											readonly="readonly" />
									</div>
								</div>


							</div>
							<div style="margin-top: 30px;"
								class="col-lg-2 col-md-2 col-sm-2 col-xs-12 text-center">
								<ul style="list-style:none;padding:0px;">
									<li style="list-style:none;padding:0px;"><span
										class="text-primary center-block">照片</span>
									</li>
									<li style="list-style:none;padding:0px;"><img src="" id="Picture"
										style="height: 125px;width:110px;border:1px solid #337AB7;margin:0px auto;"
										alt="照片" title="照片" onclick="showImg(this.id)" />
									</li>

								</ul>
							</div>

							<div style="margin-top: 50px;"
								class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-sm-lg-10  text-center">
								<button type="button" style="min-width:150px;" class="btn btn-info"
									onclick="ShowBankCard()" id="TiXian">提现</button>
								<button type="button" style="min-width:150px;" class="btn btn-success"
									onclick="UpdateGeRenZiLiao()" id="GeRenUpdate">修 改</button>
							</div>
						</form>
					</div>
				</div>
			</div>


		</div>

	</div>


	<div class="modal fade" id="modalone">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="QingKongTiXian()">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Title">提取步骤：</h4>
				</div>
				<div class="modal-body" style="height: 180px">

					<div class="col-lg-4 col-sm-4 col-md-4  radio" id="YinHangKa">
						<c:forEach items="${banklist}" var="YinHanglist">

							<span><input type="radio" style="display:block"
								id="${YinHanglist.getBankcardinformationid()}" name="YinHangKa"
								value="false" onclick="CheckBox(this.id)" /><a style="display:block">${YinHanglist.getBankcardnumber()}</a>
							</span>

						</c:forEach>
						<span><input style="display:block" type="radio" id="TianJia"
							name="YinHangKa" value="false" onclick="CheckBox(this.id)" /><a
							style="display:block">添加银行卡</a> </span>

					</div>
					<div id="TiQuXianJin">

						<form class="form-horizontal" id="TiQuJinEFrom">
							<div class="col-lg-10 col-sm-10 col-md-10 form-group ">
								<label class="control-label col-lg-4 col-sm-4 col-md-4"
									style="margin-left: 0px;padding-left: 0px">请输入提取的金额:</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input id="JinE" type="text" class="form-control " name="JinE"
										maxlength="7"
										onkeyup="this.value=this.value.replace(/\D/g,'');JinEChange()"
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										placeholder="最多可以提取${user.getRemainingsum()}元" ; />
								</div>


							</div>
							<div class="col-lg-10 col-sm-10 col-md-10 form-group">
								<label class="control-label col-lg-4 col-sm-4 col-md-4"
									style="margin-left: 0px;padding-left: 0px; ">请输入您的支付密码:</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input id="PayPassword" type="password" class="form-control "
										name="PayPassword" maxlength="20">
								</div>


							</div>

						</form>
					</div>

					<div id="TianJiaYinHangKa">

						<form class="form-horizontal" onsubmit="return false" id="FromYinHangKa">
							<div class="col-lg-12 col-sm-12 col-md-12 form-group">
								<label class="control-label col-lg-4 col-sm-4 col-md-4"
									style="margin-left: 0px;padding-left: 0px">请输入银行卡号:</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input id="BankCardNumber" type="text" class="form-control "
										name="BankCardNumber" maxlength="20"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'');"
										onchange="CheckBankCardNumber(this.id,value)">
								</div>


							</div>

							<div class="col-lg-12 col-sm-12 col-md-12 form-group">
								<label class="control-label col-lg-4 col-sm-4 col-md-4"
									style="margin-left: 0px;padding-left: 0px">请输入银行预留手机号码:</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input id="ShouJiNumber" type="text" class="form-control "
										name="ShouJiNumber" maxlength="11"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										onchange="YanZheng(this.id,value)" />
								</div>


							</div>

							<div class="col-lg-12 col-sm-12 col-md-12 form-group">
								<label class="control-label col-lg-4 col-sm-4 col-md-4"
									style="margin-left: 0px;padding-left: 0px">手机验证码:</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input id="YanZhengMa" type="text" class="form-control "
										name="YanZhengMa" maxlength="7"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')">

								</div>
								<div class="col-lg-2 col-sm-2 col-md-2">

									<button class="btn btn-info HQ" onclick="HuoQuYanZhengMa()">获取验证码</button>
								</div>

							</div>
						</form>
					</div>



				</div>
				<div class="modal-footer">


					<p style="display: inline-block;"></p>
					<button class="btn btn-info" onclick="JieChu()" id="remove">解除绑定</button>
					<button class="btn btn-info" onclick="ShangYiBu()" id="ShangYiBu">上一步</button>
					<button class="btn btn-info" onclick="XiaYiBu()">下一步</button>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="personal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">个人资料修改：</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" onsubmit="return false" id="UpdatePersonal">
						<div class="form-group">
							<div class="col-lg-11 col-sm-11 col-sm-11">
								<label class="control-label col-lg-4 col-sm-4 col-md-4">手机号码：</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input class="form-control" type="text" id="NewPhoneNumber"
										name="NewPhoneNumber" maxlength="11" value="${user.getPhonenumber()}"
										onkeyup="this.value=this.value.replace(/\D/g,'');UpdatePhoneNumner()"
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										onchange="YanZheng(this.id,value)" />

								</div>
							</div>
						</div>
						<div class="form-group" id="YinCang">
							<div class="col-lg-11 col-sm-11 col-sm-11">
								<label class="control-label col-lg-3 col-sm-3 col-md-3">验证码：</label>
								<div class="col-lg-4 col-sm-4 col-md-4 " style="padding-left: 0">
									<input class="form-control" type="text" id="NewCode" name="NewCode"
										maxlength="7" onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')" />

								</div>
								<div class="col-lg-1 col-sm-1 col-md-1">
									<button class="btn btn-info HQ" onclick="HuoQuDongTaiMa()">获取验证码</button>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-11 col-sm-11 col-sm-11">
								<label class="control-label col-lg-4 col-sm-4 col-md-4">住址：</label>
								<div class="col-lg-6 col-sm-6 col-md-6">
									<input class="form-control" type="text" id="adress" name="adress"
										maxlength="100" value="${user.getAddress()}" />

								</div>
							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<p style="display: inline-block;"></p>

					<button class="btn btn-info" onclick="Updatepersonal()">确定</button>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var picture = '${user.getPhoto()}';
		var YinHangKaID;
		var QuFen = 0;
		var Miao = 120;
		var int;
		var JinE = '${user.getRemainingsum()}';
		var allow = 0;
		var admit = 0;
		var PanDuan = false;
		$(function() {

			if ('${user.getInstitutionalorganizationid()}' == 3) {
				if ('${user.getIshavecar()}' == "true") {
					$("#CarXinXi").show();
					$("#Car").show();
					$("#CarData").show();
				}

			} else {
				$("#CarXinXi").hide();
				$("#Car").hide();

			}

			$("#YinHangKa").show();
			$("#TiQuXianJin").hide();
			$("#TianJiaYinHangKa").hide();
			$("#ShangYiBu").hide();
			$("#YinCang").hide();

			$("#Picture").attr2(
					'src',
					'${ctx}/PersonalDataController/getUserPicture.do?strfile='
							+ picture);

			$("#haveCar").val('${user.getIshavecar()}' == "true" ? "有" : "无");

		});

		function ShowBankCard() {
			$("#modalone").modal("toggle");
		}

		function CheckBox(ID) {
			YinHangKaID = ID;
		}

		function XiaYiBu() {
			if (YinHangKaID != undefined) {
				$("#remove").hide();
				if (QuFen == 0) {
					if (YinHangKaID > 0) {
						YinHangKaID = parseInt(YinHangKaID);
					}
					if ((typeof YinHangKaID) == "string") {
						$("#YinHangKa").hide();
						$("#TianJiaYinHangKa").show();
						$("#ShangYiBu").show();
						$("#TiQuXianJin").hide();

						QuFen = 1;
					} else {

						$("#YinHangKa").hide();
						$("#ShangYiBu").show();
						$("#TianJiaYinHangKa").hide();
						$("#TiQuXianJin").show();
						QuFen = 2;
					}

				} else {
					if (QuFen == 1) {
						if (PanDuan == true) {

							var YanZhengMa = $("#YanZhengMa").val();
							if (YanZhengMa != "") {
								var FromYinHangKa = $("#FromYinHangKa")
										.serializeArray();
								$
										.post(
												"${ctx}/PersonalDataController/insertBankCard.do",
												FromYinHangKa,
												function(data) {
													if ((typeof data) == "string") {
														data = JSON.parse(data);
													}
													if (data.state == true) {
														layer
																.alert(
																		data.msg,
																		{
																			icon : 1,
																			offset : '100px',
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
														layer.alert(data.msg, {
															icon : 0,
															title : "提示",
															offset : '100px'
														});
													}
												});

							} else {
								layer.alert("请输入验证码", {
									icon : 0,
									title : "提示",
									offset : '100px'
								});
							}
						} else {
							layer.alert("请输入正确的银行卡号码！！", {
								icon : 0,
								title : "提示",
								offset : '100px'
							});
						}
					} else {

						var TiQuJinEFrom = $("#TiQuJinEFrom").serializeArray();
						$.post("${ctx}/PersonalDataController/application.do",
								TiQuJinEFrom, function(data) {
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
											title : "提示",
											offset : '100px',
										});
									}
								});

					}
				}
			} else {
				layer.alert("请选择！！", {
					icon : 0,
					title : "提示",
					offset : '100px',
				});
			}
		}

		function ShangYiBu() {

			if (QuFen == 1) {
				$("#YinHangKa").show();
				$("#TianJiaYinHangKa").hide();
				$("#ShangYiBu").hide();
				$("#TiQuXianJin").hide();

				QuFen = 0;
			} else {

				if (QuFen == 1) {

					$("#YinHangKa").hide();
					$("#TianJiaYinHangKa").show();
					$("#ShangYiBu").show();
					$("#TiQuXianJin").hide();

					QuFen = 1;
				} else {

					$("#YinHangKa").show();
					$("#TiQuXianJin").hide();
					$("#TianJiaYinHangKa").hide();
					$("#ShangYiBu").hide();
					QuFen = 0;
				}
			}
			if (QuFen == 0) {
				$("#remove").show();
			}
		}

		function HuoQuYanZhengMa() {
			var BankCardNumber = $("#BankCardNumber").val();
			if (BankCardNumber != "") {

				var ShouJiNumber = $("#ShouJiNumber").val();
				FaSong(ShouJiNumber);
			} else {
				layer.alert("请输入您的银行卡账号", {
					icon : 0,
					title : "提示",
					offset : '100px',
				});
			}
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

		function JieChu() {
			if (YinHangKaID > 0) {

				if (layer.confirm("是否解除？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);

					$.post(
							"${ctx}/PersonalDataController/deleteBankCard.do?YinHangKaID="
									+ YinHangKaID, function(data) {
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
										title : "提示",
										offset : '100px',
									});
								}
							});

				}))
					;

			} else {

				layer.alert("请选择银行卡!!", {
					icon : 0,
					title : "提示",
					offset : '100px',
				});
			}
		}

		function JinEChange() {
			var money = $("#JinE").val();
			if (money > parseFloat(JinE)) {
				$("#JinE").val("");
			}
		}

		function QingKongTiXian() {
			QuFen = 0;
			$("#JinE").val("");
			$("#PayPassword").val("");
			$("#BankCardNumber").val("");
			$("#ShouJiNumber").val("");
			$("#YanZhengMa").val("");
			$("#YinHangKa").show();
			$("#TiQuXianJin").hide();
			$("#TianJiaYinHangKa").hide();
			$("#ShangYiBu").hide();
		}

		function HuoQuDongTaiMa() {

			var NewPhoneNumber = $("#NewPhoneNumber").val();

			if (NewPhoneNumber != ""
					&& NewPhoneNumber != '${user.getPhonenumber()}') {
				FaSong(NewPhoneNumber);
			} else {
				layer.msg("请输入您的手机号码", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});

			}

		}

		function UpdatePhoneNumner() {
			if ($("#NewPhoneNumber").val() == '${user.getPhonenumber()}') {
				$("#YinCang").hide();
			} else {
				$("#YinCang").show();
			}

		}

		function UpdateGeRenZiLiao() {
			$("#YinCang").hide();
			$("#personal").modal("toggle");
			$("#NewPhoneNumber").val('${user.getPhonenumber()}');
			$("#adress").val('${user.getAddress()}');
		}

		function UpdateMiMa() {

			$("#MiMaXiuGai1").show();
			$(".DuanXinXiuGai1").hide();
			$("#YanZhengCode1").hide();

			if (allow == 1) {
				$("#DuanXin1").show();
			}

			$("#MiMa1").hide();
		}

		function Updatepersonal() {

			if ($("#NewPhoneNumber").val() == '${user.getPhonenumber()}') {

				$("#NewCode").val("");

			}
			var UpdatePayFrom = $("#UpdatePersonal").serializeArray();

			$
					.post(
							"${ctx}/PersonalDataController/updatePersonal.do",
							UpdatePayFrom,
							function(data) {

								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}
								if (data.state == true) {

									layer
											.alert(
													data.msg,
													{
														icon : 1,
														title : "提示",
														offset : '100px'
													},
													function(layerIndex) {
														layer.close(layerIndex);

														window.parent.location.href = "${ctx}/Jsp/Login.jsp";
													});
								} else {
									layer.alert(data.msg, {
										icon : 0,
										title : "提示",
										offset : '100px'
									});

								}

							});

		}
		function YanZheng(ID, value) {

			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(value)) {
				$("#" + ID).val("");
			}

		}
		function CheckBankCardNumber(ID, value) {

			if (value.length > 15) {
				$
						.post(
								"https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo="
										+ value + "&cardBinCheck=true",
								function(data) {
									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									if (data.validated == false) {
										PanDuan = false;
										layer.alert("请输入正确的银行卡号码！！", {
											icon : 0,
											title : "提示："
										});
									} else {
										PanDuan = true;
									}

								});
			} else {

				PanDuan = false;
				layer.alert("请输入正确的银行卡号码！！", {
					icon : 0,
					title : "提示："
				});
			}
		}

		function showImg(ID) {
			$(".layui-layer-close2").click();
			var url = $("#" + ID).prop("src");
			//alert(url);
			var img_infor = '<form data-ajax="false" enctype="multipart/form-data" action="${ctx}/PersonalDataController/uploadPersonalPicture.do"  id="personalform" method="post"  > <img src="' + url + '"  id="personalPicture"  style="height: 330px;width:500px;" /><a  class="file" >请选择图片<input name="picture" id="personalchoose" type="file" onchange="loadImg(this.id)" /></a> <a  class="file"onclick="upload()" >确定</a> </form> ';
			layer.open({
				type : 1,
				closeBtn : 1,
				offset : '10px',
				shade : false,
				title : false, //不显示标题
				//skin: 'layui-layer-nobg', //没有背景色
				shadeClose : false,
				area : [ '505px', '370px' ],
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

		}//读取图片
		function loadImg(ID) {
			//获取文件

			file = $("#" + ID)[0].files[0];

			//$("#FileName" + Count).val(file.name);
			//创建读取文件的对象
			var reader = new FileReader();

			//创建文件读取相关的变量
			var imgFile;
			//正式读取文件
			reader.readAsDataURL(file);
			//为文件读取成功设置事件
			reader.onload = function(e) {
				imgFile = e.target.result;
				$("#personalPicture").attr("src", imgFile);
			}
		}

		function upload() {
			$("#personalform").attr("action",
					"${ctx}/PersonalDataController/uploadPersonalPicture.do");

			$("#personalform").ajaxSubmit(function(data) {

				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {
					layer.closeAll('loading');
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
						title : "提示",
						offset : '100px'
					});
				}
			});

		}
	</script>
</body>
</html>
