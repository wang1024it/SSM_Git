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
<style>
body {
	font-size: 12px;
}

ul li {
	list-style: none;
}

.track-rcol {
	width: 900px;
	border: 1px solid #eee;
}

.track-list {
	margin: 20px;
	padding-left: 5px;
	position: relative;
}

.track-list li {
	position: relative;
	padding: 9px 0 0 25px;
	line-height: 18px;
	border-left: 1px solid #d9d9d9;
	color: #999;
}

.track-list li.first {
	color: red;
	padding-top: 0;
	border-left-color: #fff;
}

.track-list li .node-icon {
	position: absolute;
	left: -6px;
	top: 50%;
	width: 11px;
	height: 11px;
	background: url(${ctx}/Content/image/order-icons.png) -21px -72px
		no-repeat;
}

.track-list li.first .node-icon {
	background-position: 0 -72px;
}

.track-list li .time {
	margin-right: 20px;
	position: relative;
	top: 4px;
	display: inline-block;
	vertical-align: middle;
}

.track-list li .txt {
	max-width: 600px;
	position: relative;
	top: 4px;
	display: inline-block;
	vertical-align: middle;
}

.track-list li.first .time {
	margin-right: 20px;
}

.track-list li.first .txt {
	max-width: 600px;
}
</style>

<title>物流信息</title>

<link href="${ctx }/Content/css/Memberpublic.css" rel="stylesheet" />


<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx }/Content/css/memberlogin.css"
	type="text/css"></link>



<link href="${ctx }/Content/css/WTMap.css" rel="stylesheet" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb">
	
</script>
</head>

<body>
	<form name="aspnetForm" method="post" onsubmit="return false" action=""
		id="aspnetForm"></form>

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
					href="${ctx }/ClientController/myOrder.do">我的订单</a>
				</li>
				<li class="top_list2 sel"><a
					href="${ctx }/ClientController/personalCenter.do" class="tubiao">个人中心</a>
				</li>
				<li class="top_list2 sel"><a href="${ctx }/FrontJsp/HomePage.jsp"
					class="tubiao">返回首页</a>
				</li>

			</ul>
		</div>
	</div>
	<div class="wdBanner"></div>
	<div>
		<form class="form-horizontal" onsubmit="return false">

			<div class="form-group">
				<div style="margin: 0 auto;">
					<label class="control-label col-lg-4 col-sm-4 col-md-4">请选择您的订单：</label>
					<div class="col-lg-4 col-sm-4 col-md-4">
						<select class="form-control" onchange="Change(this.value)">
							<option value="0">---请选择---</option>
							<c:forEach items="${Orderlist}" var="list">
								<option value="${list.getOrderformid()}">${list.getOrdernumber()}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="track-rcol" style="margin: 0 auto;">
				<div class="track-list" id="AppendList"></div>
			</div>
			<div id="DiTu">
				<div style=" width:100%;height:550px;border:#ccc soliud 1px;"
					id="dituContent"></div>
				<button class="btn btn-info" onclick="ChaKanDaoHang()">查看导航信息</button>
			</div>
		</form>
	</div>
	<div class="cl"></div>
	<div class="foot_login">
		<a href="${ctx }/FrontJsp/AboutUs.jsp" target="_blank">关于我们</a> | <a href="${ctx }"
			title="挑错有礼" target="_blank"><font>挑错有礼</font> </a> | <a
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

	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/OpenMap.js"></script>

	<script type="text/javascript" src="${ctx}/Content/layer/layer.js"></script>

	<script type="text/javascript">
		var WeiZhi;
		var myXWeiZi;
		var myYWeiZi;
		var Distinguish;
		var CustomName = '${sessionScope.custom.getCustomname()}';
		var sendAdress;
		var takeAdress;
		var Institutionalorganizationid = 0;
		var car; //汽车图标

		var centerPoint;
		var timer; //定时器
		var index = 0; //记录播放到第几个point
		var points;
		$(function() {
			if (CustomName == null || CustomName == "") {
				window.location.href = "${ctx}/FrontJsp/CustomLogin.jsp";

			} else {
				$("#dengLu")
						.append(
								' <a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span ><a class="denLu  ">'
										+ CustomName
										+ ',您好!</a> &nbsp;&nbsp; <a href="javascript:void(0);" class="zhuCe  " onclick="cancellation()">注销</a></span>');
			}
			$("#DiTu").show();
			initMap();//创建和初始化地图

		});

		function DaoHang() {

			map.clearOverlays();
			var driving = new BMap.DrivingRoute(map, {
				renderOptions : {
					map : map,
					panel : "result",
					autoViewport : true
				}
			});
			if (WeiZhi.length == 4) {

				var start = new BMap.Point(WeiZhi[0], WeiZhi[1]);

				var end = new BMap.Point(WeiZhi[2], WeiZhi[3]);

				driving.search(start, end);
				driving
						.setSearchCompleteCallback(function() {
							//得到路线上的所有point
							points = driving.getResults().getPlan(0)
									.getRoute(0).getPath();
							//画面移动到起点和终点的中间
							centerPoint = new BMap.Point(
									(WeiZhi[0] + WeiZhi[2]) / 2,
									(WeiZhi[1] + WeiZhi[3]) / 2);
							map.panTo(centerPoint);
							//连接所有点
							map.addOverlay(new BMap.Polyline(points, {
								strokeColor : "blue",
								strokeWeight : 5,
								strokeOpacity : 1
							}));
							var myiocn = new BMap.Icon(
									"http://developer.baidu.com/map/jsdemo/img/car.png",
									new BMap.Size(52, 30), {
										offset : new BMap.Size(10, 15)
									// 指定定位位置

									// 设置图片偏移
									});
							//显示小车子
							// 					label = new BMap.Label("car", {
							// 						offset : new BMap.Size(-20, -20)
							// 					});
							car = new BMap.Marker(points[0], {
								icon : myiocn
							});

							map.addOverlay(car);
							play(index);
						});

				//	if (new RegExp(sendAdress).test(Distinguish)) {
				// 				driving.search(end, start);
				// 			} else {

				// 			}

			}
		}
		function play(index) {
			var point = points[index];
			if (index > 0) {
				map.addOverlay(new BMap.Polyline([ points[index - 1], point ],
						{
							strokeColor : "red",
							strokeWeight : 1,
							strokeOpacity : 1
						}));
			}

			car.setPosition(point);
			index++;

			map.panTo(point);

			if (index < points.length) {
				timer = window.setTimeout("play(" + index + ")", 100);
			} else {

				map.panTo(point);
			}
		}

		function YiCang() {
			$("#result > div:first").hide();
			$("#result").parent().height(0);
			//map.removeControl(MyZiDingYiControl);
		}
		function ChaKanDaoHang() {
			DaoHang();

		}

		function confirmGather() {
			var OrderFormID = $("#OrderFormID").val();

			if (OrderFormID > 0) {

				layer.confirm("是否收货？？", {
					icon : 0,
					btn : [ "确定", "取消" ],
					offset : '100px'
				}, function(layerIndex) {
					layer.close(layerIndex);
					$.post(
							"${ctx}/servlet/homePageServlet?Type=gather&OrderFormID="
									+ OrderFormID,

							function(data) {

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
				layer.alert("没有数据，怎么收货！！", {
					icon : 0,
					title : "提示",
					offset : '100px'
				});
			}
		}

		function Change(ID) {
			$("#DiTu").show();

			if (ID > 0) {
				$("#AppendList").empty();

				$("#SendAdress").val("");
				$("#TakeAdress").val("");
				YiCang();
				$
						.post(
								"${ctx}/ClientController/getLogisticsInformation.do?OrderFormID="
										+ ID,
								function(data) {

									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									sendAdress = data[2];
									serachlocal(sendAdress);
									takeAdress = data[1];

									serachlocal(takeAdress);
									data = data[0];
									if (data != "") {

										var length = data.length;
										for ( var i = 0; i < data.length; i++) {
											var uploadTime = ChangeDateFormat(data[i].uploadlogisticstime);
											$("#AppendList")
													.append(
															'<ul><li id="'+i+'" ><i class="node-icon"></i> <span class="time">'
																	+ uploadTime
																	+ '</span> <span class="txt">'
																	+ data[i].specificinformation
																	+ '</span></li></ul>');
											if (i == length - 1) {
												$("#" + i).addClass("first");

											}
										}
										DaoHang();
									} else {

										$("#DiTu").hide();
										$("#AppendList").append(
												'<div > 暂时没有物流信息</div>');
									}

								});

			} else {

				$("#SendAdress").val("");
				$("#TakeAdress").val("");
				$("#AppendList").empty();

				$("#DiTu").hide();
				$("#AppendList").append('<div > 请选择订单号码</div>');
			}
		}
		function cancellation() {
			$.post("${ctx}/ClientController/cancellation.do", function(data) {
				if (data == "true") {
					location.reload();
				}
			});

		}
	</script>
</body>
</html>
