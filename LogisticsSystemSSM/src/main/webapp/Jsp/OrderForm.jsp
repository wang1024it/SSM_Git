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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<link rel="stylesheet" href="${ctx }/Content/css/Map.css" type="text/css"></link>

<style type="text/css">
* {
	font-family: "华文中宋";
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
	background: #F4F4F4;
	border: #AAAAAA solid 1px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: none;
	z-index: 100;
}

.control-label {
	padding-left: 0;
}

.interval {
	padding-left: 0;
}

td,th {
	vertical-align: middle;
	text-align: center;
	color: #6c6c6c;
}

tr {
	font-size: 10px;
	vertical-align: middle
}

.dataTable {
	text-align: center;
	vertical-align: middle;
}
</style>

</head>

<body>
	<div class="container-fluid">


		<div id="DingDan">
			<form class="form-horizontal">
				<div class="form-group col-sm-4 col-md-4 col-lg-4 col-xs-4">
					<label
						class="col-sm-3 col-md-3 col-lg-3 col-xs-3 control-label text-right text-primary"
						style="padding-left: 0px;padding-right: 0px;">条件查询：</label>
					<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left"
						style="padding-left:0px;padding-right:0px;">
						<input class="form-control" type="text" id="condition" name="condition"
							placeholder="订单号码、地址、客户姓名查询" onkeyup="selectinfor()" maxlength="30" />
					</div>
				</div>
				<div class="form-group col-sm-4 col-md-4 col-lg-4 col-xs-4 ">
					<label
						class="col-sm-3 col-md-3 col-lg-3 col-xs-3 control-label text-right text-primary"
						style="padding-left: 0px;padding-right: 0px;">完成状态：</label>
					<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left"
						style="padding-left:0px;padding-right:0px;">
						<select class="form-control " id="finish">
							<option value="-1">---请选择---</option>
							<option value="1">完成</option>
							<option value="0">未完成</option>
						</select>
					</div>
				</div>
				<div class="form-group col-sm-4 col-md-4 col-lg-4 col-xs-4">
					<label
						class="col-sm-3 col-md-3 col-lg-3 col-xs-3 control-label text-right text-primary"
						style="padding-left: 0px;padding-right: 0px;">接受状态：</label>
					<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 text-left"
						style="padding-left:0px;padding-right:0px;">
						<select class="form-control " id="accept">
							<option value="0">---请选择---</option>
							<option value="9">接受</option>
							<option value="10">拒绝</option>
						</select>
					</div>
				</div>

			</form>
			<table id="TabOrderForm"
				class="display table table-hover table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="text-align: center;vertical-align: middle">运输司机</th>
						<th style="vertical-align: middle">订单编号</th>
						<th style="vertical-align: middle">寄货人（公司）名称</th>
						<th style="vertical-align: middle">寄货人（公司）地址</th>
						<th style="vertical-align: middle">收货人（公司）名称</th>
						<th style="vertical-align: middle">收货人（公司）地址</th>
						<th style="vertical-align: middle">订单状态</th>
						<th style="vertical-align: middle">操作</th>
					</tr>
				</thead>
			</table>
		</div>


		<div id="goodsInfor" style="display: none;border: 1px solid #efeef0; ">

			<form id="aspnetForm" class="form-horizontal " onsubmit="return false">
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
											maxlength="100" /> <input class="hidden" id="orderformid"
											name="orderformid" />
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
								href="javascript:void(0);"> <img
								src="${ctx }/Content/image/1234.jpg" width="30px;" height="30px"
								onclick="Reduce()" /> </a><span style="color:red">（单位不用填写，如：kg，m³）</span>
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
							<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>

							<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
								寄货人（公司）姓名：</label>
							<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
								<input class="form-control" name="sendname" readonly="readonly"
									maxlength="20" />
							</div>

							<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
								寄货人（公司）电话：</label>
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
				<div class="form-group" style="margin: 0px;padding: 0px" id="auditupload">
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
										<input class="form-control hidden" id="isauditing" name="isauditing" />
										<input class="form-control" id="isaudit" name="isaudit"
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
										<input class="form-control hidden" id="isindeedupload"
											name="isindeedupload" readonly="readonly" /> <input
											class="form-control" id="isupload" name="isupload"
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

				<div class="form-group" id="question"
					style="margin: 0px;padding: 0px;display: none;">
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



			</form>



			<div id="btn">
				<button class="btn btn-info" onclick="KaShiJieHuo()" id="JieHuo">开始接单</button>
				<button class="btn  btn-info" onclick="Upload()" id="upload">上传货物信息</button>
				<button class="btn btn-info" onclick="KaiShiYunSong()" id="YunSong">开始运送</button>
				<button class="btn btn-info" onclick="WenTi()" id="Quession">订单问题</button>
				<button class="btn btn-info" id="ShouKuan" onclick="makeCollections()">收款</button>
				<button class="btn btn-info" id="finishOrder" onclick="WanCheng()">完成</button>
				<button class="btn btn-info" onclick="back()">返回</button>
			</div>
			<div id="yes" style="display: none;">
				<button class="btn btn-info" style="margin-left: 40%" onclick="Determine()">确定</button>
				<button class="btn btn-info" onclick="cancel()">取消</button>
			</div>
		</div>


		<div id="DiTu" style="display: none;">
			<div style=" width:100%;height:550px;border:#ccc soliud 1px;"
				id="dituContent"></div>
			<button class="btn btn-info" onclick="ChaKanDaoHang()">查看导航信息</button>
			<button class="btn btn-info" onclick="back()">返回</button>
		</div>



		<div class="modal fade" id="modalone">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">订单问题：</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" onsubmit="return false" id="WenTiFrom">
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">订单运输的问题：</label>
									<div class="col-lg-8 col-sm-8 col-md-8" style="padding-left: 0px">
										<input class="form-control" id="question" name="question"
											maxlength="100" /> <input class="form-control hidden" id="DingDanID"
											name="DingDanID" maxlength="20">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<label class="control-label col-lg-4 col-sm-4 col-md-4">订单位置：</label>
									<div class="col-lg-7 col-sm-7 col-md-7" style="padding-left: 0px">
										<input class="form-control" id="Location" name="Location"
											maxlength="100" readonly="readonly" />

									</div>
									<div class="col-lg-1 col-sm-1 col-md-1">
										<button class="btn btn-info" onclick="refurbish()">刷新位置</button>
									</div>

								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="WenTiQueDing()">确定</button>

					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="modalfour">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">支付界面：</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" target="_blank" id="FormData" method="post">
							<div class="form-group">
								<div class="col-lg-11 col-sm-11 col-sm-11">
									<div class="col-lg-6 col-sm-6 col-md-6 ">
										<img src="${ctx}/Content/image/WeChat.jpg"
											style="height: 150px;width: 150px" id="WeChat"
											onclick="choose(this.id)"></img>
									</div>
									<div class="col-lg-6 col-sm-6 col-md-6 ">
										<img src="${ctx}/Content/image/Alipay.jpg"
											style="height: 150px;width: 150px" id="Alipay"
											onclick="choose(this.id)"></img>
									</div>
									<input id="select" class="hidden" />

								</div>
							</div>
							<div class="form-group">
								<input id="WIDout_trade_no" name="WIDout_trade_no" class="hidden" /> <input
									id="WIDsubject" name="WIDsubject" class="hidden" /> <input
									class="hidden" id="WIDtotal_amount" name="WIDtotal_amount" /> <input
									class="hidden" id="WIDbody" name="WIDbody" /> <input id="OrderID"
									class="hidden" name="OrderID" value="2" />


								<button style="margin-left: 12px" class="btn btn-info" onclick="pay()">确定</button>

							</div>
						</form>

						<button class="btn btn-info" onclick="money()">收钱</button>



					</div>
				</div>
				<div class="modal-footer">
					<p style="display: inline-block;"></p>


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
	<script type="text/javascript" src="${ctx }/Content/js/OpenMap.js"></script>

	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>

	<script type="text/javascript">
	 var Institutionalorganizationid=  ${user.getInstitutionalorganizationid()} ;
        var TabOrderForm;
        var QuFen = 0;
        var sendAdress;
        var WeiZhi = new Array();
        var QuFen = false;
        var sendName;
        var sendPhoneNumber;
        var takeName;
        var takeAdress;
        var takePhoneNumber;
        var paymentID;
        var orderFormID;
        var remark;
        var transportCost;
        var Weight1 = 0;
        var Weight2 = 0;
        var Weight3 = 0;
        var PayName = "";
       
        var MoneyName = "";
       
        var DiZhi;
        var nowAdress;
        var receiptTime;
        var transportModeID;
        var isIndeedUpload;
       
        var orderNumber;
        var bargainMoney;
        var finish;
        var auditTime;
        var statusid;
        $(function () {
       
            try {
			   initMap();//创建和初始化地图
		     } catch (e) {
			layer.closeAll('loading');
			layer.msg("地图加载失败，请刷新界面！！", {
				icon : 0,
				
				offset : '100px',
				btn : [ "确定" ]
			}, function(index) {
				layer.close(index);
				location.reload();
			});
		    }
         
            $("#result").hide();
            $("#HuoWu").hide();
            $("#DingDan").show();

            
            TabOrderForm = $('#TabOrderForm').DataTable({
				"pagingType" : "simple_numbers",//设置分页控件的模式  
				searching : false,//屏蔽datatales的查询框  
				aLengthMenu : [ 10 ],//设置一页展示10条记录  
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
				"lengthMenu": [5, 10, 20, 50, 100],
				"processing" : true, //打开数据加载时的等待效果  
				"serverSide" : true,//打开后台分页  
				"ajax" : {
					"url" : "${ctx}/OrderformController/getList.do",
					"dataSrc" : "aaData",
					"data" : function(d) {
						
                        d.WanCheng = $("#finish").val();
                          d.JieShou = $("#accept").val();
                         d.condition = $("#condition").val();
					

					}
				},
				
				
				"columns" : [

				{
					"data" : "username",
					"width": "50px"
				}, {
					"data" : "ordernumber",
					"width": "60px"
				},
				 {
					"data" : "sendname",
					"width": "110px"
				},
				{
					"data" :function(obj) 
					{
					 serachlocal(obj.sendadress);
					  transportCost=obj.transportcost;
                      bargainMoney=obj.bargainmoney;
					 
					 return obj.sendadress;
					},"width": "140px" 
				},{
					"data" : "takename","width": "110px" 
				},{
					"data" : "takeadress","width": "140px" 
				},{
					"data" : "statusname","width": "50px" 
				},
				
				 {
					"data" : function(obj) {
						return '<button class="btn" id="'+obj.orderformid+'" onclick="detail(this.id)">详情</button> '
					},"width": "60px" 
				}]

			});
           
     setInterval(refresh, 60000);
        }); 

        $("#finish").change(function () {
          TabOrderForm.ajax.reload();
        });

        function selectinfor() {
			 TabOrderForm.ajax.reload();
		}

        $("#accept").change(function () {
           TabOrderForm.ajax.reload();
        });
        function KaShiJieHuo() {
            if (orderFormID > 0) {
               map.clearOverlays();
               layer.load();
                   $.post("${ctx}/OrderformController/pickUpGoods.do?orderFormID=" + orderFormID, function (data) {
                                    if ((typeof data) == "string") {
                                        data = JSON.parse(data);
                                    }
                                    if (data.state == true) {
                                    $("#DiTu").show();
                                    $("#goodsInfor").hide();
                                    layer.closeAll('loading');
                                        if (layer.alert(data.msg, {
                                            icon: 1,
                                            offset: '100px',
                                            btn: ["确定"]
                                        }, function (layerIndex) {
                                        
                                            layer.close(layerIndex);//关闭提示框
                                            var driving = new BMap.DrivingRoute(map, {
                                            renderOptions: {
                                            map: map,
                                            panel: "result",
                                            autoViewport: true
                                        }
                                        }); 
                                        $("#result").parent().height(540);
                                         if (sendAdress != undefined) {
                                           if (WeiZhi != undefined) {
                                            if (myXWeiZi!=""&&myXWeiZi!=undefined&&myYWeiZi!=""&&myYWeiZi!=undefined) 
                                              {
                                               var start = new BMap.Point(myXWeiZi, myYWeiZi);
                                               var end = new BMap.Point(WeiZhi[0], WeiZhi[1]);
                                               driving.search(start, end);
                                               $("#result").show();
                                                 layer.closeAll('loading');
                                                  ReFresh();
                                               }else { 
                                                 layer.closeAll('loading');
                                                 layer.alert("您的位置定位失败，请在网络好的地方进行定位！！",{ icon: 0,title: "提示", offset: '100px' });
                                                }
                                        } else {
                                         layer.closeAll('loading');
                                          layer.alert("请刷新界面！！", { icon: 0, title: "提示", offset: '100px' });
                                        }

                                        } else {
                                         layer.closeAll('loading');
                                           layer.alert("请选择你要接货的数据！！", { icon: 0, title: "提示", offset: '100px' });
                                        }

                                        }));

                                    } else {
                                    layer.closeAll('loading');
                                        layer.alert(data.msg, {
                                            icon: 0,
                                            title: "提示",
                                            offset: '100px'
                                        });
                                    }

                                });
            } else {
              layer.closeAll('loading');
                layer.alert("请选择一条数据！！", {
                    icon: 0,
                    title: "提示",
                    offset: '100px'
                });
            }
        }

       

        function YiCang() {
            $("#result > div:first").hide();

            $("#result").parent().height(0);
            //map.removeControl(MyZiDingYiControl);
        }

        //定义一个控件类,即function
        function ZiDingYiControl() {
            this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
            this.defaultOffset = new BMap.Size(10, 0);
        }
        //通过JavaScript的prototype属性继承于BMap.Control
        ZiDingYiControl.prototype = new BMap.Control();

        // 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
        // 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
        ZiDingYiControl.prototype.initialize = function (map) {
            // 创建一个DOM元素
            var div = document.createElement("div");
            div.innerHTML = "<div id='result' style='overflow:auto'></div>";
            div.style.overflow = "auto";
            div.style.height = "540px";
            div.style.width = "300px";
            div.onclick = function (e) {
                YiCang();
            }
            // 添加DOM元素到地图中
            map.getContainer().appendChild(div);

            // 将DOM元素返回
            return div;
        }
        var MyZiDingYiControl = new ZiDingYiControl();
        map.addControl(MyZiDingYiControl);

     

        function GuanBi() {
            $("#HuoWu").hide();
            $("#DingDan").show();
        }

        function JiSuanFeiYong() {
            PayName = $("#paymentid").find("option:selected").text();
            //BillName = $("#BillingMethod").find("option:selected").text();
            MoneyName = $("#transportmodeid").find("option:selected").text();

            Weight1 = $("#weight_1").val();
            Weight2 = $("#weight_2").val();
            Weight3 = $("#weight_3").val();
            if (Weight1 == "" || Weight1 == undefined) {
                Weight1 = 0;
            }
            if (Weight2 == "" || Weight2 == undefined) {
                Weight2 = 0;
            }
            if (Weight3 == "" || Weight3 == undefined) {
                Weight3 = 0;
            }
            var M = parseFloat(Weight1) + parseFloat(Weight2)
					+ parseFloat(Weight3);
            var Shu = 0;
            if (PayName == "到付") {
                Shu = 0.1;
            }
           // var Bill = parseInt(BillName.split('_')[0]);

            var ShouZhongMoney = parseInt(MoneyName.split(':')[1].split(':')[0]);
            var XuZhongFei = parseInt(MoneyName.split(':')[2]);

            var cost = ((ShouZhongMoney + (((M * 1.5) - 1) * XuZhongFei) )
					+ ((ShouZhongMoney + (((M * 1.5) - 1) * XuZhongFei)) * Shu)).toFixed(2);

            $("#transportcost").val(cost);
            $("#bargainmoney").val(
					 ((ShouZhongMoney + (((M * 1.5) - 1)* XuZhongFei) ) * Shu).toFixed(2));
            
            Weight1 = 0;
            Weight2 = 0;
            Weight3 = 0;
            cost = 0;
            Shu = 0;
            ShouZhongMoney = 0;
            XuZhongFei = 0;
        }

        $("#weight_1").change(function () {

            JiSuanFeiYong();

        });
        $("#weight_2").change(function () {

            JiSuanFeiYong();

        });
        $("#weight_3").change(function () {

            JiSuanFeiYong();

        });
        $("#paymentid").change(function () {

            JiSuanFeiYong();

        });
        $("#BillingMethod").change(function () {

            JiSuanFeiYong();

        });
        $("#transportmodeid").change(function () {

            JiSuanFeiYong();

        });
        function KaiShiYunSong() {
         layer.load();        
                    map.clearOverlays();
                    if (orderFormID > 0) {                              
                                map.clearOverlays();
                                $.post("${ctx}/OrderformController/updateProcuratory.do?orderFormID="
                                                        + orderFormID,
                                                function (data) {
                                                    if ((typeof data) == "string") {
                                                        data = JSON.parse(data);
                                                    }
                                                    if (data.state == true) {
                                                    $("#DiTu").show();
                                                    $("#goodsInfor").hide();
                                                        var driving = new BMap.DrivingRoute(
                                                                map,
                                                                {
                                                                    renderOptions: {
                                                                        map: map,
                                                                        panel: "result",
                                                                        autoViewport: true
                                                                    }
                                                                });
                                                        $("#result").parent().height(540);
                                                        if (takeAdress != undefined) {

                                                            if (WeiZhi != undefined) {
                                                            if (myXWeiZi!=""&&myXWeiZi!=undefined&&myYWeiZi!=""&&myYWeiZi!=undefined) 
                                                            {
                                                                var start = new BMap.Point(
                                                                        myXWeiZi,
                                                                        myYWeiZi);
                                                                var end = new BMap.Point(
                                                                        WeiZhi[2],
                                                                        WeiZhi[3]);
                                                               
                                                                driving.search(start, end);
                                                                $("#result").show();
                                                                 ReFresh();
                                                                 layer.closeAll('loading');
                                                              }else
                                                              { 
                                                              layer.closeAll('loading');
                                                              layer.alert("您的位置定位失败，请在网络好的地方进行定位！！",{ icon: 0,title: "提示", offset: '100px' });
                                                              
                                                              }
                                                            } else {
                                                                layer.closeAll('loading');
                                                                layer.alert("请刷新界面！！",{ icon: 0,title: "提示", offset: '100px' });
                                                            }

                                                        } else {
                                                            layer.closeAll('loading');
                                                            layer.alert("请选择你要接货的数据！！", { icon: 0,title: "提示", offset: '100px'});
                                                        }

                                                    } else {
                                                        layer.closeAll('loading');
                                                        layer.alert(data.msg, {
                                                            icon: 0,
                                                            title: "提示",
                                                            offset: '100px'
                                                        });

                                                    }

                                                });
                       
                    } else {
                    layer.closeAll('loading');
                        layer.alert("请选择一条数据！！", {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
                    }
               
        }

        function WenTi() {
            map.clearOverlays();
           
            if (receiptTime == null) {
                if (orderFormID > 0) {
                    
                    $("#modalone").modal("toggle");

                    $("#DingDanID").val(orderFormID);
                    getlocation();
                    $("#Location").val(DiZhi);

                } else {
                    layer.alert("请选择问题订单！！", {
                        icon: 0,
                        title: "提示",
                        offset: '100px'
                    });
                }
            } else {
                layer.alert("已经收货了！！", {
                    icon: 0,
                    title: "提示",
                    offset: '100px'
                });
            }
        }
        function WenTiQueDing() {
            var ForData = $("#WenTiFrom").serializeArray();
            $.post("${ctx}/OrderformController/question.do", ForData,
					function (data) {
					    if ((typeof data) == "string") {
					        data = JSON.parse(data);
					    }
					    if (data.state == true) {
					        if (layer.alert(data.msg, {
					            icon: 0,
					            offset: '100px',
					            btn: ["确定"]
					        }, function (layerIndex) {
								layer.close(layerIndex);//关闭提示框

								location.reload();
					        }))
					            ;
					        location.reload();
					    } else {
					        layer.alert(data.msg, {
					            icon: 0,
					            title: "提示",
					            offset: '100px'
					        });
					    }
					});
        }

        function refurbish() {
            getlocation();
            $("#Location").val(DiZhi);
        }

        function WanCheng() {
            
                    if (orderFormID > 0) {
                    
                     
                            if (layer.confirm("是否完成？？", {
                                icon: 0,
                                offset: '100px',
                                btn: ["确定", "取消"]
                            }, function (layerIndex) {
                                layer.close(layerIndex);//关闭提示框
                                $.post(
                                        "${ctx}/OrderformController/finishOrderForm.do?orderFormID="
                                                + orderFormID+"&nowAdress="+nowAdress, function (data) {

                                            if ((typeof data) == "string") {
                                                data = JSON.parse(data);
                             }
                                            if (data.state == true) {

                                                if (layer.alert(data.msg, {
                                icon:1,
                                offset: '100px',
                                btn: ["确定"]
                            }, function (layerIndex) {
                                                    layer.close(layerIndex);//关闭提示框

                                                    location.reload();
                            }))
                                ;
                            } else {
                             layer.msg(data.msg, {
                                icon: 0,
                                title: "提示",
                                offset: '100px'
                            });

                            }

                            });

                            }))
                                ;

                       

                    } else {
                        layer.alert("请选择一条数据！！", {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
                    }

            
        }

        function makeCollections() {
       
                if (orderFormID > 0) {
                    $("#modalfour").modal();
                    GetDateNow();

                    $("#WIDsubject").val("广发运输物流费用");
                    if (paymentID == 2) {
                        $("#WIDtotal_amount").val(transportCost);
                        $("#WIDbody").val("支付您的运输费用");
                    } else {
                        $("#WIDtotal_amount").val(bargainMoney);
                        $("#WIDbody").val("支付您的定金费用");
                    }

                } else {
                    layer.alert("请选择一条数据！！", {
                        icon: 0,
                        title: "提示",
                        offset: '100px'
                    });
                }
        }

        function GetDateNow() {
            var vNow = new Date();
            var sNow = "";
            sNow += String(vNow.getFullYear());
            sNow += String(vNow.getMonth() + 1);
            sNow += String(vNow.getDate());
            sNow += String(vNow.getHours());
            sNow += String(vNow.getMinutes());
            sNow += String(vNow.getSeconds());
            sNow += String(vNow.getMilliseconds());
            document.getElementById("WIDout_trade_no").value = sNow;
            //document.getElementById("WIDsubject").value = "测试";
            //document.getElementById("WIDtotal_amount").value = "0.01";
        }
        var JiLuID;
        function choose(ID) {

            if (ID != JiLuID) {

                $("#" + ID).css("border", "1px  solid red");
                $("#" + JiLuID).css("border", "1px  solid white");
                JiLuID = ID;
            } else {
                $("#" + ID).css("border", "1px  solid white");
                JiLuID = 0;
            }

            $("#select").val(ID);
        }

        function pay() {
            var select = $("#select").val();
            if (select == "Alipay") {

                $("#FormData").attr("action",
						"${ctx}/AlipayJsp/alipay.trade.page.pay.jsp");
                $("#FormData").ajaxSubmit();
            } else {
                return;
            }
        }

        function money() {
            if (orderFormID > 0) {

                $.post("${ctx}/OrderformController/money.do?orderFormID=" + orderFormID, function (data) {
                    if ((typeof data) == "string") {
                        data = JSON.parse(data);
                    }
                    if (data.state == true) {

                       layer.alert(data.msg, {
                            icon: 1,
                            offset: '100px',
                            btn: ["确定"]
                        }, function (layerIndex) {
                            layer.close(layerIndex);//关闭提示框

                            location.reload();
                        })
                            ;
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
        
        function ChaKanDaoHang() {
		//JiXuDaoHang();
		$("#result > div:first").show();
		$("#result").parent().height(540);

	}
	
	
	function detail(ID) {
		$("#goodsInfor").show();
		$("#DingDan").hide();
		  $("#HuoWu2").hide();
		   $("#HuoWu3").hide(); 
		   $("#question").hide(); 
		    $("#wenti1").hide();  
		    $("#wenti2").hide();  
		    $("#wenti3").hide();
		    $.post("${ctx}/ClientController/selectOrder.do?orderformid=" + ID, function (data) {
                $("div input").val("");
                if ((typeof data) == "string") {
                    data = JSON.parse(data);
                }
                statusid=data[0].statusid;
                orderFormID=data[0].orderformid;
                $("#JieHuo").hide();
                $("#upload").hide();
                $("#Quession").hide();
                $("#YunSong").hide();
                $("#ShouKuan").hide();
                $("#finishOrder").hide();
              
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

                }

                $("#paymentInformation").val("已收款："+information);
                if (data[0].iscancel==true) {
                    data[0].iscancel="已作废";
                }else
                {
                    data[0].iscancel="";
                }
                if (statusid==9) {
					$("#JieHuo").show();
				} else if(statusid==5&&data[0].isindeedupload==false) {
                   $("#upload").show();
                   $("#Quession").show();
                   
				}else if(data[0].isindeedupload==true&&statusid==5)
				{
				$("#ShouKuan").show();
				 if(information>0&&statusid==5)
				{
				$("#YunSong").show();$("#ShouKuan").hide();
				}
				}else
				 if(statusid==4)
				{
				 $("#Quession").show();
				
				}
				if(statusid==4||statusid==19)
				{
				 $("#finishOrder").show();
				}
			
                $("#title").text("订单状态：" + data[0].statusname+"(Tip:到达寄货位置时，与客户进行确认订单，上传货物信息！！)");
                $("#title").css("color", "red"); data[0].audittime=ChangeDateFormat(data[0].audittime);
                data[0].uploadtime=ChangeDateFormat(data[0].uploadtime);
                data[0].deliverytime=ChangeDateFormat(data[0].deliverytime);
                data[0].receipttime=ChangeDateFormat(data[0].receipttime);
               
                $("#isupload").val(data[0].isindeedupload==true?"已上传":"未上传");
                $("#isaudit").val(data[0].isauditing==true?"已审核":"未审核");
                loadDataToForm("aspnetForm", data[0]);
                
                serachlocal(data[0].takeadress);
                takeAdress=data[0].takeadress;
                
                var HuoWu = data[1];
                if (HuoWu.length>0) {
					
				
                for (var i = 0; i < HuoWu.length; i++) {
                    if (i == 0) {
                        $("#goodName_1").val(HuoWu[i].mrchandisename);
                        $("#mrchandiseid_1").val(HuoWu[i].mrchandiseid);
                        $("#goodType_1").val(HuoWu[i].mrchandisetypeid);
                        $("#weight_1").val(HuoWu[i].weight);
                        $("#volume_1").val(HuoWu[i].volume );
                        $("#quantity_1").val(HuoWu[i].quantity);
                        $("#ordertailid_1").val(HuoWu[i].orderformdetailid);
                        
                        QuFen=1;
                    }
                    if (i == 1) {
                        $("#HuoWu2").show(); 
                        $("#goodName_2").val(HuoWu[i].mrchandisename);
                        $("#goodType_2").val(HuoWu[i].mrchandisetypeid);
                        $("#weight_2").val(HuoWu[i].weight );
                        $("#volume_2").val(HuoWu[i].volume);
                         $("#quantity_2").val(HuoWu[i].quantity );
                          $("#mrchandiseid_2").val(HuoWu[i].mrchandiseid);
                            $("#ordertailid_2").val(HuoWu[i].orderformdetailid);
                          QuFen=2;
                    }
                    if (i == 2) {
                        $("#HuoWu3").show();
                        $("#goodName_3").val(HuoWu[i].mrchandisename);
                        $("#goodType_3").val(HuoWu[i].mrchandisetypeid);
                        $("#weight_3").val(HuoWu[i].weight);
                        $("#volume_3").val(HuoWu[i].volume ); 
                        $("#quantity_3").val(HuoWu[i].quantity );
                         $("#mrchandiseid_3").val(HuoWu[i].mrchandiseid);
                           $("#ordertailid_2").val(HuoWu[i].orderformdetailid);
                         QuFen=3;
                    }

                }
                }
                var wenti=data[2];
                if (wenti.length>0) {
					 $("#question").show(); 
				
                 for ( var i = 0; i < wenti.length; i++) {
					    if (i == 0) {
					    $("#wenti1").show();
                        $("#problem_1").val(wenti[i].reason);
                        $("#prolocation_1").val(wenti[i].orderformlocation);
                        $("#solve_1").val(wenti[i].issolve=="false"? "未解决":"已解决");
                        $("#solution_1").val(wenti[i].solutionman);
                    }
                    if (i == 1) {
                        $("#wenti2").show();
                        $("#problem_2").val(wenti[i].reason);
                        $("#prolocation_2").val(wenti[i].orderformlocation);
                     $("#solve_2").val(wenti[i].issolve=="false"? "未解决":"已解决");
                     $("#solution_2").val(wenti[i].solutionman);
                    }
                    if (i == 2) {
                        $("#wenti3").show();
                        $("#problem_3").val(wenti[i].reason);
                        $("#prolocation_3").val(wenti[i].orderformlocation);
                      $("#solve_3").val(wenti[i].issolve=="false"? "未解决":"已解决");
                      $("#solution_3").val(wenti[i].solutionman);
                    }
				}}
        
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
                    
                    loadDataToForm("aspnetForm", cancel[0]);

                }
            });
	}
	
	function back() {
		$("#DingDan").show();
		$("#goodsInfor").hide();
		$("#DiTu").hide();
		
	}
	function Upload() {
	if (statusid==5) {
	    layer.msg("可以修改订单的信息了！！！", {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
	     
		 $("form :input").removeAttr("disabled");
		 $("form :input").removeAttr("readonly");
		 $("#btn").hide();
		 $("#yes").show();
		 $(".add").show();
		 $(".wenti").hide();
		 $("#transportcost").attr("readonly","readonly");
		 $("#bargainmoney").attr("readonly","readonly");
		 $("#transportcost").attr("readonly","readonly");
		 scrollTo(".container-fluid",1000);
		 $(".wenti1").hide();
		  $("#cancel").hide();
		  $("#auditupload").hide();
		  $("#orderinfo").hide();
		  $("#custom").hide();
	} else {
	   if (statusid==4) {
		
	
        layer.msg("此订单已经上传过了，不用再次上传了！！！", {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
                        } else {
                        if (statusid==13) {
							 layer.msg("此订单你还没有接受，不可以上传！！！", {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
						}

	}
	}
	
	}
	
	function Determine() {
		
            var ForData = $("#aspnetForm").serializeArray();
           layer.alert("是否修改？？",{icon:0,title:"提示：",btn:["确定","取消"],offset:'100px'},function(layerIndex)
            {
            layer.close(layerIndex);
            
            $.post("${ctx}/OrderformController/updateOrderForm.do",
					ForData, function (data) {

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
					        })) ;

					    } else {
					        layer.msg(data.msg, {
					            icon: 0,
					            title: "提示",
					            offset: '100px'
					        });

					    }

					});
					});
	}
	function cancel() {
		 $("#btn").show();
		 $("#yes").hide();
		 detail($("#orderformid").val());
		  $("form :input").attr("disabled","disabled");
		 $("form :input").attr("readonly","readonly");
		 $(".add").hide();
		  $(".wenti1").show();
		  $(".wenti2").hide();
		  $(".wenti3").hide();
		  $("#cancel").show();
		  $("#auditupload").show();
		  $("#orderinfo").show();
		  $("#custom").show();
	}
	
	function Add() {

			if (QuFen == 1) {
				$("#HuoWu2").show();
				QuFen = 2;
			} else if (QuFen == 2) {
				$("#HuoWu3").show();
				QuFen = 3;
			} else {
				layer.msg("只能填写3个货物！！！", {
                            icon: 0,
                            title: "提示",
                            offset: '100px'
                        });
			}

		}
		
		function Reduce() {
			if (QuFen > 0) {
				if (QuFen == 3) {
					$("#HuoWu3").hide();
					$("#HuoWu3 input").val("");
					QuFen = 2;
				} else if(QuFen==2) {
					$("#HuoWu2").hide();
					$("#HuoWu2 input").val("");
					QuFen = 1;
				}
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
		function refresh() {
			TabOrderForm.draw(false);
		}
    </script>
</body>
</html>
