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

<title>录入新订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" type="text/css" href="${ctx }/Content/css/WTMap.css">

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

#WTMap_Main,#WTMap_Close {
	margin-top: -200px
}

#WTMap_btnReturn {
	margin-top: -198px;
	margin-left: 10px
}

#WTMap_Top {
	height: 60px
}
</style>
</head>

<body>
	<div id="goodsInfor" style="border: 1px solid #efeef0; ">

		<form id="aspnetForm" class="form-horizontal " onsubmit="return false">
			<h4 id="title"></h4>

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
									<select class="form-control" id="customid" name="customid"
										onchange="choose(this.id)">
										<option>---请选择---</option>
										<c:forEach items="${customlist}" var="list">
											<option value="${list.getCustomid()}"
												id="${list.getCustomphonenumber()}">${list.getCustomname()}</option>

										</c:forEach>
									</select>

								</div>

								<label class="control-label col-sm-2 col-lg-1  col-md-1 col-xs-3">联系电话：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="customphonenumber"
										name="customphonenumber" onkeyup="keypressPhone(event,this)"
										onbeforepaste="clipboardData.setData('text', clipboardData.getData('text').replace(/[^\d]/g, ''))"
										maxlength="11" readonly="readonly" />
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
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">出发地：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input id="tc_from" name="tc_from" type="text"
										wtmap="{c:&#39;tc_from&#39;,cb:true}" class="form-control"
										placeholder="请选择省-市-县" />
								</div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">详细地址：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="sendadress" maxlength="100" />
								</div>



							</div>
							<div class="form-group">
								<div class="col-sm-2 col-lg-2  col-md-2 col-xs-2"></div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">到达地：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input id="tc_to" name="tc_to" type="text" type="text"
										wtmap="{c:&#39;tc_to&#39;,cb:true}" class="form-control"
										placeholder="请选择省-市-县" />
								</div>

								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">详细地址：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" name="takeadress" maxlength="100"
										onchange="checkRote()" onmouseout="checkRote()" />
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
						货物信息<a href="javascript:void(0);" class="add"> <img
							src="${ctx }/Content/image/123.jpg" width="30px;" height="30px"
							onclick="Add()" /> </a> <a class="add" href="javascript:void(0);"> <img
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
								<input class="form-control" id="goodName_1" maxlength="20"
									name="Mrchlist[0].mrchandisename" />
							</div>


							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物类型：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<select class="form-control" id="goodType_1"
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
								<input class="form-control" id="weight_1" maxlength="4"
									name="orderformdetaillist[0].weight"
									onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" /> <input
									class="hidden" id="ordertailid_1"
									name="orderformdetaillist[0].orderformdetailid" />
							</div>
							<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物体积：</label>
							<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
								<input class="form-control" id="volume_1" maxlength="4"
									name="orderformdetaillist[0].volume"
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
								<input class="form-control" id="quantity_1" maxlength="4"
									name="orderformdetaillist[0].quantity"
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
									<input class="form-control" id="goodName_2" maxlength="10"
										name="Mrchlist[1].mrchandisename" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物类型：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<select class="form-control" id="goodType_2"
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
									<input class="form-control" id="weight_2" maxlength="4"
										name="orderformdetaillist[1].weight"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" /><input
										class="hidden" id="ordertailid_2"
										name="orderformdetaillist[1].orderformdetailid" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物体积
									：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="volume_2" maxlength="4"
										name="orderformdetaillist[1].volume"
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
									<input class="form-control" id="quantity_2" maxlength="4"
										name="orderformdetaillist[1].quantity"
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
									<input class="form-control" id="goodName_3" maxlength="10"
										name="Mrchlist[2].mrchandisename" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物类型：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<select class="form-control" id="goodType_3"
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
									<input class="form-control" id="weight_3" maxlength="4"
										name="orderformdetaillist[2].weight"
										onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
										onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" /><input
										class="hidden" id="ordertailid_3"
										name="orderformdetaillist[2].orderformdetailid" />
								</div>
								<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">货物体积：</label>
								<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
									<input class="form-control" id="volume_3" maxlength="4"
										name="orderformdetaillist[2].volume"
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
									<input class="form-control" id="quantity_3" maxlength="4"
										name="orderformdetaillist[2].quantity"
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
							<input class="form-control" name="sendname" maxlength="20" />
						</div>

						<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">
							寄货人（公司）电话：</label>
						<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
							<input class="form-control" name="sendphonenumber"
								onkeyup="keypressPhone(event,this)"
								onbeforepaste="clipboardData.setData('text', clipboardData.getData('text').replace(/[^\d]/g, ''))"
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
							<input class="form-control" name="takename" maxlength="20" />
						</div>
						<label class="control-label col-sm-2 col-lg-2  col-md-2 col-xs-2">收货人（公司）电话：</label>
						<div class="col-lg-2  col-md-2 col-xs-2 col-sm-2  interval">
							<input class="form-control" name="takephonenumber"
								onkeyup="keypressPhone(event,this)"
								onbeforepaste="clipboardData.setData('text', clipboardData.getData('text').replace(/[^\d]/g, ''))"
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
							<input class="form-control" name="remark" maxlength="100" />
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
							<select class="form-control" id="transportmodeid" name="transportmodeid">
								<c:forEach items="${Tplllist}" var="list">
									<option value="${list.getTransportmodeid()}">${list.getTransportmodename()}_首重费:${list.getFirstcharge()
										}，续重费:${list.getRenewalfee() }</option>
								</c:forEach>
							</select>
						</div>
						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">支付方式：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<select class="form-control" id="paymentid" name="paymentid">
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
							<input class="form-control" id="transportcost" name="transportcost" />

						</div>
						<label class="control-label col-sm-1 col-lg-1  col-md-1 col-xs-1">定&emsp;&emsp;金：</label>
						<div class="col-lg-3  col-md-3 col-xs-3 col-sm-3  interval">
							<input class="form-control" id="bargainmoney" name="bargainmoney" />
						</div>
					</div>
				</div>

			</div>
		</form>



		<div>
			<button class="btn btn-info" style="margin-left: 45%" onclick="QueDing()">新增</button>

		</div>
	</div>



	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script src="${ctx }/Content/js/WTMap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var QuFen = 1;
		function Add() {

			if (QuFen == 1) {
				$("#HuoWu2").show();
				QuFen = 2;
			} else if (QuFen == 2) {
				$("#HuoWu3").show();
				QuFen = 3;
			} else {
				layer.msg("只能填写3个货物！！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}

		}

		function Reduce() {
			if (QuFen > 0) {
				if (QuFen == 3) {
					$("#HuoWu3").hide();
					$("#HuoWu3 input").val("");
					QuFen = 2;
				} else if (QuFen == 2) {
					$("#HuoWu2").hide();
					$("#HuoWu2 input").val("");
					QuFen = 1;
				}
			}
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

			var cost = ((ShouZhongMoney + (((M * 1.5) - 1) * XuZhongFei)) + ((ShouZhongMoney + (((M * 1.5) - 1) * XuZhongFei)) * Shu))
					.toFixed(2);

			$("#transportcost").val(cost);
			$("#bargainmoney").val(
					((ShouZhongMoney + (((M * 1.5) - 1) * XuZhongFei)) * Shu)
							.toFixed(2));

			Weight1 = 0;
			Weight2 = 0;
			Weight3 = 0;
			cost = 0;
			Shu = 0;
			ShouZhongMoney = 0;
			XuZhongFei = 0;
		}

		$("#weight_1").change(function() {

			JiSuanFeiYong();

		});
		$("#weight_2").change(function() {

			JiSuanFeiYong();

		});
		$("#weight_3").change(function() {

			JiSuanFeiYong();

		});
		$("#paymentid").change(function() {

			JiSuanFeiYong();

		});

		$("#transportmodeid").change(function() {

			JiSuanFeiYong();

		});
		function choose(ID) {
			$("#customphonenumber").val("");
			var objS = document.getElementById(ID);
			var grade = objS.options[objS.selectedIndex].id;
			$("#customphonenumber").val(grade);
		}

		function QueDing() {

			if ($("#customid").val() != "---请选择---") {

				var ForData = $("#aspnetForm").serializeArray();

				layer
						.alert(
								"是否新增？？",
								{
									icon : 0,
									title : "提示：",
									offset : '100px',
									btn : [ "确定", "取消" ]
								},
								function(index) {
									layer.close(index);

									$
											.post(
													"${ctx}/OrderFormDisposeController/insertOrderForm.do",
													ForData,
													function(data) {

														if ((typeof data) == "string") {
															data = JSON
																	.parse(data);
														}
														if (data.state == true) {
															if (layer
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
																			}))
																;

														} else {
															layer
																	.alert(
																			data.msg,
																			{
																				icon : 0,
																				title : "提示",
																				offset : '100px'
																			});

														}

													});
								});
			} else {
				layer.alert("请选择客户！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function checkRote() {
			var startName = $("#tc_from").val();
			var endName = $("#tc_to").val();
			$.get("${ctx}/ClientController/selectRoute.do?startIndex=0"
					+ "&pageSize=100000" + "&startName=" + startName
					+ "&endName=" + endName, function(data) {
				if (data == null || data == "" || data == "[]") {
					layer.alert("暂未开通之路线，请选择其他路线", {
						icon : 0,
						offset : '100px',
						title : "提示："
					});
				}

			});

		}
	</script>
</body>
</html>
