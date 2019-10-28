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

<title>订单管理界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx}/Content/css/datatables.min.css"
	type="text/css"></link>
<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script> -->
<link rel="stylesheet" href="${ctx }/Content/css/Map.css" type="text/css"></link>
<style type="text/css">
* {
	font-family: "华文仿宋";
	font-weight: bolder;
}

label {
	height: 34px;
	font-family: '华文中宋';
	color: #6f7b8a;
	font-size: 13.5px;
	line-height: 20px;
	margin-right: -3px;
	text-align: center;
	font-weight: normal;
	background: white;
	border: #AAAAAA solid 1px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: none;
	z-index: 100;
	padding-left: 0px;
}

.interval {
	padding-left: 0;
}

.control-label {
	padding-left: 0;
}

thead {
	background: #cfecf3;
}

td,th {
	vertical-align: middle;
	text-align: center;
}

tr {
	font-size: 13px;
	vertical-align: middle;
	font-family: "华文仿宋";
}
</style>
</head>

<body>
	<div class="container-fluid">

		<div id="DingDan">

			<form class="form-horizontal" style="margin-top: 10px"
				onsubmit="return false">

				<div class="form-group ">
					<div class="col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
						<label
							class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label text-right text-primary">审核状态：</label>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left"
							style="padding-left:0px;padding-right:0px;">
							<select class="form-control " id="audit" style="color:#337ab7 ">
								<option value="">---请选择---</option>
								<option value="1">已审核</option>
								<option value="0">未审核</option>
							</select>
						</div>
					</div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
						<label
							class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label text-right text-primary">问题订单：</label>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left"
							style="padding-left:0px;padding-right:0px;">
							<select class="form-control " id="problem" style="color:#337ab7 ">
								<option value="">---请选择---</option>
								<option value="1">有</option>
								<option value="0">无</option>
							</select>
						</div>
					</div>

					<div class=" col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
						<label
							class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label text-right text-primary">完成状态：</label>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left"
							style="padding-left:0px;padding-right:0px;">
							<select class="form-control " id="finish" style="color:#337ab7 ">
								<option value="">---请选择---</option>
								<option value="1">已完成</option>
								<option value="0">未完成</option>
							</select>
						</div>
					</div>
				</div>

				<div class="form-group ">
					<div class="col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
						<label
							class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label text-right text-primary">模糊查询：</label>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left "
							style="padding-left:0px;padding-right:0px;">
							<input class="form-control " onkeyup="query()" id="vague"
								placeholder="司机、订单号码、地址、手机号码查询" style="color:#337ab7 " />


						</div>
					</div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
						<label
							class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label text-right text-primary">开始时间：</label>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left "
							style="padding-left:0px;padding-right:0px;">
							<input class="form-control " type="date" id="startTime"
								onchange="start()" style="color:#337ab7 " />
						</div>
					</div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
						<label
							class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label text-right text-primary">结束时间：</label>
						<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left "
							style="padding-left:0px;padding-right:0px;">
							<input class="form-control " style="color:#337ab7 " type="date"
								id="endTime" onchange="end()" />
						</div>
					</div>
				</div>
			</form>


			<table id="TabOrderForm"
				class="display table table-hover table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>

						<th style="vertical-align: middle">订单编号</th>
						<th style="text-align: center;vertical-align: middle;">运输司机</th>
						<th style="vertical-align: middle">寄货人(公司)名称</th>
						<th style="vertical-align: middle">寄货人(公司)地址</th>
						<th style="vertical-align: middle">收货人(公司)名称</th>
						<th style="vertical-align: middle">收货人(公司)地址</th>
						<th style="vertical-align: middle">订单状态</th>
						<th style="vertical-align: middle">操作</th>
					</tr>
				</thead>
			</table>

		</div>


		<div id="DiTu" style="display: none;">
			<div style=" width:100%;height:550px;border:#ccc soliud 1px;"
				id="dituContent"></div>
		</div>


		<div id="goodsInfor" style="display: none;border: 1px solid #efeef0; ">

			<form id="aspnetForm" class="form-horizontal " onsubmit="return false">
				<h4 id="title"></h4>
				<div class="form-group" style="margin: 0px;padding: 0px">
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
				<div class="form-group" style="margin: 0px;padding: 0px">
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

				<div class="form-group" style="margin: 0px;padding: 0px">
					<div class="item-form">
						<div class="itemform_Th"
							style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
							<div
								style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
							<h4 style="color: #666;font-size: 16px; padding-top: 13px">出发地 → 到达地</h4>
							<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
								style="margin-top: 20px">
								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-1"></div>

									<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">发货地址：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 interval">
										<input class="form-control" name="sendadress" readonly="readonly"
											maxlength="100" /> <input class="hidden" id="orderformid"
											name="orderformid" />
									</div>

									<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">收货地址：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" name="takeadress" readonly="readonly"
											maxlength="100" />
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>


				<div class="form-group" style="margin: 0px;padding: 0px">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;  height: 43px;line-height: 43px;margin-top: 10px;  ">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">
							货物信息<a href="javascript:void(0);" class="add" style="display: none;">
								<img src="${ctx }/Content/image/123.jpg" width="30px;" height="30px"
								onclick="Add()" /> </a> <a class="add" style="display: none;"
								href="javascript:void(0);"> <img
								src="${ctx }/Content/image/1234.jpg" width="30px;" height="30px"
								onclick="Reduce()" /> </a>
						</h4>

						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
									货物名称： </label>
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
									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
										货物体积 ： </label>
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

				<div class="form-group" style="margin: 0px;padding: 0px">
					<div class="itemform_Th"
						style="background-color: #f5f5f5;height: 43px;line-height: 43px;margin-top: 10px;">
						<div
							style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
						<h4 style="color: #666;font-size: 16px; padding-top: 13px">联系信息</h4>

					</div>
					<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
						style="padding-top: 15px">
						<div class="form-group">
							<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

							<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
								寄货人（公司）姓名： </label>
							<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
								<input class="form-control" name="sendname" readonly="readonly"
									maxlength="20" />
							</div>

							<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
								寄货人（公司）电话： </label>
							<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
								<input class="form-control" name="sendphonenumber" readonly="readonly"
									maxlength="11" />


							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
						style="padding-top: 15px">
						<div class="form-group">
							<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

							<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">收货人（公司）姓名：</label>
							<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
								<input class="form-control" name="takename" readonly="readonly"
									maxlength="20" />
							</div>
							<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">收货人（公司）电话：</label>
							<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
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

				<div class="form-group">
					<div class="item-form">
						<div class="itemform_Th"
							style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
							<div
								style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
							<h4 style="color: #666;font-size: 16px; padding-top: 13px">司机信息</h4>
							<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
								style="margin-top: 20px">
								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-1"></div>

									<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">司机名称：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 interval">
										<input class="form-control" name="username" readonly="readonly"
											maxlength="100" />
									</div>

									<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">手机号码：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" name="phoneNumber" readonly="readonly"
											maxlength="100" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-1"></div>

									<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">
										车 牌 号： </label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3 interval">
										<input class="form-control" name="platenumber" readonly="readonly"
											maxlength="100" />
									</div>

									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3"
										style="display: none;" id="Appointment">
										<button class="btn btn-info" onclick="Appoint()">委任司机</button>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="form-group" style="margin: 0px;padding: 0px">
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
										<option value="${list.getTransportmodeid()}">
											${list.getTransportmodename()}_首重费:${list.getFirstcharge()
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
				<div class="form-group" style="margin: 0px;padding: 0px">
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

				<div class="form-group" id="question" style="margin: 0px;padding: 0px">
					<div class="item-form wenti1">
						<div class="itemform_Th"
							style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
							<div
								style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
							<h4 style="color: #666;font-size: 16px; padding-top: 13px">订单问题信息</h4>
							<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
								style="padding-top: 15px">
								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
										解 决 人： </label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="solution_1" name="solution_1"
											readonly="readonly" />
									</div>
									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">问&emsp;&emsp;题：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="problem_1" name="problem_1"
											readonly="readonly" />
									</div>

								</div>
							</div>
							<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">订单位置：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="prolocation_1" name="prolocation_1"
											readonly="readonly" />
									</div>
									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">解&ensp;决&ensp;否：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="solve_1" name="solve_1"
											readonly="readonly" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="wenti2 wenti" style="display: none;">
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
									解 决 人： </label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="solution_2" name="solution_2"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">问&emsp;&emsp;题：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="problem_2" name="problem_2"
										readonly="readonly" />
								</div>

							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">订单位置：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="prolocation_2" name="prolocation_2"
										readonly="readonly" />
								</div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">解&ensp;决&ensp;否：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="solve_2" name="solve_2"
										readonly="readonly" />
								</div>
							</div>
						</div>
					</div>
					<div class="wenti3 wenti" style="display: none;">
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
							style="padding-top: 15px">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">
									解 决 人： </label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="solution_3" name="solution_3"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">问&emsp;&emsp;题：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="problem_3" name="problem_3"
										readonly="readonly" />
								</div>

							</div>
						</div>
						<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">订单位置：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="prolocation_3" name="prolocation_3"
										readonly="readonly" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">解&ensp;决&ensp;否：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="solve_3" name="solve_3"
										readonly="readonly" />
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="form-group" style="margin: 0px;padding: 0px">
					<div class="item-form ">
						<div class="itemform_Th"
							style="background-color: #f5f5f5;height: 43px;line-height: 43px;">
							<div
								style="display: block;float: left;margin: 14px 8px 0 20px;background: #21b6ee;width: 3px;height: 16px;"></div>
							<h4 style="color: #666;font-size: 16px; padding-top: 13px">订单审核、上传信息</h4>
							<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
								style="padding-top: 15px">
								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">审&ensp;核&ensp;否：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="isauditing" name="isauditing"
											readonly="readonly" />
									</div>
									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">审核日期：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="audittime" name="audittime"
											readonly="readonly" />
									</div>
								</div>
							</div>
							<div class="col-md-12 col-lg-12  col-sm-12 col-xs-12"
								style="padding-top: 15px">
								<div class="form-group">
									<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

									<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1"
										style="text-align: center;padding-right:  0px">实地上传否：</label>
									<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
										<input class="form-control" id="isindeedupload" name="isindeedupload"
											readonly="readonly" />
									</div>

								</div>
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
										<input class="form-control" id="auditcanceltime"
											name="auditcanceltime" readonly="readonly" />
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
										<input class="form-control" id="defaultmoney" name="defaultmoney"
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


			</form>
			<button class="btn btn-info" style="margin-left: 20%"
				onclick="AuditOrderForm()" id="Audit">审核订单</button>

			<button class="btn btn-info" style="margin-left: 20px"
				onclick="DisposeProblem()" id="Dispose">处理问题</button>
			<button class="btn btn-info" style="margin-left: 20px" onclick="AuditVoid()"
				id="auditvoid">审核作废订单</button>

			<button class="btn btn-info" style="margin-left: 20px" onclick="back()">返回</button>
		</div>





		<div class="modal fade" id="modalone">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">处理订单问题：</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" onsubmit="return false" id="WenTiFrom">
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">订单运输的问题：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<input class="form-control" id="Orderquestion" name="reason"
											maxlength="100" readonly="readonly" /> <input
											class="form-control hidden" id="OrderProblemID" name="orderproblemid"
											maxlength="20"> <input class="form-control hidden"
											id="UpdateOrderFormID" name="UpdateOrderFormID" maxlength="20">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">订单位置：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<input class="form-control" id="OrderLocation"
											name="orderformlocation" maxlength="100" readonly="readonly" />

									</div>


								</div>
							</div>


							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">原委任车队：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<input id="FMotorcade" name="motorcadeName" class="form-control"
											readonly="readonly" /> <input id="FMotorcadeID" name="motorcadeID"
											class="hidden" />
									</div>
								</div>
							</div>



							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">原委任司机：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<input class="form-control" id="FUserName" name="userName"
											readonly="readonly" /> <input class="form-control hidden"
											id="FUserID" name="formerlyuserid" readonly="readonly" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">解决描述：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<input class="form-control" id="describe" name="describe"
											maxlength="100" />

									</div>


								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">

									<button class="btn btn-info" style="margin-left: 200px"
										onclick="replaceDriver()">更换司机</button>
									<button class="btn btn-info" onclick="cancel()">取消</button>

								</div>
							</div>
							<div class="form-group  driver" style="display: none;">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">新委任车队：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<select class="form-control" id="nowMotorcadeID" name="nowMotorcadeID"
											onchange="Choose(this.id)">
											<c:forEach items="${Motolist}" var="list">
												<option value="${list.getMotorcadeid()}">${list.getMotorcadename()}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group  driver" style="display: none;">

								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">新委任司机：</label>
									<div class="col-lg-8 col-sm-8 col-md-8 interval">
										<select class="form-control" id="UserID" name="UserID"></select>

									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="solve()">确定</button>

					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="Drivermodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">委任司机：</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" onsubmit="return false" id="DriverForm">
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">委任车队：</label>
									<div class="col-lg-8 col-sm-8 col-md-8" style="padding-left: 0px">
										<select class="form-control" id="Motorcade" name="Motorcade"
											onchange="Change(this.id)">
											<c:forEach items="${Motolist}" var="list">
												<option value="${list.getMotorcadeid()}">${list.getMotorcadename()}</option>
											</c:forEach>
										</select> <input id="OrderID" name="OrderID" class="hidden" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">委任司机：</label>
									<div class="col-lg-8 col-sm-8 col-md-8" style="padding-left: 0px">
										<select class="form-control" id="YongHuID" name="YongHuID"></select>

									</div>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="WeiRenQueDing()">确定</button>

					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<!-- 	<script type="text/javascript" src="${ctx }/Content/js/OpenMap.js"></script> -->
	<script type="text/javascript" src="${ctx }/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>


	<script type="text/javascript">
		var TabOrderForm;

		var WeiZhi = new Array();

		var orderFormID;

		var DiZhi;
		var orderProblemID;
		var isSolve;
		var statusName;
		var startTime;
		var endTime;
		var CurDate;
		var IsProblem;
		var statusid;
		var Institutionalorganizationid = parseInt('${user.getInstitutionalorganizationid()}');
		$(function() {
			var count = Math.round((window.screen.height - 480) / 50);
			//             try {
			//                 initMap();//创建和初始化地图
			//             } catch (e) {
			//                 layer.closeAll('loading');
			//                 layer.alert("地图加载失败，请刷新界面！！", {
			//                     icon : 0,
			//                     title : "提示",
			//                     offset : '100px',
			//                     btn : [ "确定" ]
			//                 }, function(index) {
			//                     layer.close(index);
			//                     location.reload();
			//                 });
			//             }

			$("#result").hide();
			$("#HuoWu").hide();
			$("#DingDan").show();

			TabOrderForm = $('#TabOrderForm')
					.DataTable(
							{
								"pagingType" : "simple_numbers",//设置分页控件的模式
								searching : false,//屏蔽datatales的查询框
								aLengthMenu : [ count ],//设置一页展示10条记录
								"bSort" : false,// 是否排序功能
								"bLengthChange" : false,//屏蔽tables的一页展示多少条记录的下拉列表
								"bAutoWidth" : false,// 是否非自动宽度  设置为false
								"oLanguage" : { //对表格国际化
									"sLengthMenu" : "每页显示 _MENU_条",
									"sZeroRecords" : "没有找到符合条件的数据",
									//  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",
									"sInfo" : "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
									"sInfoEmpty" : "木有记录",
									"sInfoFiltered" : "(从 _MAX_ 条记录中过滤)",
									"sSearch" : "搜索：",
									"sProcessing" : "正在加载中......",
									"oPaginate" : {
										"sFirst" : "首页",
										"sPrevious" : "前一页",
										"sNext" : "后一页",
										"sLast" : "尾页"

									}
								},
								"lengthMenu" : [ 5, 10, 20, 50, 100 ],
								"processing" : true, //打开数据加载时的等待效果
								"serverSide" : true,//打开后台分页
								"ajax" : {
									"url" : "${ctx}/OrderFormDisposeController/getList.do",
									"dataSrc" : "aaData",
									"data" : function(d) {
										d.finish = $("#finish").val();
										d.audit = $("#audit").val();
										d.problem = $("#problem").val();
										d.vague = $("#vague").val();
										d.startTime = $("#startTime").val();
										d.endTime = $("#endTime").val();
										d.WanCheng = $("#finish").val();
										d.JieShou = $("#accept").val();
										d.condition = $("#condition").val();
									}
								},

								"columns" : [

										{
											"data" : "ordernumber",
											"width" : "60px"
										},
										{
											"data" : "username",
											"width" : "60px"
										},
										{
											"data" : "sendname",
											"width" : "130px"
										},
										{
											"width" : "140px",
											"data" : function(obj) {
												// serachlocal(obj.sendadress);
												return obj.sendadress;
											}
										},
										{
											"data" : "takename",
											"width" : "130px"
										},
										{
											"data" : "takeadress",
											"width" : "140px"
										},
										{
											"data" : "statusname",
											"width" : "60px"
										},

										{
											"data" : function(obj) {
												return '<button class="btn" style="font-family:华文中宋; " id="'
														+ obj.orderformid
														+ '"  onclick="OrderDetail(this.id)">详情</button>  '
											},
											"width" : "60px"
										} ]

							});
			setInterval(refresh, 60000);
		});

		$("#finish").change(function() {

			TabOrderForm.ajax.reload();
		});

		$("#audit").change(function() {
			TabOrderForm.ajax.reload();
		});
		$("#problem").change(function() {
			TabOrderForm.ajax.reload();
		});

		//         function YiCang() {
		//             $("#result > div:first").hide();

		//             $("#result").parent().height(0);
		//             map.removeControl(MyZiDingYiControl);
		//         }

		//定义一个控件类,即function
		//         function ZiDingYiControl() {
		//             this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
		//             this.defaultOffset = new BMap.Size(10, 0);
		//         }
		//通过JavaScript的prototype属性继承于BMap.Control
		//         ZiDingYiControl.prototype = new BMap.Control();

		// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
		// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
		//         ZiDingYiControl.prototype.initialize = function (map) {
		// 创建一个DOM元素
		//             var div = document.createElement("div");
		//             div.innerHTML = "<div id='result' style='overflow:auto'></div>";
		//             div.style.overflow = "auto";
		//             div.style.height = "540px";
		//             div.style.width = "300px";
		//             div.onclick = function (e) {
		//                 YiCang();
		//             }
		// 添加DOM元素到地图中
		//             map.getContainer().appendChild(div);

		// 将DOM元素返回
		//             return div;
		//         }
		//         var MyZiDingYiControl = new ZiDingYiControl();
		//         map.addControl(MyZiDingYiControl);

		function GuanBi() {
			$("#HuoWu").hide();
			$("#DingDan").show();

		}

		function refurbish() {
			getlocation();
			$("#Location").val(DiZhi);
		}

		function OrderDetail(ID) {
			$("#goodsInfor").show();
			$("#DingDan").hide();
			$("#cancel").hide();
			$("#wenti1").hide();
			$("#wenti2").hide();
			$("#wenti3").hide();
			$("#question").hide();
			scrollTo(".container-fluid", 1000);
			$
					.post(
							"${ctx}/ClientController/selectOrder.do?orderformid="
									+ ID,
							function(data) {
								$("#goodsInfor input").val("");
								$("#goodsInfor input").attr("readonly",
										"readonly");
								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}
								orderFormID = data[0].orderformid;
								statusid = data[0].statusid;
								IsProblem = data[0].isproblem;
								$("#JieHuo").hide();
								$("#upload").hide();
								$("#Quession").hide();
								$("#YunSong").hide();
								if (statusid == 9) {
									$("#JieHuo").show();
								} else if (statusid == 5
										&& data[0].isindeedupload == false) {
									$("#upload").show();
									$("#Quession").show();
									$("#Quession").css("margin-left", "0px");
								} else if (data[0].isindeedupload == true
										&& statusid == 5) {

									$("#YunSong").show();

								} else {
									$("#Quession").show();
									$("#Quession").css("margin-left", "30%");
								}
								$("#OrderID").val(orderFormID);
								$("#title").text(
										"订单状态：" + data[0].statusname
												+ "(Tip:审核订单，处理订单问题，审核作废的订单)");
								$("#title").css("color", "red");
								data[0].isindeedupload = data[0].isindeedupload == true ? "已上传"
										: "未上传";
								data[0].isauditing = data[0].isauditing == true ? "已审核"
										: "未审核";
								if (data[0].iscancel == true) {
									data[0].iscancel = "已作废";
								} else {
									data[0].iscancel = "";
								}
								data[0].audittime = ChangeDateFormat(data[0].audittime);
								data[0].uploadtime = ChangeDateFormat(data[0].uploadtime);
								data[0].deliverytime = ChangeDateFormat(data[0].deliverytime);
								data[0].receipttime = ChangeDateFormat(data[0].receipttime);

								loadDataToForm("aspnetForm", data[0]);
								if (data[0].username != ''
										&& data[0].username != null) {
									$("#Appointment").hide();
								} else {
									$("#Appointment").show();
								}
								//serachlocal(data[0].takeadress);

								$("#HuoWu2").hide();
								$("#HuoWu3").hide();
								var HuoWu = data[1];
								if (HuoWu.length > 0) {

									for ( var i = 0; i < HuoWu.length; i++) {
										if (i == 0) {
											$("#goodName_1").val(
													HuoWu[i].mrchandisename);
											$("#mrchandiseid_1").val(
													HuoWu[i].mrchandiseid);
											$("#goodType_1").val(
													HuoWu[i].mrchandisetypeid);
											$("#weight_1").val(HuoWu[i].weight);
											$("#volume_1").val(HuoWu[i].volume);
											$("#quantity_1").val(
													HuoWu[i].quantity);
											$("#ordertailid_1").val(
													HuoWu[i].orderformdetailid);

										}
										if (i == 1) {
											$("#HuoWu2").show();
											$("#goodName_2").val(
													HuoWu[i].mrchandisename);
											$("#goodType_2").val(
													HuoWu[i].mrchandisetypeid);
											$("#weight_2").val(HuoWu[i].weight);
											$("#volume_2").val(HuoWu[i].volume);
											$("#quantity_2").val(
													HuoWu[i].quantity);
											$("#mrchandiseid_2").val(
													HuoWu[i].mrchandiseid);
											$("#ordertailid_2").val(
													HuoWu[i].orderformdetailid);

										}
										if (i == 2) {
											$("#HuoWu3").show();
											$("#goodName_3").val(
													HuoWu[i].mrchandisename);
											$("#goodType_3").val(
													HuoWu[i].mrchandisetypeid);
											$("#weight_3").val(HuoWu[i].weight);
											$("#volume_3").val(HuoWu[i].volume);
											$("#quantity_3").val(
													HuoWu[i].quantity);
											$("#mrchandiseid_3").val(
													HuoWu[i].mrchandiseid);
											$("#ordertailid_2").val(
													HuoWu[i].orderformdetailid);

										}

									}
								}

								var wenti = data[2];
								isSolve = "";
								if (wenti.length > 0) {
									$("#question").show();

									for ( var i = 0; i < wenti.length; i++) {
										if (i == 0) {
											$("#wenti1").show();
											$("#problem_1")
													.val(wenti[i].reason);
											$("#prolocation_1").val(
													wenti[i].orderformlocation);
											$("#solution_1").val(
													wenti[i].solutionman);
											$("#solve_1")
													.val(
															wenti[i].issolve == true ? "已解决"
																	: "未解决");
											isSolve = wenti[i].issolve;
										}
										if (i == 1) {
											$("#wenti2").show();
											$("#problem_2")
													.val(wenti[i].reason);
											$("#prolocation_2").val(
													wenti[i].orderformlocation);
											$("#solve_2")
													.val(
															wenti[i].issolve == true ? "已解决"
																	: "未解决");
											isSolve = wenti[i].issolve;
											$("#solution_2").val(
													wenti[i].solutionman);
										}
										if (i == 2) {
											$("#wenti3").show();
											$("#problem_3")
													.val(wenti[i].reason);
											$("#prolocation_3").val(
													wenti[i].orderformlocation);
											$("#solve_3")
													.val(
															wenti[i].issolve == true ? "已解决"
																	: "未解决");
											isSolve = wenti[i].issolve;
											$("#solution_3").val(
													wenti[i].solutionman);
										}
									}
								} else {
									$("#question").hide();

								}
								var Paymoney = data[3];
								var information = "";
								if (Paymoney.length > 0) {

									for ( var i = 0; i < Paymoney.length; i++) {
										if (Paymoney[i].paymenttypeid != 3) {
											information += parseFloat(Paymoney[i].money);
										} else {
											information = parseFloat(information
													- Paymoney[i].money);
										}

									}

								}

								$("#paymentInformation").val(
										"已收款：" + information);
								var cancel = data[4];
								if (cancel.length > 0) {
									$("#cancel").show();
									cancel[0].applicationcanceltime = ChangeDateFormat(cancel[0].applicationcanceltime);
									cancel[0].auditcanceltime = ChangeDateFormat(cancel[0].auditcanceltime);
									cancel[0].iscancel = cancel[0].isaudit == true ? "已作废"
											: "未作废";
									if (Paymoney.length > 0) {
										for ( var i = 0; i < Paymoney.length; i++) {
											if (Paymoney[i].paymenttypeid == 3) {
												cancel[0].payPenalty = "已交";
											} else {
												cancel[0].payPenalty = "未交";
											}
										}
									} else {
										cancel[0].payPenalty = "未交";
									}
									loadDataToForm("aspnetForm", cancel[0]);

								}
							});
		}

		function back() {
			$("#goodsInfor").hide();
			$("#DingDan").show();
		}

		function Change(ID) {

			var MotorcadeID = $("#" + ID).val();

			BangDingXiaLaKuang("YongHuID",
					"${ctx}/OrderFormDisposeController/selectUser.do?MotorcadeID="
							+ MotorcadeID);

		}

		function WeiRenQueDing() {
			var DriverForm = $("#DriverForm").serializeArray();
			var UserID = $("#YongHuID").val();
			if (UserID != "" && UserID != null) {
				$.post("${ctx}/OrderFormDisposeController/appointDriver.do",
						DriverForm, function(data) {
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
									offset : '100px'
								});

							}
						});

			} else {
				layer.alert("没有司机，怎么委任！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function AuditOrderForm() {
			if (orderFormID > 0) {
				layer.confirm("是否审核？？", {
					icon : 0,
					title : "提示",
					btn : [ "确定", "取消" ],
					offset : '100px'
				}, function(layerIndex) {
					layer.close(layerIndex);
					$.post(
							"${ctx}/OrderFormDisposeController/auditOrderForm.do?orderFormID="
									+ orderFormID, function(data) {
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
										offset : '100px'
									});

								}

							});
				});
			} else {
				layer.alert("请选择订单！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function DisposeProblem() {
			if (IsProblem == true) {
				if (statusid != 12) {
					if (orderFormID > 0) {
						$("#UpdateOrderFormID").val(orderFormID);
						if (isSolve == false) {

							$.post(
									"${ctx}/OrderFormDisposeController/selectorderProblem.do?orderFormID="
											+ orderFormID, function(data) {
										if ((typeof data) == "string") {
											data = JSON.parse(data);
										}
										if (data != "") {
											loadDataToForm("WenTiFrom", data);
											$("#modalone").modal("toggle");
										}
									});
						} else {
							layer.alert("已经解决！！", {
								icon : 0,
								title : "提示",
								offset : '100px'
							});
						}
					} else {
						layer.alert("请选择订单！！", {
							icon : 0,
							title : "提示",
							offset : '100px'
						});
					}

				} else {
					layer.alert("已经完成的订单，不需要再次解决问题了！！", {
						icon : 0,
						title : "提示",
						offset : '100px'
					});
				}
			} else {
				layer.alert("没有出现问题，不需要解决！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function Choose(ID) {
			var MotorcadeID = $("#" + ID).val();

			BangDingXiaLaKuang("UserID",
					"${ctx}/OrderFormDisposeController/selectUser.do?MotorcadeID="
							+ MotorcadeID);
		}

		function solve() {
			var WenTiFrom = $("#WenTiFrom").serializeArray();
			$.post("${ctx}/OrderFormDisposeController/solveProblem.do",
					WenTiFrom, function(data) {
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
								offset : '100px'
							});

						}

					});
		}

		function start() {
			ChangDay();

			if (startTime > CurDate) {
				layer.msg("开始日期不可以超过当前日期！！");
				$("#startTime").val("");
				return;
			}
			if (startTime > endTime) {
				layer.msg("开始日期不可以超过结束日期！！");
				$("#startTime").val("");
				return;
			}

			if (startTime != NaN && endTime != NaN) {
				var Day = parseInt(Math.abs(endTime - startTime) / 1000 / 60
						/ 60 / 24);

				if (Day == 0) {
					layer.msg("结束的日期和开始的日期不可以同一天！！");
					$("#endTime").val("");
					return;

				}

			}

			TabOrderForm.ajax.reload();
		}

		function end() {
			ChangDay();
			if (endTime > CurDate) {
				layer.msg("结束日期不可以超过当前日期！！");
				$("#endTime").val("");
				return;
			}
			if (startTime > endTime) {
				layer.msg("结束日期不可以小于开始日期！！");
				$("#endTime").val("");
				return;
			}
			if (startTime != NaN && endTime != NaN) {
				var Day = parseInt(Math.abs(endTime - startTime) / 1000 / 60
						/ 60 / 24);

				if (Day == 0) {
					layer.msg("结束的日期和开始的日期不可以同一天！！");
					$("#endTime").val("");
					return;

				}

			}

			TabOrderForm.ajax.reload();

		}

		function ChangDay() {
			startTime = new Date($("#startTime").val().replace("-", "/")
					.replace("-", "/"));
			endTime = new Date($("#endTime").val().replace("-", "/").replace(
					"-", "/"));
			CurDate = new Date(GetTime().replace("-", "/").replace("-", "/"));

		}

		function query() {
			TabOrderForm.ajax.reload();
		}

		function YanZheng(ID, value) {

			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(value)) {
				$("#" + ID).val("");
			}

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

		function replaceDriver() {
			$(".driver").show();
		}
		function cancel() {
			$(".driver").hide();
		}

		function AuditVoid() {
			layer.alert("是否作废？？？", {
				icon : 0,
				title : "提示：",
				offset : "100px",
				btn : [ "确定", "取消" ]
			}, function(index) {
				layer.close(index);
				if (orderFormID > 0) {
					$.post(
							"${ctx}/OrderFormDisposeController/approvalCancel.do?orderFormID="
									+ orderFormID, function(data) {
								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}
								if (data != "") {
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
											offset : '100px',
											title : "提示："
										});

									}
								}
							});
				} else {
					layer.msg("刷新界面！！");
				}
			});
		}

		function Appoint() {
			$("#Drivermodal").modal("toggle");
		}
		function refresh() {
			TabOrderForm.draw(false);
		}
	</script>

</body>
</html>
