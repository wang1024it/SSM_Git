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

<title>车辆信息</title>

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


	<div class="container-fluid">
		<div class="row" style="padding-top: 10px;">
			<form role="form" class="form-horizontal">
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12"
					style="padding:0px;margin-top:30px;">

					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
						style="padding: 0px;margin-left: 0px;">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
						<label for="firstname"
							class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">车牌号：</label>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<input value="${car.getPlatenumber()}" type="text"  readonly="readonly"
								class="form-control disabled">
						</div>
					</div>

					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
						style="padding: 0px;margin-left: 0px;">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
						<label for="firstname"
							class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">车辆类型：</label>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<input value="${car.getCartypename()}" type="text" readonly="readonly"
								class="form-control disabled">
						</div>
					</div>


					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
						style="padding: 0px;margin-left: 0px;">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
						<label for="firstname"
							class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">最大载重：</label>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<input value="${car.getMaxload()}" onkeyup="keypressWeiXin(event,this)"
								type="text" class="form-control disabled" readonly="readonly">
						</div>
					</div>

					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
						style="padding: 0px;margin-left: 0px;">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
						<label for="firstname"
							class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">车厢规格：</label>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<input value="${car.getCarriagespecification()}" type="text"
								class="form-control disabled" readonly="readonly">
						</div>
					</div>
					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12"
						style="padding: 0px;margin-left: 0px;">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
						<label for="firstname"
							class="col-lg-3 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-0 col-sm-offset-0 control-label text-right text-primary">私家车：</label>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<input id="SiJia" type="text" class="form-control disabled"
								readonly="readonly">
						</div>
					</div>

					<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div style="margin-top: 50px; margin-left:  -300px;"
							class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
							<ul style="list-style:none;padding:0px;">
								<li style="list-style:none;padding:0px;"><span
									style="margin-right: -30px" class="text-primary center-block">驾驶证照片</span>
								</li>
								<li style="list-style:none;padding:0px;"><img src="" id="JSPicture"
									style="height: 125px;width:110px;border:1px solid #337AB7;margin:0px auto;"
									alt="照片" title="照片" onclick="showImg(this.id)" />
								</li>

							</ul>
						</div>


						<div style="margin-top: 50px; margin-left:  0px;"
							class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
							<ul style="list-style:none;padding:0px;">
								<li style="list-style:none;padding:0px;"><span
									style="margin-right: -30px" class="text-primary center-block">人车合照</span>
								</li>
								<li style="list-style:none;padding:0px;"><img src="" id="RCPicture"
									style="height: 125px;width:110px;border:1px solid #337AB7;margin:0px auto;"
									alt="照片" title="照片" onclick="showImg(this.id)" />
								</li>

							</ul>
						</div>


						<div style="margin-top: 50px;  margin-left:  270px;"
							class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
							<ul style="list-style:none;padding:0px;">
								<li style="list-style:none;padding:0px;"><span
									style="margin-right: -30px" class="text-primary center-block">行驶证照片</span>
								</li>
								<li style="list-style:none;padding:0px;"><img src="" id="XSPicture"
									style="height: 125px;width:110px;border:1px solid #337AB7;margin:0px auto;"
									alt="照片" title="照片" onclick="showImg(this.id)" />
								</li>

							</ul>
						</div>
					</div>


				</div>



			</form>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var XSpicture = '${car.getCardrivinglicensephoto()}';
		var JSpicture = '${user.getDrivinglicencephoto()}';
		var RCpicture = '${user.getMancarphoto()}';
		$(function() {
			$("#SiJia").val('${car.getIsprivate()}' == "true" ? "是" : "否");
			$("#JSPicture").attr2(
					'src',
					'${ctx}/PersonalDataController/getUserPicture.do?strfile='
							+ JSpicture);
			$("#RCPicture").attr2(
					'src',
					'${ctx}/PersonalDataController/getUserPicture.do?strfile='
							+ RCpicture);

			$("#XSPicture").attr2(
					'src',
					'${ctx}/PersonalDataController/getUserPicture.do?strfile='
							+ XSpicture);
		});
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
				area : [ '500px', '340px' ],
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

		}
	</script>
</body>
</html>
