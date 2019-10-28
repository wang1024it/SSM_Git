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

<title>运输员工首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>


<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script>


<!--百度地图API
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
    <script type="text/javascript"src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>

    -->

<link rel="stylesheet" href="${ctx }/Content/css/Map.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/paging.css" type="text/css"></link>
<style type="text/css">
.content {
	padding: 0px;
	margin: :0px;
}

* {
	font-family: "华文中宋";
}

li {
	display: inline-block
}

.Sup1 {
	width: 10%;
}

.Sup2 {
	width: 15%;
}

.Sup3 {
	width: 25%;
}

.Sup4 {
	width: 25%;
}

.SupplyInfor_th {
	padding: 0px 10px;
	height: 35px;
	line-height: 35px;
	background: #eaeaea;
	color: #666666;
	border-top: 1px solid #bfc6cd;
	font-size: 14px;
	width: 100%
}

.SupplyInfor_source {
	padding: 0 10px 0 10px;
	height: 60px;
	line-height: 20px;
	border-bottom: 1px #eeeeee dashed;
	font-size: 14px;
}

.SupList1 {
	width: 10%;
	padding-top: 10px;
}

.SupList2 {
	width: 15%;
	padding-top: 10px;
}

.SupList3 {
	width: 25%;
	padding-top: 10px;
}

.SupList4 {
	width: 25%;
	padding-top: 10px;
}

.SupList5 {
	width: 20%;
	padding-top: 10px;
}

.SupplyInfor_source li,.SupplyInfor_source li a {
	color: #333;
}

.SupList9 a {
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

.container-fluid {
	padding: 0px;
	margin: 0px;
}

.btn-primary {
	background-color: #33AECC;;
	padding: 5px;
	border-radius: 12px 12px 12px 12px;
}
</style>
</head>

<body>
	<div>

		<div id="NeiRong">


			<div class=" col-lg-12 col-sm-12 col-md-12 col-xs-12"
				style="padding: 0px;margin: 0px">
				<div id="divWdList">
					<div class="webList" id="webList"></div>
				</div>
				<div class="box" id="box"></div>

			</div>
		</div>
		<div id="DiTu" style="display: none;">
			<div style=" margin-top: 20px; width:100%;height:90%;border:#ccc soliud 1px;"
				id="dituContent"></div>
			<button class="btn btn-info" onclick="ChaKanDaoHang()">查看导航信息</button>
			<button class="btn btn-info" style="margin-left: 20px" id="LTS"
				onclick="DaoHang(this.id)">我的位置到取货位置</button>
			<button class="btn btn-info" style="margin-left: 20px" id="LTT"
				onclick="DaoHang(this.id)">我的位置到收货位置</button>
			<button class="btn btn-info" style="margin-left: 20px" id="STT"
				onclick="DaoHang(this.id)">取货位置到收货位置</button>

			<button class="btn btn-info" onclick="back()">返回</button>
		</div>

		<div class="modal fade" id="modalone">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">订单提示：</h4>
					</div>
					<div class="modal-body">
						<p id="tip">您有一个订单已经开始运输，是否继续导航？</p>
					</div>
					<div class="modal-footer">
						<p style="display: inline-block;"></p>
						<button class="btn btn-info" onclick="JiXuDaoHang()">Yse</button>
						<button class="btn btn-info" onclick="GuanBi()">No</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/paging.min.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/OpenMap.js"></script>
<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
<script type="text/javascript">
	var WeiZhi = new Array();

	var orderFormID;
	var map;
	var myXWeiZi = 0;
	var myYWeiZi = 0;
	var localMC;
	var TakeAdress = '${TakeAdress}';
	var Return = '${Return}';
	var Institutionalorganizationid = parseInt('${user.getInstitutionalorganizationid()}');
	var pageSize = 10;
	var curPage = 1;
	var setTotalCount = 0;
	var ZongYeShu = 0;
	$(function() {
		var height = (window.screen.height - 400);
		$("#box").css("margin-top", height);
		selectInfor(curPage - 1, pageSize);

		$("#NeiRong").show();

		try {
			initMap();//创建和初始化地图

			if (TakeAdress != undefined && TakeAdress != "") {

				$("#modalone").modal("toggle");
				$("#tip").text("您有一个订单已经开始运输，是否继续导航？");
				serachlocal(TakeAdress);
			} else {
				if (Return != undefined && Return != '' && Return != null) {
					$("#modalone").modal("toggle");
					$("#tip").text("订单已作废，是否导航回接货位置？");
					serachlocal(Return);
				}
			}
		} catch (e) {
			layer.closeAll('loading');
			layer.alert("地图加载失败，请刷新界面！！", {
				icon : 0,
				title : "提示",
				offset : '100px',
				btn : [ "确定" ]
			}, function(index) {
				layer.close(index);
				location.reload();
			});
		}
	});

	function selectInfor(startIndex, pageSize) {
		$("#page_num").empty();
		$
				.post(
						"${ctx}/TransportController/getList.do?pageSize="
								+ pageSize + "&curPage=" + curPage,
						function(data) {
							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}

							$("#webList").empty();
							setTotalCount = data.totalRows;
							ZongYeShu = Math.ceil(data.totalRows / pageSize);
							data = data.data;
							$("#webList")
									.append(
											'<ul class="SupplyInfor_th"><li class="Sup1" style="text-align: center">客户名称</li><li class="Sup2" style="text-align: center">订单号码</li><li class="Sup3" style="text-align: center">发货地点</li><li class="Sup4" style="text-align: center">收货地点</li><li class="Sup4" style="text-align: center">操作</li></ul>');
							if (data.length > 0) {

								serachlocal(data[0].sendadress);
								TakeAdress = data[0].takeadress;
								for ( var i = 0; i < data.length; i++) {

									$("#webList")
											.append(
													'<ul class="SupplyInfor_source SupplyInfor_zx"><li class="SupList1" style="text-align: center"><a href="#">'
															+ data[i].customname
															+ '</a> </li> <li style="text-align: center" class="SupList2"<span>'
															+ data[i].ordernumber
															+ '</span></li>  <li style="text-align: center" class="SupList3"><span>'
															+ data[i].sendadress
															+ '</span></li>  <li style="text-align: center"  class="SupList4">'
															+ data[i].takeadress
															+ '</li><li  style="text-align: center;" class="SupList5"> <button  id="accept" value="'
															+ data[i].orderformid
															+ '" onclick="QueDing(this.id,value)" class="btn btn-primary"><a href="javascript:void(0)" >接受</a></button> <button id="refuse" value="'
															+ data[i].orderformid
															+ '"  onclick="QueDing(this.id,value)" class="btn btn-primary"><a href="javascript:void(0)" >拒绝</a></button> <button    class="btn btn-primary" onclick="mapView()"  ><a href="javascript:void(0)" >地图查看</a></button></li></ul>');
								}
								generate();
							} else {
								$("#webList")
										.append(
												'<div ><div><img style="margin-left:40%;margin-top:10%" src="${ctx}/Content/image/ryNone.jpg"  /></div> <a style="margin-left:42%;margin-top:30%">暂时没有查询委托的订单</a></div>');
							}
						});
	}

	function generate() {
		$('#box').paging({
			initPageNo : curPage - 1, // 初始页码
			totalPages : ZongYeShu, //总页数
			totalCount : '合计' + setTotalCount + '条数据', // 条目总数
			slideSpeed : 600, // 缓动速度。单位毫秒
			jump : true, //是否支持跳转
			callback : function(page) { // 回调函数

			}
		});

	}

	function JiXuDaoHang() {
		$("#DiTu").show();
		$("#NeiRong").hide();
		$("#modalone").modal("toggle");
		var driving = new BMap.DrivingRoute(map, {
			renderOptions : {
				map : map,
				panel : "result",
				autoViewport : true
			}
		});
		$("#result").parent().height(540);
		if (TakeAdress != undefined) {

			if (WeiZhi != undefined) {
				var start = new BMap.Point(myXWeiZi, myYWeiZi);
				var end = new BMap.Point(WeiZhi[0], WeiZhi[1]);
				driving.search(start, end);
				$("#result").show();

			} else {
				layer.alert("请刷新界面！！", {
					icon : 0,
					title : "提示",
					offset : '30px'
				});
			}

		} else {
			layer.msg("请选择你要接货的数据！！", {
				icon : 0,
				title : "提示",
				offset : '30px'
			});
		}

	}
	function GuanBi() {
		$("#modalone").modal("toggle");

	}

	function QueDing(ID, value) {

		if (value > 0) {
			if ("accept" == ID) {
				if (layer.confirm("是否接受？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框
					$.post("${ctx}/TransportController/update.do?orderFormID="
							+ value + "&status=accept", function(data) {

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
							layer.msg(data.msg, {
								icon : 0,
								title : "提示",
								offset : '30px'
							});

						}

					});
				}))
					;

			} else {
				if (layer.confirm("是否拒绝？？", {
					icon : 0,
					offset : '100px',
					btn : [ "确定", "取消" ]
				}, function(layerIndex) {
					layer.close(layerIndex);//关闭提示框
					$.post("${ctx}/TransportController/update.do?orderFormID="
							+ value + "&status=refuse", function(data) {

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
							layer.msg(data.msg, {
								icon : 0,
								title : "提示",
								offset : '30px'
							});

						}

					});
				}))
					;

			}
		} else {
			layer.alert("请选择你需要操作的数据！！！！！", {
				icon : 0,
				title : "提示",
				offset : '30px'
			});
		}
	}

	function DaoHang(ID) {

		map.clearOverlays();
		var driving = new BMap.DrivingRoute(map, {
			renderOptions : {
				map : map,
				panel : "result",
				autoViewport : true
			}
		});
		$("#result").parent().height(540);
		ZiDingYiControl();
		if (WeiZhi != undefined && WeiZhi != "") {
			if (myXWeiZi > 0 && myYWeiZi > 0) {

				if (ID == "LTS") {
					var start = new BMap.Point(myXWeiZi, myYWeiZi);
					var end = new BMap.Point(WeiZhi[0], WeiZhi[1]);
					driving.search(start, end);

				} else if (ID == "LTT") {
					var start = new BMap.Point(myXWeiZi, myYWeiZi);
					var end = new BMap.Point(WeiZhi[2], WeiZhi[3]);
					driving.search(start, end);

				} else {

					var start = new BMap.Point(WeiZhi[0], WeiZhi[1]);
					var end = new BMap.Point(WeiZhi[2], WeiZhi[3]);
					driving.search(start, end);

				}
			} else {
				layer.msg("定位您所在位置失败，无法导航！！", {
					icon : 0,
					title : "提示",
					offset : '30px'
				});
			}
		} else {
			layer.msg("请选择一条数据", {
				icon : 0,
				title : "提示",
				offset : '30px'
			});
		}

	}

	function souSuo() {
		serachlocal($("#searchtext").val());
	}

	function YiCang() {
		$("#result > div:first").hide();
		$("#result").parent().height(0);
		//map.removeControl(MyZiDingYiControl);
	}
	function ChaKanDaoHang() {
		//JiXuDaoHang();
		$("#result > div:first").show();
		$("#result").parent().height(540);

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
	ZiDingYiControl.prototype.initialize = function(map) {
		// 创建一个DOM元素
		var div = document.createElement("div");
		div.innerHTML = "<div id='result' style='overflow:auto'></div>";
		div.style.overflow = "auto";
		div.style.height = "540px";
		div.style.width = "300px";
		div.onclick = function(e) {

			YiCang();
		}
		// 添加DOM元素到地图中
		map.getContainer().appendChild(div);

		// 将DOM元素返回
		return div;
	}
	var MyZiDingYiControl = new ZiDingYiControl();
	map.addControl(MyZiDingYiControl);

	function back() {
		$("#DiTu").hide();
		$("#NeiRong").show();
	}

	function mapView() {
		serachlocal(TakeAdress);
		$("#DiTu").show();
		$("#NeiRong").hide();
	}
</script>
</html>
