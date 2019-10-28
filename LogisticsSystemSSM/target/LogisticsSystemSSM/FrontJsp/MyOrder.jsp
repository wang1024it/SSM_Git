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

<title>我的订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${ctx }/Content/css/Memberpublic.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx }/Content/css/pub_sty.css" type="text/css"></link>


<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/memberlogin.css"
	type="text/css"></link>


<link rel="stylesheet" href="${ctx }/Content/css/wangdian.css" type="text/css"></link>
<link href="${ctx }/Content/css/WTMap.css" rel="stylesheet" />
<!-- <script type="text/javascript" -->
<!-- 	src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script> -->
<style type="text/css">
.logisticsLine .Sup1 {
	width: 140px;
	text-align: center;
}

.logisticsLine .Sup2 {
	width: 200px;
	text-align: center;
}

.logisticsLine .Sup3 {
	width: 170px;
	text-align: center;
}

.logisticsLine .Sup4 {
	width: 120px;
	text-align: center;
}

.logisticsLine .Sup5 {
	width: 120px;
	text-align: center;
}

.logisticsLine .Sup6 {
	width: 140px;
	text-align: center;
}

.logisticsLine .Sup7 {
	width: 160px;
	text-align: center;
}

.logisticsLine .Sup8 {
	width: 150px;
	text-align: center;
}

.logisticsLine .Sup9 {
	width: 150px;
	text-align: center;
}

.logisticsLine .SupplyInfor_th {
	padding: 0px 10px;
	height: 35px;
	line-height: 35px;
	background: #eaeaea;
	color: #666666;
	border-top: 1px solid #bfc6cd;
	font-size: 14px;
}

.logisticsLine {
	padding: 10px;
	overflow: hidden;
	background: #fff;
	width: auto;
	margin: 0 auto;
}

.logisticsLine .SupplyInfor_source {
	padding: 0 10px 0 10px;
	height: 80px;
	line-height: 20px;
	border-bottom: 1px #eeeeee dashed;
	font-size: 14px;
}

.logisticsLine .SupList1 {
	width: 140px;
	padding-top: 30px;
	overflow: hidden;
	text-align: center;
}

.logisticsLine .SupList2 {
	width: 200px;
	padding-top: 30px;
	text-align: center;
}

.logisticsLine .SupList3 {
	width: 170px;
	padding-top: 30px;
	overflow: hidden;
	text-align: center;
}

.logisticsLine .SupList4 {
	width: 120px;
	padding-top: 30px;
	text-align: center;
}

.logisticsLine .SupList5 {
	width: 120px;
	padding-top: 30px;
	text-align: center;
}

.logisticsLine .SupList6 {
	width: 140px;
	padding-top: 30px;
	text-align: center;
}

.logisticsLine .SupList7 {
	width: 160px;
	padding-top: 30px;
	text-align: center;
}

.logisticsLine .SupList8 {
	width: 150px;
	padding-top: 30px;
	text-align: center;
}

.logisticsLine .SupList9 {
	margin-left: 32px;
	margin-top: 24px;
	text-align: center;
}

.logisticsLine .SupplyInfor_source li,.SupplyInfor_source li a {
	color: #333;
}

.logisticsLine .SupList9 a {
	background: #098fe8;
	color: #fff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	display: block;
	width: 96px;
	height: 33px;
	line-height: 33px;
	text-align: center;
}

.item-textarea {
	color: #222;
	padding: 0px 10px;
	border: 1px #c4c4c4 solid;
}

.cus_sel_txt_comm {
	width: 300px
}

label {
	float: right;
	height: 34px;
	font-family: '华文中宋';
	color: #6f7b8a;
	font-size: 13.5px;
	line-height: 20px;
	margin-right: -3px;
	text-align: center;
	font-weight: normal;
	border-right: none;
	z-index: 100;
}

*,li,a {
	font-family: "华文中宋";
}
</style>
</head>

<body>
	<form name="aspnetForm" method="post" onsubmit="return false" action=""
		id="aspnetForm" class="form-horizontal">




		<!--头部信息开始-->
		<div class="top">
			<div class="top_dengLu">
				<div class="fl topLeft">
					<p id="dengLu"></p>
				</div>
				<ul class="fr topRight">
					<li class="top_list1 sel"><a
						href="${ctx }/ClientController/selectInformation.do" class="tubiao">物流信息</a>
					</li>
					<li class="top_list6 sel" style="padding-left:20px;"><a
						href="${ctx }/ClientController/myOrder.do">我的订单</a></li>
					<li class="top_list2 sel"><a
						href="${ctx }/ClientController/personalCenter.do" class="tubiao">个人中心</a>
					</li>
					<li class="top_list2 sel"><a href="${ctx }/FrontJsp/HomePage.jsp"
						class="tubiao">返回首页</a></li>

				</ul>
			</div>
		</div>
		<div class="wdBanner"></div>
		<div class="logisticsLine">
			<div class="webList" id="orDer"></div>
			<div class="pageBox">
				<div class="subPagination" id="area_footer">
					<div id="page_num"></div>
				</div>
			</div>
		</div>

		<div id="goodsInfor"
			style="display: none;border: 1px solid #efeef0; margin: 20px ">


			<h4 id="title"></h4>
			<div class="form-group " style="margin: 0px;padding: 0px" id="orderinfo">
				<div class="item-form">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">订单信息</h4>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="margin-top: 20px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-1"></div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">订单号码：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 interval">
									<input class="form-control" name="ordernumber" readonly="readonly"
										maxlength="100" />
								</div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">上传时间：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="uploadtime" readonly="readonly"
										maxlength="100" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-1"></div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">发货时间：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 interval">
									<input class="form-control" name="deliverytime" readonly="readonly"
										maxlength="100" />
								</div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">收货时间：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="receipttime" readonly="readonly"
										maxlength="100" />
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="form-group " style="margin: 0px;padding: 0px" id="custom">
				<div class="item-form">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">客户信息</h4>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="margin-top: 20px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-1"></div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">客户名称：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 interval">
									<input class="form-control" name="customname" readonly="readonly"
										maxlength="100" />
								</div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">联系电话：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="customphonenumber"
										readonly="readonly" maxlength="100" />
								</div>
							</div>



						</div>
					</div>
				</div>
			</div>

			<div class="form-group " style="margin: 0px;padding: 0px">
				<div class="item-form">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">出发地 → 到达地</h4>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">发货地址：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="sendadress" readonly="readonly"
										maxlength="100" />
								</div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">收货地址：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="takeadress" readonly="readonly"
										maxlength="100" />
								</div>
							</div>



						</div>
					</div>
				</div>
			</div>


			<div class="form-group " style="margin: 0px;padding: 0px">
				<div class="itemform_Th"
					style="background-color: #f5f5f5;  height: 43px;line-height: 43px;margin-top: 10px;  ">
					<div
						style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
					<h4 style="color: #666;font-size: 16px; padding-top: 13px">
						货物信息<a href="javascript:void(0);" class="add" style="display: none;">
							<img src="${ctx }/Content/image/123.jpg" width="30px;" height="30px"
							onclick="Add()" /> </a> <a class="add" style="display: none;"
							href="javascript:void(0);"> <img src="${ctx }/Content/image/1234.jpg"
							width="30px;" height="30px" onclick="Reduce()" /> </a><span
							style="color:red">（单位不用填写，如：kg，m³）</span>
					</h4>

					<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
						style="padding-top: 15px">
						<div class="form-group">
							<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
								货物名称：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<input class="form-control" id="goodName_1" readonly="readonly"
									maxlength="20" name="Mrchlist[0].mrchandisename" /> <input
									class="hidden" id="mrchandiseid_1" name="Mrchlist[0].mrchandiseid" />
							</div>


							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物类型：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<select class="form-control" id="goodType_1" disabled="disabled"
									name="Mrchlist[0].mrchandisetypeid">
									<c:forEach items="${MRlist}" var="list">
										<option value="${list.getMrchandisetypeid()}">${list.getMrchandisetypename()}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物重量：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<input class="form-control" id="weight_1" readonly="readonly"
									maxlength="4" name="orderformdetaillist[0].weight"
									onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" /> <input
									class="hidden" id="ordertailid_1"
									name="orderformdetaillist[0].orderformdetailid" />
							</div>
							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物体积：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<input class="form-control" id="volume_1" readonly="readonly"
									maxlength="4" name="orderformdetaillist[0].volume"
									onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
							</div>


						</div>
					</div>
					<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物数量：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<input class="form-control" id="quantity_1" readonly="readonly"
									maxlength="4" name="orderformdetaillist[0].quantity"
									onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />

							</div>
						</div>

					</div>


					<div id="HuoWu2" style="display: none;">
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物名称：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="goodName_2" readonly="readonly"
										maxlength="10" name="Mrchlist[1].mrchandisename" /> <input
										class="hidden" id="mrchandiseid_2" name="Mrchlist[1].mrchandiseid" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物类型：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<select class="form-control" id="goodType_2" disabled="disabled"
										name="Mrchlist[1].mrchandisetypeid">
										<c:forEach items="${MRlist}" var="list">
											<option value="${list.getMrchandisetypeid()}">${list.getMrchandisetypename()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物重量：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="weight_2" readonly="readonly"
										maxlength="4" name="orderformdetaillist[1].weight"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" /><input
										class="hidden" id="ordertailid_2"
										name="orderformdetaillist[1].orderformdetailid" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物体积
									：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="volume_2" readonly="readonly"
										maxlength="4" name="orderformdetaillist[1].volume"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
								</div>
							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物数量：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="quantity_2" readonly="readonly"
										maxlength="4" name="orderformdetaillist[1].quantity"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
								</div>

							</div>
						</div>

					</div>
					<div id="HuoWu3" style="display: none;">
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物名称：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="goodName_3" readonly="readonly"
										maxlength="10" name="Mrchlist[2].mrchandisename" /> <input
										class="hidden" id="mrchandiseid_3" name="Mrchlist[2].mrchandiseid" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物类型：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<select class="form-control" id="goodType_3" disabled="disabled"
										name="Mrchlist[2].mrchandisetypeid">
										<c:forEach items="${MRlist}" var="list">
											<option value="${list.getMrchandisetypeid()}">${list.getMrchandisetypename()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物重量：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="weight_3" readonly="readonly"
										maxlength="4" name="orderformdetaillist[2].weight"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" /><input
										class="hidden" id="ordertailid_3"
										name="orderformdetaillist[2].orderformdetailid" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物体积：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="volume_3" readonly="readonly"
										maxlength="4" name="orderformdetaillist[2].volume"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
								</div>
							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物数量：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="quantity_3" readonly="readonly"
										maxlength="4" name="orderformdetaillist[2].quantity"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" />
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group " style="margin: 0px;padding: 0px">
				<div class="itemform_Th"
					style="background-color: #f5f5f5;height: 43px;line-height: 43px;margin-top: 10px;">
					<div
						style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
					<h4 style="color: #666;font-size: 16px; padding-top: 13px">联系信息</h4>

				</div>
				<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
					style="padding-top: 15px">
					<div class="form-group">
						<div class="col-sm-1 col-lg-1  col-md-1 col-xs-1"></div>

						<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
							寄货人（公司）姓名：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" name="sendname" readonly="readonly"
								maxlength="20" />
						</div>

						<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
							寄货人（公司）电话：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" name="sendphonenumber" readonly="readonly"
								maxlength="11" />


						</div>
					</div>
				</div>
				<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
					style="padding-top: 15px">
					<div class="form-group">
						<div class="col-sm-1 col-lg-1  col-md-1 col-xs-1"></div>

						<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">收货人（公司）姓名：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" name="takename" readonly="readonly"
								maxlength="20" />
						</div>
						<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">收货人（公司）电话：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" name="takephonenumber" readonly="readonly"
								maxlength="11" />
						</div>
					</div>
				</div>
				<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
					style="padding-top: 15px">
					<div class="form-group">
						<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">备注：</label>
						<div class="col-lg-7  col-md-7 col-xs-7 col-sm-7  interval">
							<input class="form-control" name="remark" readonly="readonly"
								maxlength="100" />
						</div>
					</div>
				</div>
			</div>

			<div class="form-group" style="margin: 0px;padding: 0px;">
				<div class="item-form wenti1">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">司机信息</h4>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
									司机名称： </label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="username" name="username"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">手机号码：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="phoneNumber" name="phoneNumber"
										readonly="readonly" />
								</div>

							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">车&ensp;牌
									&ensp;号：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="platenumber" name="platenumber"
										readonly="readonly" />
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="form-group " style="margin: 0px;padding: 0px">
				<div class="item-form">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">运输支付信息</h4>

					</div>
				</div>
				<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
					style="padding-top: 15px">
					<div class="form-group">
						<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">运输方式：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<select class="form-control" id="transportmodeid" name="transportmodeid"
								disabled="disabled">
								<c:forEach items="${Tplllist}" var="list">
									<option value="${list.getTransportmodeid()}">${list.getTransportmodename()}_首重费:${list.getFirstcharge()
										}，续重费:${list.getRenewalfee() }</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">支付方式：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<select class="form-control" id="paymentid" name="paymentid"
								disabled="disabled">
								<c:forEach items="${Pylist}" var="list">
									<option value="${list.getPaymentid()}">${list.getPaymentname()}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group " style="margin: 0px;padding: 0px">
				<div class="item-form ">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">运输费用信息</h4>

					</div>
				</div>
				<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
					style="padding-top: 15px">
					<div class="form-group">
						<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">运输费用：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" id="transportcost" name="transportcost"
								readonly="readonly" />

						</div>
						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">定&emsp;&emsp;金：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" id="bargainmoney" name="bargainmoney"
								readonly="readonly" />
						</div>
					</div>
				</div>
				<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
					style="padding-top: 15px">
					<div class="form-group">
						<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>


						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">交款信息：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" name="paymentInformation"
								id="paymentInformation" readonly="readonly" />
						</div>
					</div>
				</div>
			</div>

			<div class="form-group" style="margin: 0px;padding: 0px;display: none;"
				id="cancel">
				<div class="item-form ">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">申请作废信息</h4>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">审&ensp;核&ensp;人：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="operatorname" name="operatorname"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">审核日期：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="auditcanceltime" name="auditcanceltime"
										readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1"
									style="text-align: center;padding-right:  0px">申请理由：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="cancelreason" name="cancelreason"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">申请时间：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="applicationcanceltime"
										name="applicationcanceltime" readonly="readonly" />
								</div>
							</div>
						</div>

						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
									作 废 否： </label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="iscancel" name="iscancel"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
									备 注： </label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="cancelremark" name=cancelremark
										readonly="readonly" />
								</div>


							</div>
						</div>

						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1"
									style="text-align: center;padding-right:  0px">违约金：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="demoney" name="defaultmoney"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2"
									style="text-align: center;padding-right:  0px">是否缴纳违约金：</label>
								<div class="col-lg-2  col-md-2 col-xs-4 col-sm-2  interval">
									<input class="form-control" id="payPenalty" name="payPenalty"
										readonly="readonly" />
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div id="btn" class="col-md-6 col-lg-6  col-sm-6 col-xs-6">
				<button class="btn btn-info" onclick="cancelOrder()" style="float: right;">申请作废</button>

			</div>
			<div class="col-md-6 col-lg-6  col-sm-6 col-xs-6">

				<button class="btn btn-info" onclick="back()" style="float: left;">返回</button>
			</div>
		</div>







	</form>
	<div class="modal fade" id="modaltwo">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">作废：</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" onsubmit="return false" id="formMoney">
						<div class="form-group">
							<div class="col-lg-11 col-sm-11 col-sm-11">
								<label class="control-label col-lg-4 col-sm-4 col-md-4">作废的理由：</label>
								<div class="col-lg-8 col-sm-8 col-md-8">
									<textarea class="form-control" id="cancelreason" name="cancelreason"
										maxlength="100" placeholder="请输入您作废的理由"></textarea>
									<input class="form-control hidden" id="orderid" name="orderformid" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-11 col-sm-11 col-sm-11">
								<label class="control-label col-lg-4 col-sm-4 col-md-4">备注：</label>
								<div class="col-lg-8 col-sm-8 col-md-8">
									<input class="form-control" id="cancelremark" name="cancelremark"
										maxlength="100" />
								</div>


							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-11 col-sm-11 col-sm-11">
								<label class="control-label col-lg-4 col-sm-4 col-md-4">违约金：</label>
								<div class="col-lg-8 col-sm-8 col-md-8">
									<input class="form-control" id="defaultmoney" name="WIDtotal_amount"
										placeholder="运输费用的20%" readonly="readonly" /> <input class="hidden"
										value="缴纳的违约金" />
								</div>


							</div>
						</div>
					</form>
					<form action="" id="formpay" target="_blank" method="post">
						<input class="form-control" id="WIDtotal_amount" name="WIDtotal_amount"
							placeholder="运输费用的20%" readonly="readonly" class="hidden"
							style="display: none;" /> <input value="缴纳的违约金" name="WIDbody"
							id="WIDbody" style="display: none;" /> <input id="WIDout_trade_no"
							name="WIDout_trade_no" class="hidden" style="display: none;" /> <input
							id="WIDsubject" name="WIDsubject" class="hidden" style="display: none;" /><input
							id="OrderID" class="hidden" name="OrderID" style="display: none;" /> <input
							class="hidden" id="WIDout_trade_no" name="WIDout_trade_no"
							style="display: none;" />
						<button class="btn btn-info" onclick="pay()">交款</button>
					</form>
				</div>
				<div class="modal-footer">
					<p style="display: inline-block;"></p>

					<button class="btn btn-info" onclick="QueDing()">确定</button>
					<button class="btn btn-info" onclick="closeModal()">取消</button>
				</div>
			</div>
		</div>
	</div>
	<div class="cl"></div>
	<div class="foot_login">
		<a href="${ctx }/FrontJsp/AboutUs.jsp" target="_blank">关于我们</a> | <a
			href="${ctx }" title="挑错有礼" target="_blank"><font>挑错有礼</font> </a> | <a
			href="http://www.chinawutong.com/foot/zhaopin.html" title="招聘英才"
			target="_blank">诚聘英才</a> | <a
			href="http://www.chinawutong.com/about/fuwuyuchanpin.html" target="_blank">服务与产品</a>
		| <a href="http://help.chinawutong.com/" target="_blank">使用与帮助</a> | <a
			href="http://www.chinawutong.com/about/wtsmfwtk.html" target="_blank">服务条款</a>
		| <a href="${ctx }/FrontJsp/Join.jsp" target="_blank">加盟我们</a> | <a
			href="http://www.chinawutong.com/about/wtsmfkfs.html" target="_blank">付款方式</a>
		| <a href="http://www.chinawutong.com/about/link.html" target="_blank">友情链接</a>
		| <a href="http://www.chinawutong.com/about/kefuzhongxin.html" target="_blank">客服中心</a>
		| <a href="${ctx }/FrontJsp/ContactUs.jsp" target="_blank">联系我们</a>
	</div>
	<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
        var startIndex = 0;
        var pageSize = 10;
        var ZongYeShu = 0;
        var pageNumber = 0;
        var YeShu = 1;
        var CustomName = '${sessionScope.custom.getCustomname()}';
        var OrderFromID = 0;
        var ZhuangTai;
        var transportcost;
        $(function () {
            $("#HuoWu2").hide();
            $("#HuoWu3").hide();
            if (CustomName == null || CustomName == "") {
                window.location.href = "${ctx}/FrontJsp/CustomLogin.jsp";
            } else {
                $("#dengLu")
						.append(
								' <a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span ><a class="denLu  ">'
										+ CustomName
										+ ',您好!</a> &nbsp;&nbsp; <a href="javascript:void(0);" class="zhuCe  " onclick="cancellation()">注销</a></span>');
            }
            selectOrder(startIndex, pageSize);

        });

        //自定义列
        function bsFinish(isfinish) {
            if (isfinish == false) {
                return "否";
            } else {
                return "是";
            }
        }
        function xiaYiYe(shu) {
            $("#" + (parseInt(pageNumber) + 1)).css('color', '#2594cb');
            $("#" + (parseInt(pageNumber) + 1)).css('border',
					'1px solid #2594cb');
            $("#" + pageNumber).css('color', "black");
            $("#" + pageNumber).css('border', "1px solid #aaa");
            if (parseInt(shu) < ZongYeShu) {

                startIndex = (shu * pageSize);
                selectOrder(startIndex, pageSize);
                YeShu = parseInt(shu) + 1;
            } else {
                layer.alert("已经是最后一页了！！", {
                    icon: 0,
                    title: "提示："
                });
            }
            scrollTo("#orDer", 1000);
            pageNumber = parseInt(pageNumber) + 1;
        }

        //点击回到指定的位置
        function scrollTo(ele, speed) {
            if (!speed)
                speed = 300;
            if (!ele) {
                $("html,body").animate({
                    scrollTop: 0
                }, speed);
            } else {
                if (ele.length > 0)
                    $("html,body").animate({
                        scrollTop: $(ele).offset().top
                    }, speed);
            }
            return false;
        }
        function next(ID) {
            $("#" + ID).css('color', '#2594cb');
            $("#" + ID).css('border', '1px solid #2594cb');
            startIndex = (ID * pageSize);
            selectOrder(startIndex, pageSize);

            $("#" + pageNumber).css('color', "black");
            $("#" + pageNumber).css('border', "1px solid #aaa");
            YeShu = parseInt(ID) + 1;
            scrollTo("#orDer", 1000);
            pageNumber = parseInt(ID);
        }
        function selectOrder(startIndex, pageSize) {
            $.post("${ctx}/ClientController/selcetMyorder.do?startIndex="
									+ startIndex + "&pageSize=" + pageSize,
							function (data) {
							    $("#orDer").html("");
							    $("#page_num").html("");
							    $("#orDer")
										.append(
												'<ul class="SupplyInfor_th "><li class="Sup1">客户名称</li><li class="Sup2">订单编号</li><li class="Sup3">订单录入日期</li><li class="Sup4">审核否</li><li class="Sup6">接单司机</li><li class="Sup7">司机联系电话</li><li class="Sup8">订单状态</li><li class="Sup9">订单操作</li></ul>');

							    if ((typeof data) == "string") {
							        data = JSON.parse(data);
							    }
							    ZongYeShu = Math
										.ceil(data.totalRows / pageSize);
							    data = data.data;
							    if (data != null) {

							        for (var i = 0; i < data.length; i++) {
							            var uploadTime = ChangeDateFormat(data[i].uploadtime);
							            var ShiFou = bsFinish(data[i].isauditing);
							            $("#orDer")
												.append(
														'<ul class="SupplyInfor_source SupplyInfor_zx"><li class="SupList1"><a href="#" target="_blank">'
																+ data[i].customname
																+ '</a> </li> <li class="SupList2"<span>'
																+ data[i].ordernumber
																+ '</span></li>  <li class="SupList3"><span>'
																+ uploadTime
																+ '</span></li>  <li class="SupList4">'
																+ ShiFou
																+ '</li>  <li class="SupList6"><span>'
																+ data[i].username
																+ '</span></li>  <li class="SupList7">'
																+ data[i].phoneNumber
																+ '</li>  <li class="SupList8">'
																+ data[i].statusname
																+ '</li><li class="SupList9"><a  id="'
																+ data[i].orderformid + '-' + data[i].statusname + '  "  onclick="OrderDetail(this.id)" href="javascript:void(0);" >订单详情</a></li></ul>');
							        }
							        if (ZongYeShu > 1) {

							            for (var i = 0; i < ZongYeShu; i++) {
							                $("#page_num")
													.append(
															'<a href="javascript:void(0);" id="'
																	+ parseInt(i)
																	+ '" onclick="next(this.id)">'
																	+ parseInt(i + 1)
																	+ '</a>');

							            }
							            $("#page_num")
												.append(
														'<a href="javascript:void(0);" onclick="xiaYiYe(YeShu)">下一页</a>');
							        }
							    }

							});

        }
        function OrderDetail(ID) {
        scrollTo(".top",1000);
            ZhuangTai = ID.split("-")[1];
            ID = ID.split("-")[0];
            OrderFromID = ID;
            $("#HuoWu2").hide();
            $("#HuoWu3").hide(); $("#cancel").hide();
            $.post("${ctx}/ClientController/selectOrder.do?orderformid=" + ID, function (data) {
                $("div input").val("");
                if ((typeof data) == "string") {
                    data = JSON.parse(data);
                }
                $("#title").text("订单状态：" + data[0].statusname+"(Tip:订单出现错误，可以等待司机上门时，与司机进行交流并修改订单！！)");
                $("#title").css("color", "red");
                 data[0].audittime=ChangeDateFormat(data[0].audittime);
                data[0].uploadtime=ChangeDateFormat(data[0].uploadtime);
                data[0].deliverytime=ChangeDateFormat(data[0].deliverytime);
                data[0].receipttime=ChangeDateFormat(data[0].receipttime);
                loadDataToForm("aspnetForm", data[0]);
                $("#demoney").val(data[0].transportcost*0.2);
                $("#WIDtotal_amount").val(data[0].transportcost*0.2);
                transportcost=data[0].transportcost;
                $("#WIDbody").val("违约金"); 
                $("#WIDsubject").val("广发物流");
                $("#WIDout_trade_no").val("1");
                $("#OrderID").val(data[0].orderformid);
                
                $("#goodsInfor").show();
                $(".logisticsLine").hide();
 
                var HuoWu = data[1];
                for (var i = 0; i < HuoWu.length; i++) {
                    if (i == 0) {
                        $("#goodName_1").val(HuoWu[i].mrchandisename);
                        $("#goodType_1").val(HuoWu[i].mrchandisetypeid);
                        $("#weight_1").val(HuoWu[i].weight + "kg");
                        $("#volume_1").val(HuoWu[i].volume + "m³");
                        $("#quantity_1").val(HuoWu[i].quantity);
                        
                    }
                    if (i == 1) {
                        $("#HuoWu2").show();
                        $("#goodName_2").val(HuoWu[i].mrchandisename);
                        $("#goodType_2").val(HuoWu[i].mrchandisetypeid);
                        $("#weight_2").val(HuoWu[i].weight + "kg");
                        $("#volume_2").val(HuoWu[i].volume + "m³");
                        $("#quantity_2").val(HuoWu[i].quantity);
                    }
                    if (i == 2) {
                        $("#HuoWu3").show();
                        $("#goodName_3").val(HuoWu[i].mrchandisename);
                        $("#goodType_3").val(HuoWu[i].mrchandisetypeid);
                        $("#weight_3").val(HuoWu[i].weight + "kg");
                        $("#volume_3").val(HuoWu[i].volume + "m³");
                         $("#quantity_3").val(HuoWu[i].quantity);
                    }

                }
                var Paymoney=data[3];
                var information=0;
                if (Paymoney.length>0) {


                    for ( var i = 0; i < Paymoney.length; i++) {
                        if (Paymoney[i].paymenttypeid!=3) {
                            information+=parseFloat(Paymoney[i].money);
                        }else
                        {
                            information=parseFloat(information-Paymoney[i].money);
                        }

                    }

                }  $("#paymentInformation").val("已收款："+information);
                 var cancel=data[4];
                if (cancel.length>0) {
                    $("#cancel").show();
                    cancel[0].applicationcanceltime=ChangeDateFormat(cancel[0].applicationcanceltime);
                    cancel[0].auditcanceltime=ChangeDateFormat(cancel[0].auditcanceltime);
                    cancel[0].iscancel=cancel[0].isaudit==true?"已作废":"未作废";
                    if (Paymoney.length>0) {
                        for ( var i = 0; i < Paymoney.length; i++) {
                            if (Paymoney[i].paymenttypeid==3) {
                                cancel[0].payPenalty="已交";
                            }else
                            {
                                cancel[0].payPenalty="未交";
                            }
                        }
                    }else
                    {
                        cancel[0].payPenalty="未交";
                    }
                    
                    loadDataToForm("aspnetForm", cancel[0]);}

            });

        }
        function GuanBi() {
            $("#modalone").modal("toggle");
        }
        function cancellation() {
            $.post("${ctx}/ClientController/cancellation.do", function (data) {
                if (data == "true") {
                    location.reload();
                }
            });

        }

        function cancelOrder() {
            if (OrderFromID > 0) {
               
             
                $("#formMoney input").val("");
                 $("#orderid").val(OrderFromID);
                layer.alert("是否申请作废？？？", { btn: ["确定", "取消"],offset:"100px", icon: 0, title: "提示：" }, function (layerIndex) {
                    layer.close(layerIndex);
                    if ($.trim(ZhuangTai)!="已完成") {
						
					$("#defaultmoney").val(transportcost*0.2);
                    if ($.trim(ZhuangTai) == "新订单") {
                        GuanBi();
                       
                        $("#modaltwo").modal("toggle");

                    } else {
                        if ($.trim(ZhuangTai) == "申请作废中") {
                            layer.alert("正在等待工作人审核中，不用再次申请！！", { icon: 0,offset:"100px", title: "提示：" });
                        } else {
                            if ($.trim(ZhuangTai) == "已作废") {
                                layer.alert("已作废，不用再次申请！！", { icon: 0, offset:"100px",title: "提示：" });
                            } else {
                                layer.alert("此订单已经开始运作，是否继续作废，继续作废需要支付一定违约金！！", { btn: ["确定", "取消"], offset:"100px",icon: 0, title: "提示：" }, function (index) {
                                    layer.close(index); GuanBi();
                                    $("#money").show();
                                    $("#modaltwo").modal("toggle");
                                });

                            }
                        }
                    }
                    } else {
                      layer.alert("已完成的订单不可以申请！！", { icon: 0, title: "提示：" });
					}
                    
                })

            } else {
                layer.alert("请刷新界面再尝试！！", { icon: 0, title: "提示：" });
            }

        }
        function closeModal() {
            $("#modaltwo").modal("toggle");
        }

        function QueDing() {
         var ForData = $("#formMoney").serializeArray();
            if ($.trim(ZhuangTai) != "新订单") {

               
                if ($("#defaultmoney").val() != "" && $("#defaultmoney").val() != null) {

                    $.post("${ctx}/ClientController/voidOrder.do?", ForData, function (data) {
                        if ((typeof data) == "string") {
                            data = JSON.parse(data);
                        }
                        if (data.state == true) {
                            if (layer.alert(data.msg, {
                                icon: 1,
                                offset: '100px',
                                btn: ["确定"]
                            }, function (layerIndex) {
                                        layer.close(layerIndex);//关闭提示框
                                        location.reload();
                            }));
                        } else {
                            layer.alert(data.msg, {
                                icon: 0,
                                title: "提示",
                                offset: '100px'
                            });
                        }


                    });

                } else {
                    layer.alert("请支付违约金！！", { icon: 0, title: "提示：" });
                }

            } else {
                $.post("${ctx}/ClientController/voidOrder.do?", ForData, function (data) {
                    if ((typeof data) == "string") {
                        data = JSON.parse(data);
                    }
                    if (data.state == true) {
                        if (layer.alert(data.msg, {
                            icon: 1,
                            offset: '100px',
                            btn: ["确定"]
                        }, function (layerIndex) {
                                    layer.close(layerIndex);//关闭提示框
                                    location.reload();
                        }));
                    } else {
                        layer.alert(data.msg, {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
                    }


                });


            }

        }
         function pay() {
                $("#formpay").attr("action",
						"${ctx}/AlipayJsp/alipay.trade.page.pay.jsp");
                $("#formpay").ajaxSubmit();
           var money= $("#WIDtotal_amount").val();
           var OrderID=$("#OrderID").val();
           $.post("${ctx}/ClientController/collectMoney.do?money="+money+"&OrderID="+OrderID,function(data)
           {if ((typeof data) == "string") {
                            data = JSON.parse(data);
                        }
                        if (data.state == true) {
                            if (layer.alert(data.msg, {
                                icon: 1,
                                offset: '100px',
                                btn: ["确定"]
                            }, function (layerIndex) {
                                        layer.close(layerIndex);//关闭提示框
                                        location.reload();
                            }));
                        } else {
                            layer.alert(data.msg, {
                                icon: 0,
                                title: "提示",
                                offset: '100px'
                            });
                        }
           
           });
        }
       function back() {
		  $("#goodsInfor").hide();
                $(".logisticsLine").show();
                scrollTo(".top",1000);
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
    </script>
</body>
</html>
