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

<title>企业中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${ctx }/Content/css/Memberpublic.css" rel="stylesheet" />


<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx }/Content/css/memberlogin.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx }/Content/css/wangdian.css" type="text/css"></link>
<link href="${ctx }/Content/css/WTMap.css" rel="stylesheet" />
<style>
table tr td {
	text-align: center;
	width: 200px
}

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
	filter: alpha(opacity =                                               0);
	cursor: pointer;
}

* {
	font-family: "华文中宋";
}
</style>
</head>

<body>

	<!--头部信息开始-->
	<div class="top">
		<div class="top_dengLu">
			<div class="fl topLeft">
				<p id="dengLu"></p>
			</div>

			<ul class="fr topRight">
				<li class="top_list1 sel"><a target="_blank"
					href="${ctx }/ClientController/selectInformation.do" class="tubiao">物流信息</a>
				</li>
				<li class="top_list6 sel" style="padding-left:20px;"><a target="_blank"
					href="${ctx }/ClientController/myOrder.do">我的订单</a>
				</li>
				<li class="top_list2 sel"><a target="_blank"
					href="${ctx }/ClientController/personalCenter.do" class="tubiao">个人中心</a>
				</li>
				<li class="top_list2 sel"><a target="_blank"
					href="${ctx }/FrontJsp/HomePage.jsp" class="tubiao">返回首页</a>
				</li>

			</ul>

		</div>
	</div>
	<form onsubmit="return false" enctype="multipart/form-data" method="post"
		id="formdata">
		<div class="container-fluid">
			<div>
				<label style="margin-left: -20%">(Tip: </label><label style="color: red">*</label><label
					style="font-size: 2px;">点击修改按钮，双击内容可以修改)</label>
			</div>
			<table class="table table-bordered"
				style="border: 2px solid #ccddf5;height:500px;">
				<tr style="border: 2px solid #ccddf5;">
					<td style="vertical-align:middle" colspan='5'>企业信息</td>
					<td style="vertical-align:middle;width: 400px" colspan='3' rowspan="6">
						<div class="upload-file"
							style="margin:0 auto; height: 230px;width: 340px; ">
							<img id="image1" height="200px;" width="300px" /> <input type="file"
								class="addBorder" onchange="loadImg(1)" id="picture1" name="picture"
								accept="image/*" /> <input class="hidden" id="fileName" /> <span
								class="tip">点击上传营业执照</span>
						</div> <!-- 						<div class="upload-file" style="height: 230px;width: 340px;float: right"> -->
						<!-- 							<img id="image2" height="200px;" width="300px" /> <input type="file" -->
						<!-- 								class="addBorder" onchange="loadImg(2)" id="picture2" name="picture" -->
						<!-- 								accept="image/*" /> <span class="tip">点击上传身份证反面图片</span> -->
						<!-- 						</div></td> -->
				</tr>
				<tr style="border: 2px solid #ccddf5;" align='center'>
					<td style="vertical-align:middle"><label style="color: red">*</label>公司名称：</td>
					<td style="vertical-align:middle" id="customname"
						ondblclick="update(this.id)">${custom.getCustomname() }</td>
					<td style="vertical-align:middle"><label style="color: red">*</label>营业号：</td>
					<td style="vertical-align:middle" colspan='2' id="businesslicensenumber"
						ondblclick="update(this.id)">${custom.getBusinesslicensenumber() }</td>



				</tr>
				<tr style="border: 2px solid #ccddf5;">
					<td style="vertical-align:middle"><label style="color: red">*</label>法人名称：</td>
					<td style="vertical-align:middle" id="corporaterepresentative"
						ondblclick="update(this.id)">${custom.getCorporaterepresentative() }</td>
					<td style="vertical-align:middle"><label style="color: red">*</label>公司地址：</td>
					<td style="vertical-align:middle" colspan='2' id="companyadress"
						ondblclick="update(this.id)">${ custom.getCompanyadress() }</td>



				</tr>
				<tr style="border: 2px solid #ccddf5;">
					<td style="vertical-align:middle">客户类型:</td>
					<td style="vertical-align:middle" colspan='4'>${custom.getCustomername()}</td>



				</tr>
				<tr style="border: 2px solid #ccddf5;">
					<td style="vertical-align:middle" colspan='5'>联系信息</td>


				</tr>

				<tr style="border: 2px solid #ccddf5;">
					<td style="vertical-align:middle"><label style="color: red">*</label>QQ:</td>
					<td style="vertical-align:middle" id="qq" ondblclick="update(this.id)">${custom.getQq()}</td>
					<td style="vertical-align:middle"><label style="color: red">*</label>邮箱：</td>
					<td style="vertical-align:middle" colspan='2' id="mailbox"
						ondblclick="update(this.id)">${custom.getMailbox() }</td>



				</tr>
				<tr style="border: 2px solid #ccddf5;">
					<td style="vertical-align:middle"><label style="color: red">*</label>手机号码:</td>
					<td style="vertical-align:middle" id="customphonenumber"
						ondblclick="update(this.id)">${custom.getCustomphonenumber() }</td>
					<td style="vertical-align:middle"><label style="color: red">*</label>电话号码:</td>
					<td style="vertical-align:middle" id="customphonenumber"
						ondblclick="update(this.id)">${custom.getTelephonenumber() }</td>
					<td style="vertical-align:middle" colspan='4'><label
						style="color: red">*</label>营业执照</td>

				</tr>
				<tr>
					<td style="vertical-align:middle" colspan='3' id="add"><button
							class=" btn" id="updatebtn" onclick="updateclick()">修改</button></td>
					<td style="vertical-align:middle" colspan='3'><button class=" btn"
							onclick="updatepassword()" style="cursor: pointer;">修改密码</button></td>
				</tr>

			</table>




			<div id="aggregate">
				<input type="text" id="sex2" maxlength="20" name="companyadress"
					value="${custom.getCompanyadress()}" readonly="readonly" class="hidden" />
				<input type="text" id="corporaterepresentative2" maxlength="20"
					name="corporaterepresentative"
					value="${custom.getCorporaterepresentative() } " readonly="readonly"
					class="hidden" /><input type="text" id="businesslicensenumber2"
					maxlength="20" name="businesslicensenumber"
					value="${custom.getBusinesslicensenumber() }" readonly="readonly"
					class="hidden" /> <input type="text" id="customname2" maxlength="20"
					name="customname" value="${custom.getCustomname() }" readonly="readonly"
					class="hidden" /> <input type="text" id="qq2" maxlength="20" name="qq"
					value="${custom.getQq()
						}" readonly="readonly" class="hidden" /> <input
					type="text" id="mailbox2" maxlength="20" name="mailbox"
					value="${custom.getMailbox() }" readonly="readonly" class="hidden" /> <input
					type="text" id="customphonenumber2" maxlength="20" name="customphonenumber"
					value="${custom.getCustomphonenumber() }" readonly="readonly"
					class="hidden" /> <input value="${custom.getCustomid() }" name="customid"
					readonly="readonly" class="hidden" /> <input
					value="${custom.getTelephonenumber() }" name="telephonenumber"
					readonly="readonly" class="hidden" />
			</div>
		</div>
	</form>
	<div class="modal fade" id="modalone">
		<form class="form-horizontal" onsubmit="return false" id="UpdateFromPassword"
			action="${ctx}/ClientController/updatePassword.do" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">修改密码：</h4>
					</div>
					<div class="modal-body" style="height: 150px">


						<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">当前密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<input type="password" class="form-control " id="originalpassword"
									name="originalpassword" maxlength="20">
							</div>
						</div>

						<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">新密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<input type="password" class="form-control " id="newpassword"
									name="newpassword" maxlength="20">
							</div>
						</div>
						<div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-12"
							style="padding: 0px;margin-left: 0px;">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
							<label for="firstname"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">确认新密码：</label>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<input type="password" class="form-control " id="confirmpassword"
									name="confirmpassword" maxlength="20">
							</div>
						</div>



					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="UpdateLoginPassword()">确定</button>
						<button class="btn btn-info" onclick="GuanBi()">取消</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="cl"></div>
	<div class="foot_login">
		<a href="${ctx }/Jsp/AboutUs.jsp" target="_blank">关于我们</a> | <a href="${ctx }"
			title="挑错有礼" target="_blank"><font>挑错有礼</font> </a> | <a
			href="http://www.chinawutong.com/foot/zhaopin.html" title="招聘英才"
			target="_blank">诚聘英才</a> | <a
			href="http://www.chinawutong.com/about/fuwuyuchanpin.html" target="_blank">服务与产品</a>
		| <a href="http://help.chinawutong.com/" target="_blank">使用与帮助</a> | <a
			href="http://www.chinawutong.com/about/wtsmfwtk.html" target="_blank">服务条款</a>
		| <a href="${ctx }/Jsp/Join.jsp" target="_blank">加盟我们</a> | <a
			href="http://www.chinawutong.com/about/wtsmfkfs.html" target="_blank">付款方式</a>
		| <a href="http://www.chinawutong.com/about/link.html" target="_blank">友情链接</a>
		| <a href="http://www.chinawutong.com/about/kefuzhongxin.html" target="_blank">客服中心</a>
		| <a href="${ctx }/Jsp/ContactUs.jsp" target="_blank">联系我们</a>
	</div>
	<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var CustomName = '${sessionScope.custom.getCustomname()}';
		var picture = '${custom.getBusinesslicense() }';
		var str;
		var OriginalText;
		$(function() {
			$("#picture1").attr("disabled", "disabled");
			if (CustomName == null || CustomName == "") {
				window.location.href = "${ctx}/Jsp/CustomLogin.jsp";
			} else {
				$("#dengLu")
						.append(
								' <a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span ><a class="denLu  ">'
										+ CustomName
										+ ',您好!</a> &nbsp;&nbsp; <a href="javascript:void(0);" class="zhuCe  " onclick="cancellation()">注销</a></span>');
			}
			$("#image1").attr("src",
					"${ctx}/LoginController/getPicture.do?fileName=" + picture);
			$("#fileName").val(picture);

		});
		function updateclick() {
			$("#add")
					.append(
							'<button class=" btn" id="saveid" onclick="save()">保存</button> <button class=" btn" id="abolishid" onclick="abolish()" >取消</button>');
			$("#picture1").removeAttr("disabled");
			$("#updatebtn").remove();
			str = "保存";

		}
		function update(ID) {

			if (str == "保存") {
				OriginalText = $("#" + ID).text();

				$("#" + ID).text('');
				if (ID != "sex" && ID != "customidnumber") {

					$("#" + ID)
							.append(
									'<input type="text" id="'
											+ ID
											+ 1
											+ '"onmousemove="success(this.id)" maxlength="20"   />')
				} else if (ID == "sex") {
					$("#" + ID)
							.append(
									'<select class="form-control" id="'
											+ ID
											+ 1
											+ '" onchange="change(this.id,value)"><option>--请选择--</option><option>男</option><option>女</option></select>');

				} else if (ID == "customidnumber") {
					$("#" + ID)
							.append(
									'<input type="text" id="'
											+ ID
											+ 1
											+ '"  onmousemove="success(this.id)"maxlength="18"   placeholder="请输入身份证号码"   />');

				}
				$("#" + ID + 1).focus();
			}

		}

		function change(ID, value) {
			if (str == "保存") {
				if (value != "--请选择--") {

					$("#" + ID.split("1")[0]).text(value);

					$("#aggregate").append(
							'<input type="text" id="' + ID.split("1")[0] + 2
									+ '" maxlength="20" name="'
									+ ID.split("1")[0] + '"   />');
					$("#" + ID.split("1")[0] + 2).val(value);
				} else {
					$("#" + ID.split("1")[0]).text(OriginalText);
				}
			}
		}

		function success(ID) {
			if (str == "保存") {
				if ($("#" + ID).val() != null && $("#" + ID).val() != '') {
					$("#" + ID.split("1")[0]).text($("#" + ID).val());

					$("#" + ID.split("1")[0] + 2).val(
							$("#" + ID.split("1")[0]).text());

				} else {
					$("#" + ID.split("1")[0]).text(OriginalText);
				}

			}
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

			$("#fileName").val(file.name);
		}

		function abolish() {
			$("#picture1").attr("disabled", "disabled");
			$("#add")
					.append(
							'<button class=" btn" id="updatebtn" onclick="updateclick()">修改</button>');
			$("#saveid").remove();
			$("#abolishid").remove();
			str = "修改";

		};

		function save() {
			layer
					.alert(
							"是否保存？？",
							{
								icon : 0,
								title : "提示：",
								btn : [ "确定", "取消" ]
							},
							function(index) {
								layer.close(index);
								layer.load();
								if ($("#fileName").val() != null
										&& $("#fileName").val() != "") {
									$("#formdata")
											.attr("action",
													"${ctx}/ClientController/updateCompany.do");
									$("#formdata").ajaxSubmit(function(data) {

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
											layer.closeAll('loading');
											layer.alert(data.msg, {
												icon : 0,
												title : "提示",
												offset : '30px'
											});

										}
									});
								} else {
									layer.alert("请选择身份证照片!!", {
										icon : 0,
										title : "提示："
									});
								}

							})
		}

		function cancellation() {
			layer.alert("是否退出？？？？？", {
				icon : 0,
				title : "提示：",
				btn : [ "确定", "取消" ]
			}, function(index) {
				layer.close(index);

				$.post("${ctx}/ClientController/cancellation.do",
						function(data) {
							if (data == "true") {
								location.reload();
							}
						});
			});

		}
		function updatepassword() {

			$("#modalone").modal("toggle");
		}
		function GuanBi() {
			$("#modalone").modal("toggle");
		}

		function UpdateLoginPassword() {
			$("#UpdateFromPassword").attr("action",
					"${ctx}/ClientController/updatePassword.do");
			$("#UpdateFromPassword")
					.ajaxSubmit(
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
														btn : [ "确定" ]
													},
													function(index) {
														layer.close(index);
														window.location.href = "${ctx}/FrontJsp/CustomLogin.jsp";
													});

								} else {
									layer.alert(data.msg, {
										icon : 0,
										title : "提示",
										offset : '30px'
									});
								}

							});
		}
	</script>
</body>
</html>
