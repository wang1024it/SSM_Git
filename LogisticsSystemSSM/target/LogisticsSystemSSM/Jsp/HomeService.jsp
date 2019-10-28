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

<title>客服员工首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${ctx }/Content/css/Memberpublic.css" rel="stylesheet" />


<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script>


<!--百度地图API
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<script type="text/javascript"src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>

-->


<style type="text/css">
* li {
	font-family: "华文中宋";
}

a {
	font-family: "华文中宋";
}

button {
	font-family: "华文中宋";
}

.logisticsLine .Sup1 {
	width: 15%;
}

.logisticsLine .Sup2 {
	width: 15%;
}

.logisticsLine .Sup3 {
	width: 25%;
}

.logisticsLine .Sup4 {
	width: 20%;
}

.logisticsLine .SupplyInfor_th {
	padding: 0px 10px;
	height: 35px;
	line-height: 35px;
	background: #eaeaea;
	color: #666666;
	border-top: 1px solid #bfc6cd;
	font-size: 14px;
	width: 100%
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
	width: 15%;
	padding-top: 30px;
	overflow: hidden;
	margin-right: 10px;
}

.logisticsLine .SupList2 {
	width: 15%;
	padding-top: 30px;
}

.logisticsLine .SupList3 {
	width: 25%;
	padding-top: 30px;
	overflow: hidden;
}

.logisticsLine .SupList4 {
	width: 20%;
	padding-top: 30px;
}

.logisticsLine .SupList5 {
	width: 20%;
	padding-top: 25px;
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

.container-fluid .logisticsLine {
	padding: 0px;
	margin: 0px;
}

.btn-primary {
	background-color: #33AECC;;
	padding: 5px;
	border-radius: 12px 12px 12px 12px;
}

body {
	padding: 0px;
	margin: 0px
}
</style>
</head>

<body>
	<div class="container-fluid">

		<div id="NeiRong" class="logisticsLine" style="border: 1px solid #ccc; ">
			<div id="divWdList">
				<div class="webList" id="webList"></div>

				<div class="pageBox">
					<div class="subPagination" id="area_footer"></div>
					<div id="page_num" style="margin-left: 2%"></div>
				</div>


			</div>

		</div>
		<div id="DiTu" style="display: none;">
			<div style=" width:100%;border:#ccc soliud 1px;" id="dituContent"></div>
			<button class="btn" style="background-color:  #33AECC;padding: 8px"
				onclick="back()">返 回</button>
		</div>


	</div>
</body>
<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="${ctx }/Content/js/OpenMap.js"></script> -->
<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
<script type="text/javascript">
	var map;
	var pageSize = 5;
	var startIndex = 0;
	var ZongYeShu = 0;

	var pageNumber = 0;
	var YeShu = 1;
	$(function() {
		pageSize = Math.floor(((window.screen.height - 400) / 80) - 1) + 1;
		$("#dituContent").css("height", window.screen.height - 320);
		map = new BMap.Map("dituContent");
		selectInfor(startIndex, pageSize);
		initMap();//创建和初始化地图

	});
	// 创建和初始化地图函数：
	function initMap() {
		layer.load();
		createMap();// 创建地图
		setMapEvent();// 设置地图事件
		addMapControl();// 向地图添加控件
		//getlocation();
		layer.closeAll('loading');
	}

	// 创建地图函数：
	function createMap() {

		var point = new BMap.Point(116.401137, 39.913807);// 定义一个中心点坐标
		map.centerAndZoom(point, 7);// 设定地图的中心点和坐标并将地图显示在地图容器中
		window.map = map;// 将map变量存储在全局
	}
	function G(id) {
		return document.getElementById(id);
	}// 地图控件添加函数：
	function addMapControl() {
		// 向地图中添加缩放控件
		var ctrl_nav = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			type : BMAP_NAVIGATION_CONTROL_LARGE
		});
		map.addControl(ctrl_nav);
		// 向地图中添加缩略图控件
		var ctrl_ove = new BMap.OverviewMapControl({
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
			isOpen : 1
		});
		map.addControl(ctrl_ove);
		// 向地图中添加比例尺控件
		var ctrl_sca = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_BOTTOM_LEFT
		});
		map.addControl(ctrl_sca);
	}
	// 地图事件设置函数：
	function setMapEvent() {
		map.enableDragging();// 启用地图拖拽事件，默认启用(可不写)
		map.enableScrollWheelZoom();// 启用地图滚轮放大缩小
		map.enableDoubleClickZoom();// 启用鼠标双击放大，默认启用(可不写)
		map.enableKeyboard();// 启用键盘上下左右键移动地图
	}

	function mapCheck(value) {
		map.clearOverlays(); // 清除地图上所有覆盖物
		$("#NeiRong").hide();
		$("#DiTu").show();
		serachlocal(value);
	}
	function back() {
		$("#NeiRong").show();
		$("#DiTu").hide();
	}

	function serachlocal(diDian) {

		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map,
				// panel: "results",//结果容器id
				autoViewport : true, // 自动结果标注
				selectFirstResult : false
			// 不指定到第一个目标
			},
			pageCapacity : 8,
			// 自定义搜索回调数据
			onSearchComplete : function(results) {
				if (local.getStatus() == BMAP_STATUS_SUCCESS) {

					for ( var i = 0; i < results.getCurrentNumPois(); i++) {

						var poi = results.getPoi(i);

						if (poi.point.lng > 0 && poi.point.lat > 0) {

						} else {
							layer.alert("定位失败", {
								icon : 0,
								title : "提示",
								offset : '100px'
							});
						}

					}

				}

			},

		});

		local.search(diDian);

	}
	function next(ID) {
		$("#" + ID).css('color', '#2594cb');
		$("#" + ID).css('border', '1px solid #2594cb');
		startIndex = (ID * pageSize);
		selectInfor(startIndex, pageSize);

		$("#" + pageNumber).css('color', "black");
		$("#" + pageNumber).css('border', "1px solid #aaa");
		YeShu = parseInt(ID) + 1;
		scrollTo("#NeiRong", 1000);
		pageNumber = parseInt(ID);
	}
	function xiaYiYe(shu) {
		$("#" + (parseInt(pageNumber) + 1)).css('color', '#2594cb');
		$("#" + (parseInt(pageNumber) + 1)).css('border', '1px solid #2594cb');
		$("#" + pageNumber).css('color', "black");
		$("#" + pageNumber).css('border', "1px solid #aaa");
		if (parseInt(shu) < ZongYeShu) {

			startIndex = (shu * pageSize);
			selectInfor(startIndex, pageSize);
			YeShu = parseInt(shu) + 1;
		} else {
			layer.alert("已经是最后一页了！！", {
				icon : 0,
				title : "提示："
			});
		}
		scrollTo("#NeiRong", 1000);
		pageNumber = parseInt(pageNumber) + 1;
	} //点击回到指定的位置
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
	function selectInfor(startIndex, pageSize) {
		$("#page_num").empty();
		$
				.post(
						"${ctx}/CustomerController/getList.do?pageSize="
								+ pageSize + "&startIndex=" + startIndex,
						function(data) {
							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							$("#webList").empty();
							ZongYeShu = Math.ceil(data.totalRows / pageSize);
							data = data.data;
							$("#webList")
									.append(
											'<ul class="SupplyInfor_th"><li class="Sup1" style="text-align: center">司机名称</li><li class="Sup2" style="text-align: center">车牌号</li><li class="Sup3" style="text-align: center">所在位置</li><li class="Sup4" style="text-align: center">上传时间</li><li class="Sup4" style="text-align: center">操作</li></ul>');
							for ( var i = 0; i < data.length; i++) {
								var uploadTime = ChangeDateFormat(data[i].uploadtime);
								$("#webList")
										.append(
												'<ul class="SupplyInfor_source SupplyInfor_zx"><li class="SupList1" style="text-align: center"><a href="#">'
														+ data[i].username
														+ '</a> </li> <li style="text-align: center" class="SupList2"<span>'
														+ data[i].platenumber
														+ '</span></li>  <li style="text-align: center" class="SupList3"><span>'
														+ data[i].carlocation
														+ '</span></li>  <li style="text-align: center"  class="SupList4">'
														+ uploadTime
														+ '</li><li  style="text-align: center;" class="SupList5"> <button  id="'
														+ data[i].carlocation
														+ '  "  onclick="mapCheck(this.id)" class="btn btn-primary"><a href="javascript:void(0)" >地图查看</a></button></li></ul>');
							}
							if (ZongYeShu > 1) {

								for ( var i = 0; i < ZongYeShu; i++) {
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
						});
	}
</script>
</html>
