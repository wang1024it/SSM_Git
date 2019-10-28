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
<!-- saved from url=(0035)http://18665635806.chinawutong.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=1200,initial-scale=0.1,user-scalable=yes">
<link rel="stylesheet" href="${ctx }/Content/css/Memberpublic.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/lbt.css" type="text/css"></link>
<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/script.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/lunbo.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/h.js"></script>

<title>广州市广发物流有限公司</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">
<meta name="mobile-agent"
	content="format=[wml|xhtml|html5]; url=http://m.chinawutong.com/comp/18665635806/">
<meta http-equiv="Cache-Control" content="no-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">
<style>
.mask {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background: rgba(0, 0, 0, .5);
	z-index: 9998;
	overflow: hidden;
}

.fws {
	position: absolute;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
}

.fwsImg {
	display: block;
	background: url(../image/2018fws.png) top center no-repeat;
	width: 434px;
	height: 496px;
	margin: 0 auto;
}

.fwsClose {
	display: block;
	background: url(../image/2018close.png) center no-repeat;
	width: 34px;
	height: 34px;
	position: absolute;
	right: 0;
	top: 100px;
}
</style>
<script type="text/javascript" src="${ctx }/Content/js/share.js"></script>
<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>



<link rel="stylesheet" href="${ctx }/Content/css/share_style0_16.css"
	type="text/css"></link>
</head>
<body>
	<form name="aspnetForm" method="post" action="" id="aspnetForm">




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
					<li class="top_list6 sel" style="padding-left:20px;"><a
						target="_blank" href="${ctx }/ClientController/myOrder.do">我的订单</a>
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
		<div class="topNam">
			<div class="top_com">
				<!--公司名称-->
				<div class="comHeader fl">
					<h1 class="comName cmne">广州市广发物流有限公司</h1>
					<div id="divShare" class="liuLan" style="">
						<p class="fl">分享：</p>
						<div class="bdsharebuttonbox fl bdshare-button-style0-16"
							data-bd-bind="1542005599099">
							<a href="javascript:void(0)" class="bds_more" data-cmd="more"></a> <a
								href="javascript:void(0)" class="bds_weixin" data-cmd="weixin"
								title="分享到微信"></a> <a href="javascript:void(0)" class="bds_sqq"
								data-cmd="sqq" title="分享到QQ好友"></a> <a href="javascript:void(0)"
								class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a
								href="javascript:void(0)" class="bds_tsina" data-cmd="tsina"
								title="分享到新浪微博"></a>
						</div>

						<div class="clear"></div>
					</div>

				</div>

				<!--物信通图标-->
				<a href="http://18665635806.chinawutong.com/cert.html" title="点击查看诚信档案"
					class="wxtQy" target="_blank">
					<p class="wxtType">
						第<span>1</span>年
					</p>
					<p class="wxtyInter">已通过北京信之博远认证</p> </a>

				<!--诚信经营企业图标-->

				<div class="clear"></div>
			</div>
		</div>




		<!--导航信息开始-->
		<div class="navigation">
			<div class="menu">
				<ul class="nav">
					<li><a href="${ctx }/FrontJsp/HomePage.jsp" class="nav-current">首页</a>
					</li>
					<li><a href="${ctx }/FrontJsp/Introduction.jsp" class="">公司简介</a>
					</li>
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="">形象展示</a>
					</li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a>
					</li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp" class="">物流专线</a>
					</li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="">货源信息</a>
					</li>

					<li><a href="${ctx }/FrontJsp/Join.jsp" class="">招商加盟</a>
					</li>

					<li><a href="${ctx }/ClientController/online.do" class="">在线下单</a>
					</li>

					<li><a href="${ctx }/FrontJsp/ContactUs.jsp" class="">联系我们</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<!--导航信息结束-->
		<!--首页banner开始-->

		<div class="banner  ">
			<div class="slider"
				style="background:url('${ctx }/Content/image/cnHoe1rZvJOAdBzjAALlh4B6lZg635.jpg');">
				<ul class="slider-main">
					<li class="slider-panel img1"
						style="background: url(&quot;${ctx }/Content/image/cnHoe1rZvJOAdBzjAALlh4B6lZg635.jpg&quot;) center top no-repeat; height: 400px; display: none;"></li>
					<li class="slider-panel img2"
						style="background: url(&quot;${ctx }/Content/image/cnHoe1t2HN6AYENJAANMbLN1iGc579.jpg&quot;) center top no-repeat; height: 400px; display: none;"></li>
					<li class="slider-panel img3"
						style="background: url(&quot;${ctx }/Content/image/cnHoe1rZvKGAFQryAAHotheHIxQ896.jpg&quot;) center top no-repeat; height: 400px; display: list-item;"></li>
				</ul>
				<div class="slider-extra">
					<ul class="slider-nav">

						<li class="slider-item"></li>
						<li class="slider-item"></li>
						<li class="slider-item"></li>
					</ul>
				</div>
			</div>
		</div>
		<!--首页banner结束-->
		<!--内容部分-->
		<div class="content">

			<!--简介-->
			<!--物流公司简介开始(物流公司、配货信息部、车主通用)-->
			<div class="company fl">

				<div class="ImageDisplay-box commonTit-box">
					<h4 class="fl commonTit-li pd20">公司简介</h4>
					<a href="${ctx }/FrontJsp/Introduction.jsp" target="_blank" class="fr">全部<em>＋</em>
					</a>
				</div>
				<div class="comCont">
					<div class="comTuPian">

						&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;广发物流辐射线路 珠三角地区--成都 珠三角地区--乐山 珠三角地区--眉山
						珠三角地区--德阳 珠三角地区--绵阳 我司成立于1999年，具有十多...<a
							href="${ctx }/FrontJsp/Introduction.jsp" class="comChaKan">[查看更多]</a>

					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!--物流公司简介结束-->
			<!--动态和招商（物流公司）-->
			<!--物流公司动态和招商加盟开始-->
			<div class="SupplyInfor common-tit fr">
				<div class="SupplyInfor-box commonTit-box" id="tabTitle">
					<ul>
						<li class="current commonTit-li pd20">
							<h4 class="SupplyInfor-cur">公司动态</h4>
						</li>
						<li class="pd20">
							<h4 class="fl SupplyInfor-cur">招商加盟</h4>
						</li>
					</ul>
					<a href="${ctx }/FrontJsp/Join.jsp" target="_blank" class="fr">全部＋</a>
				</div>
				<div id="tabContent">
					<div class="tabList">

						<div class="divDefaultInfo">暂无公司动态</div>

					</div>
					<div class="tabList" style="display: none;">

						<div class="divDefaultInfo">暂无招商加盟</div>

					</div>
				</div>
			</div>
			<div style="clear: both;"></div>

			<!--物流网点-->

			<div class="wangDian fl">
				<div class="wdTitle">
					<img src="${ctx }/Content/image/wangdianfenbu.png" style="float: left;">

					<a href="${ctx }/FrontJsp/DotDistribution.jsp" target="_blank" class="fr">全部<em>＋</em>
					</a>

					<div class="clear"></div>
				</div>

				<div class="wdCity">
					<input type="text" id="txtPro" value="" class="city">
					<div id="divArea" class="area-select wdarea-select2" style="display: none;">
						<div class="tabs">
							<ul>
								<li id="liPro" class="current f14">省份</li>
								<li id="liCity" class="f14">城市</li>
							</ul>
						</div>
						<div style="clear: both"></div>

						<div id="divPro">
							<div class="con wdCon">
								<ul id="ulPro">

									<li class="hot-choose" data-pro="广东省" onclick="getCityWd('广东省')">广东省</li>

									<li class="hot-choose" data-pro="四川省" onclick="getCityWd('四川省')">四川省</li>

								</ul>
							</div>

						</div>
						<div id="divCity" style="display: none;">
							<div class="con wdCon " style="overflow: auto;">
								<ul id="ulCity"></ul>
							</div>

						</div>

					</div>
					<button id="btnSearch" class="souSuo" type="button">搜索</button>

				</div>

				<div id="divDataWd" class="wdContHeight"></div>



				<input name="ctl00$ContentPlaceHolder$WuLiuWd$hidCurrentProPageIndex"
					type="hidden" id="ctl00_ContentPlaceHolder_WuLiuWd_hidCurrentProPageIndex"
					value="1"> <input
					name="ctl00$ContentPlaceHolder$WuLiuWd$hidCurrentCityPageIndex"
					type="hidden" id="ctl00_ContentPlaceHolder_WuLiuWd_hidCurrentCityPageIndex"
					value="1"> <input
					name="ctl00$ContentPlaceHolder$WuLiuWd$hidPageCityTotalCount" type="hidden"
					id="ctl00_ContentPlaceHolder_WuLiuWd_hidPageCityTotalCount" value="0">
				<input name="ctl00$ContentPlaceHolder$WuLiuWd$hidProValue" type="hidden"
					id="ctl00_ContentPlaceHolder_WuLiuWd_hidProValue" value="广东省"> <input
					name="ctl00$ContentPlaceHolder$WuLiuWd$hidCityValue" type="hidden"
					id="ctl00_ContentPlaceHolder_WuLiuWd_hidCityValue" value="广州市">

			</div>
			<!--主营线路-->
			<!--主营线路开始-->
			<!--物流公司的主营线路-->
			<div class="xianLu fr">
				<div class="xlBiaoTi">
					<div class="btLeft">
						<h4 class="commonTit-li pd20">主营线路</h4>
					</div>

					<div class="xtRight commonTit-box">
						<a href="${ctx }/FrontJsp/LogisticsSpecialLine.jsp" target="_self"
							class="fr">全部<em>＋</em> </a>
					</div>

				</div>

				<div class="subWapper">
					<div class="xlTitle">
						<ul class="xlSubList">
							<li class="xlCity xlative"><a id="aFirst" class="prov"
								href="javascript:void(0);">广州</a>
							</li>
							<li class="xlGengDuo"><span id="spanFrom"> <a id="aFromMore"
									href="${ctx }/FrontJsp/LogisticsSpecialLine.jsp">更多</a>
									<div id="divFromMore" class="area-select" style="display: none;">
										<div class="tabs">
											<ul>
												<li id="liFromPro" onclick="showPro();" class="current f14">省份</li>
												<li id="liFromCity" onclick="showCity(39);" class="f14">城市</li>
											</ul>
										</div>
										<div style="clear: both"></div>
										<div class="con">
											<ul id="ulFromPro" style="display: block">
												<div id="divFromPro" class="area-hot cl">

													<a data-pro="广东"
														href="javascript:GetCity(&#39;广东&#39;,&#39;from&#39;);"
														class="hot-choose">广东</a>

												</div>
											</ul>
											<ul id="ulFromCity" style="display: none">
												<div id="divFromCity" class="area-hot cl"></div>
											</ul>
										</div>
										<div id="divBottomFromProArea" class="area-btn" style="display:none";="">
											<span id="spanFromProUp" class="area-pre">&lt;</span> <span
												id="spanFromProDown" class="area-next">&gt;</span>
										</div>
										<div id="divBottomFromCityArea" class="area-btn" style="display: none">
											<span id="spanFromCityUp" class="area-pre">&lt;</span> <span
												id="spanFromCityDown" class="area-next">&gt;</span>
										</div>
									</div> </span>
							</li>
							<li class="jianTou"><img src="${ctx }/Content/image/jiantou.png">
							</li>
							<li id="divTo">
								<ul>

									<li class="xlList"><a href="javascript:void(0);" data-pro="四川省"
										class="prov">四川</a>
									</li>

								</ul>
							</li>
							<li class="xlList xlMore"><span id="spanTo"> <a id="aToMore"
									class="prov" href="javascript:void(0);" style="display: none;">更多</a>
									<div id="divToMore" class="area-select" style="display: none;">
										<div class="tabs">
											<ul>
												<li id="liToPro" onclick="showPro();" class="current f14">省份</li>
											</ul>
										</div>
										<div style="clear: both"></div>
										<div class="con">
											<ul id="ulToPro" style="display: block">
												<div id="divToPro" class="area-hot cl">

													<a data-pro="四川省"
														href="javascript:GetCity(&#39;四川省&#39;,&#39;to&#39;);"
														class="hot-choose">四川</a>

												</div>
											</ul>
										</div>
										<div id="divBottomToProArea" class="area-btn" style="display:none";="">
											<span id="spanToProUp" class="area-pre">&lt;</span> <span
												id="spanToProDown" class="area-next">&gt;</span>
										</div>
									</div> </span>
							</li>
							<div style="clear: both"></div>
						</ul>
					</div>
					<div class="subList wlSubList">
						<a id="aUp" class="sPrev prevStop" href="javascript:;"
							style="display: none"></a>
						<ul id="ulWuLiuLine"></ul>
						<a id="aDown" class="sNext nextStop" href="javascript:;" style=""></a>
					</div>
				</div>

			</div>
			<div class="clear"></div>
			<input name="ctl00$ContentPlaceHolder$uuuu$hidLinePageCount" type="hidden"
				id="ctl00_ContentPlaceHolder_uuuu_hidLinePageCount" value="68"> <input
				name="ctl00$ContentPlaceHolder$uuuu$hidLinePageIndex" type="hidden"
				id="ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex" value="1"> <input
				type="hidden" id="hidWlFromCity" value="广州市"> <input
				name="ctl00$ContentPlaceHolder$uuuu$hidToPro" type="hidden"
				id="ctl00_ContentPlaceHolder_uuuu_hidToPro"> <input type="hidden"
				id="hidAddrType" value="True"> <input
				name="ctl00$ContentPlaceHolder$uuuu$hidFromPro" type="hidden"
				id="ctl00_ContentPlaceHolder_uuuu_hidFromPro">
			<!--物流公司的主营线路-->
			<script type="text/javascript">
                //出发城市状态（0表示未选中省份，1表示已选中省份）
                var fromType = 0;
                //获取出发的省份及城市数据字符串类型
                //var strFromData = '[{"provName":"吉林","citys":[{"cityname":"长春市"},{"cityname":"长春市1"},{"cityname":"长春2市"},{"cityname":"长春市3"},{"cityname":"长春市4"},{"cityname":"长春市5"},{"cityname":"长春6市"},{"cityname":"长春市7"},{"cityname":"长春市8"},{"cityname":"长春市9"},{"cityname":"长春10市"},{"cityname":"长春市11"},{"cityname":"长春市12"},{"cityname":"长春市13"},{"cityname":"长春14市"},{"cityname":"长春市15"},{"cityname":"长春市16"},{"cityname":"长春市17"},{"cityname":"长春市18"},{"cityname":"长春市19"},{"cityname":"长春市20"}]},{ "provName":"天津","citys":[{"cityname":"天津市"}]},{"provName":"海南","citys":[{"cityname":"海口市"}]},{"provName":"陕西","citys":[{"cityname":"西安市"}]},{"provName":"云南","citys":[{"cityname":"昆明市"}]},{"provName":"福建","citys":[{"cityname":"福州市"}]},{"provName":"内蒙古","citys":[{"cityname":"呼和浩特市"}]},{"provName":"西藏","citys":[{"cityname":"拉萨市"}]},{"provName":"新疆","citys":[{"cityname":"乌鲁木齐市"}]},{"provName":"甘肃","citys":[{"cityname":"兰州市"}]},{"provName":"青海","citys":[{"cityname":"西宁市"}]},{"provName":"贵州","citys":[{"cityname":"贵阳市"}]},{"provName":"山东","citys":[{"cityname":"济南市"}]},{"provName":"山西","citys":[{"cityname":"太原市"}]},{"provName":"宁夏","citys":[{"cityname":"银川市"}]},{"provName":"浙江","citys":[{"cityname":"杭州市"}]},{"provName":"江苏","citys":[{"cityname":"南京市"}]},{"provName":"安徽","citys":[{"cityname":"合肥市"}]},{"provName":"江西","citys":[{"cityname":"南昌市"}]},{"provName":"上海","citys":[{"cityname":"上海市"}]},{"provName":"广东","citys":[{"cityname":"广州市"}]},{"provName":"重庆","citys":[{"cityname":"重庆市"}]},{"provName":"河南","citys":[{"cityname":"郑州市"}]},{"provName":"湖北","citys":[{"cityname":"武汉市"}]},{"provName":"四川","citys":[{"cityname":"成都市"}]},{"provName":"北京","citys":[{"cityname":"北京市"}]}]';
                var strFromData = '[{"provName":"广东","citys":[{"cityname":"广州市"}]}]';
                //获取出发省份及城市数据json类型
                var jsonFromData = JSON.parse(strFromData);
                //出发城市地区分页json数据
                var pageFromCityJson = "";
                //获取到达的省份及城市数据字符串类型
                var strToData = '[{"provName":"四川省","citys":[{"cityname":"资阳市"},{"cityname":"巴中市"},{"cityname":"雅安市"},{"cityname":"达州市"},{"cityname":"广安市"},{"cityname":"宜宾市"},{"cityname":"眉山市"},{"cityname":"南充市"},{"cityname":"乐山市"},{"cityname":"内江市"},{"cityname":"遂宁市"},{"cityname":"广元市"},{"cityname":"绵阳市"},{"cityname":"泸州市"},{"cityname":"攀枝花市"},{"cityname":"自贡市"},{"cityname":"成都市"},{"cityname":"凉山自治州"},{"cityname":"甘孜自治州"},{"cityname":"阿坝自治州"},{"cityname":"德阳市"}]}]';
                //获取到达的省份及城市数据json类型
                var jsonToData = "";
                if (strToData.length > 10) {
                    jsonToData = JSON.parse(strToData);
                    if (jsonToData.length > 5) {
                        $("#aToMore").show();
                    }
                }

                var fromProPageIndex = 1;
                var fromCityPageIndex = 1;
                var fromCityPageCount = 1;
                var toCityPageIndex = 1;
                var toProPageIndex = 1;
                var userId = "1711562";
                var thisLinePageIndex = parseInt($("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val());
                var thisLinePageCount = parseInt($("#ctl00_ContentPlaceHolder_uuuu_hidLinePageCount").val());
                if (thisLinePageIndex < thisLinePageCount) {
                    $("#aDown").show();
                }
                else {
                    $("#aDown").hide();
                }

                //鼠标离开出发区域隐藏区域框
                $("#divFromMore").mouseleave(function () {
                    $("#divFromMore").hide();
                })

                //鼠标离开到达区域隐藏区域框
                $("#divToMore").mouseleave(function () {
                    $("#divToMore").hide();
                })

                //出发城市的更多按钮
                $("#aFromMore").click(function () {
                    $("#divBottomFromProArea").show();
                    $("#divBottomFromCityArea").hide();
                    if (!$("#liFromPro").hasClass("current")) {
                        $("#liFromPro").addClass("current");
                    }
                    if ($("#liFromCity").hasClass("current")) {
                        $("#liFromCity").removeClass("current");
                    }
                    $("#ulFromPro").show();
                    $("#ulFromCity").hide();
                    fromType = 0;
                    fromProPageIndex = 1;
                    funPageFromPro(fromProPageIndex);
                    $("#divFromMore").toggle();
                })

                //到达城市的更多按钮
                $("#aToMore").click(function () {
                    toProPageIndex = 1;
                    funPageToPro(toProPageIndex);
                    $("#divToMore").toggle();
                })

                //选中省份事件
                $("#divTo li").click(function () {
                    $("#divTo li a").each(function (index) {
                        if ($(this).hasClass("checked"))
                            $(this).removeClass("checked");
                    })

                    if (!$(this).find("a").hasClass("checked"))
                        $(this).find("a").addClass("checked");

                    var toProValue = $(this).find("a").attr("data-pro");
                    $("#ctl00_ContentPlaceHolder_uuuu_hidToPro").val(toProValue);
                    $("#aUp").hide();
                    $("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val("1");
                    linePageDataWd(1);
                })

                //主营线路下一页
                $("#aDown").click(function () {
                    var pIndex = parseInt($("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val());
                    var totalPageIndex = parseInt($("#ctl00_ContentPlaceHolder_uuuu_hidLinePageCount").val());
                    if (pIndex < totalPageIndex) {
                        pIndex += 1;
                        if (pIndex > 1)
                            $("#aUp").show();
                        else
                            $("#aUp").hide();
                        if (pIndex == totalPageIndex)
                            $("#aDown").hide();
                        $("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val(pIndex.toString()).toString();
                        linePageDataWd(pIndex);
                    }
                    else {
                        $("#aDown").hide();
                    }
                })

                //主营线路上一页
                $("#aUp").click(function () {
                    var pIndex = parseInt($("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val());
                    var totalPageIndex = parseInt($("#ctl00_ContentPlaceHolder_uuuu_hidLinePageCount").val());
                    if (pIndex > 1) {
                        pIndex -= 1;
                        if (pIndex == 1)
                            $("#aUp").hide();
                        if (pIndex < totalPageIndex)
                            $("#aDown").show();
                        $("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val(pIndex.toString()).toString();
                        linePageDataWd(pIndex);
                    }
                    else {
                        $("#aUp").hide();
                    }
                })

                //主营线路分页
                function linePageDataWd(pageIndex) {
                    var pageSize = 6;
                    var fromCity = $("#hidWlFromCity").val();
                    var toPro = $("#ctl00_ContentPlaceHolder_uuuu_hidToPro").val();
                    var addType = $("#hidAddrType").val();
                    $.ajax({
                        type: "post",
                        url: "/template/Tem_blue_1/ashx/mainLine.ashx",
                        data: { userId: userId, fromCity: fromCity, toPro: toPro, addrType: addType, pageIndex: pageIndex, pageSize: pageSize },
                        success: function (data) {
                            if (data.Count > 0) {
                                var strData = "";
                                var jsonData = JSON.parse(data.strDataJson);
                                for (var i = 0; i < jsonData.length; i++) {
                                    strData += "<li class='list1 item" + (i + 1) + "0'>";
                                    strData += "<a target='_blank' href='http://www.chinawutong.com/201/" + jsonData[i].id + ".html'>";
                                    strData += "<h4>" + jsonData[i].fromProvince + " " + jsonData[i].fromCity + " " + jsonData[i].fromArea + " → " + jsonData[i].toProvince + " " + jsonData[i].toCity + " " + jsonData[i].toArea + "</h4>";
                                    strData += "<p>";
                                    strData += "<span class='zhongHuo'>重货</span>";
                                    strData += "<span class='jiaGe'>" + jsonData[i].Price + " </span>&nbsp;时效:<span>" + jsonData[i].shiXiao + "</span>";
                                    strData += "</p>";
                                    strData += "<p>";
                                    strData += "<span class='qingHuo'>轻货</span><span class='jiaGe'>" + jsonData[i].lightPrice + "</span>";
                                    strData += "</p>";
                                    strData += "</a>";
                                    strData += "</li>";
                                }
                                $("#ulWuLiuLine").html(strData);
                                var pageCount = parseInt((data.Count + 6 - 1) / 6);
                                if (pageCount <= 1) {
                                    $("#aUp").hide();
                                    $("#aDown").hide();
                                }
                                if (pageIndex < pageCount) {
                                    $("#aDown").show();
                                } else { $("#aDown").hide(); }
                            }
                            else {
                                $("#aUp").hide();
                                $("#aDown").hide();
                                $("#ulWuLiuLine").html("<div class=\"insearch-kong\"><h5>暂时没有找到相关线路！</h5><p>去看看其他线路吧！</p></div>");
                            }
                        }
                    })
                }

                //点击城市按钮时的控制：objValue等于from表示选中的出发地的城市，to表示选中到达地的城市
                function showCity(objValue) {
                    if (objValue == "from") {
                        //fromType等于1，表示已选中到达省份，可以点击城市项
                        if (fromType == 1) {
                            //隐藏出发省份的翻页
                            $("#divBottomFromProArea").hide();
                            var hidPro = $("#ctl00_ContentPlaceHolder_uuuu_hidFromPro").val();
                            for (var i = 0; i < jsonFromData.length; i++) {
                                if (jsonFromData[i].provName == hidPro) {
                                    if (jsonFromData[i].citys.length > 12) {
                                        $("#divBottomFromCityArea").show();
                                    }
                                    else {
                                        $("#divBottomFromCityArea").hide();
                                    }
                                }
                            }
                            $("#ulFromPro").hide();
                            $("#ulFromCity").show();
                            $("#liFromPro").removeClass("current");
                            $("#liFromCity").addClass("current");
                        }
                    }
                }

                //点击相关省份查询到相关城市
                function GetCity(objProName, type) {
                    if (type == "from") {
                        var str = "";
                        fromCityPageIndex = 1;
                        for (var i = 0; i < jsonFromData.length; i++) {
                            //根据选中省份获取的下面的城市
                            if (jsonFromData[i].provName == objProName) {
                                //赋值隐藏控件，选中的出发城市
                                $("#ctl00_ContentPlaceHolder_uuuu_hidFromPro").val(objProName);
                                var Count = jsonFromData[i].citys.length;
                                //如果数量大于12，则只取12条数据
                                if (Count > 12) {
                                    var c = parseInt(Count / 12);
                                    var d = parseInt(Count % 12);
                                    //var c = parseInt((Count + 12 - 1) / 12);//得到获取的分页数
                                    var pageFromCityStr = "";
                                    if (c > 0 && d > 0) {
                                        pageFromCityStr += "[";
                                        c = c + 1;
                                        fromCityPageCount = c;//赋值全局变量到达城市的总页数
                                        for (var n = 1; n <= c; n++) {
                                            pageFromCityStr += "{\"pageIndex\":\"" + n + "\",\"citys\":";
                                            var datas = "[";
                                            if (n == 1) {
                                                for (var k = 0; k < 12; k++) {
                                                    if (k <= Count - 1) {
                                                        if (k != 11)
                                                            datas += JSON.stringify(jsonFromData[i].citys[k]) + ",";
                                                        else
                                                            datas += JSON.stringify(jsonFromData[i].citys[k]);
                                                    }
                                                }
                                            }
                                            else {
                                                for (var k = (n - 1) * 12 ; k < n * 12 ; k++) {
                                                    if (k < Count - 1) {
                                                        datas += JSON.stringify(jsonFromData[i].citys[k]) + ",";
                                                    }
                                                    else if (k == Count - 1) {
                                                        datas += JSON.stringify(jsonFromData[i].citys[k]);
                                                    }

                                                }
                                            }
                                            datas += "]";
                                            if (n != c)
                                                pageFromCityStr += datas + "},";
                                            else
                                                pageFromCityStr += datas + "}";
                                        }
                                        pageFromCityStr += "]";
                                        pageFromCityJson = JSON.parse(pageFromCityStr);
                                    }
                                    $("#divBottomFromCityArea").show();
                                    Count = 12;
                                    for (var k = 0; k < Count; k++) {
                                        str += "<a data-city='" + jsonFromData[i].citys[k].cityname + "' href='javascript:setCity(\"" + jsonFromData[i].citys[k].cityname + "\")' class='hot-choose'>" + jsonFromData[i].citys[k].cityname.replace("省", "").replace("市", "").replace("区", "") + "</a>";
                                    }
                                }
                                else {
                                    for (var k = 0; k < jsonFromData[i].citys.length; k++) {
                                        str += "<a data-city='" + jsonFromData[i].citys[k].cityname + "' href='javascript:setCity(\"" + jsonFromData[i].citys[k].cityname + "\")' class='hot-choose'>" + jsonFromData[i].citys[k].cityname.replace("省", "").replace("市", "").replace("区", "") + "</a>";
                                    }
                                }
                            }
                        }
                        //选中省份后设置字体颜色
                        $("#divFromPro a").each(function () {
                            if ($(this).attr("data-pro") == objProName)
                                $(this).attr("style", "color: #35a0fa!important;");
                            else
                                $(this).attr("style", "");
                        })
                        //1代表已选中出发省份，用于控制是否可以点击城市项
                        fromType = 1;
                        $("#divFromCity").html(str);
                        $("#ulFromPro").hide();
                        $("#ulFromCity").show();
                        $("#liFromPro").removeClass("current");
                        $("#liFromCity").addClass("current");
                        $("#divBottomFromProArea").hide();
                    }
                    else {
                        $("#ctl00_ContentPlaceHolder_uuuu_hidToPro").val(objProName);
                        $("#divToMore").hide();
                        $("#aUp").hide();
                        $("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val("1");
                        var addType = true;
                        $("#hidAddrType").val(addType);
                        linePageDataWd(1);
                    }
                }

                //点击省份按钮时的控制：objValue等于from表示选中的出发地的省份，to表示选中到达地的省份
                function showPro() {
                    $("#divBottomFromCityArea").hide();
                    if (jsonFromData.length > 12) {
                        $("#divBottomFromProArea").show()
                    }
                    else {
                        $("#divBottomFromProArea").hide()
                    }
                    $("#ulFromPro").show();
                    $("#ulFromCity").hide();
                    $("#liFromCity").removeClass("current");
                    $("#liFromPro").addClass("current");
                }

                //点击城市时赋值
                function setCity(obj) {
                    $("#aUp").hide();
                    $("#divFromMore").hide();
                    $("#aFirst").html(obj.replace("市", ""));
                    $("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val("1");
                    $("#hidWlFromCity").val(obj);
                    var addType = true;
                    $("#hidAddrType").val(addType);
                    linePageDataWd(1);
                }

                //出发地省份上一页
                $("#spanFromProUp").click(function () {
                    var fromPageCount = parseInt((jsonFromData.length + 12 - 1) / 12);
                    if (fromProPageIndex > 1) {
                        fromProPageIndex -= 1;
                        funPageFromPro(fromProPageIndex);
                    }
                })

                //出发地省份下一页
                $("#spanFromProDown").click(function () {
                    //根据省份数量获取到总页数
                    var fromPageCount = parseInt((jsonFromData.length + 12 - 1) / 12);
                    if (fromProPageIndex < fromPageCount) {
                        fromProPageIndex += 1;
                        funPageFromPro(fromProPageIndex);
                    }
                })

                //出发地省份分页
                function funPageFromPro(fromProPageIndex) {
                    var str = "";
                    for (var i = (fromProPageIndex - 1) * 12; i < fromProPageIndex * 12; i++) {
                        if (i < jsonFromData.length) {
                            str += "<a data-pro='" + jsonFromData[i].provName + "' href=javascript:GetCity('" + jsonFromData[i].provName + "','from'); class='hot-choose'>" + jsonFromData[i].provName.replace("省", "").replace("市", "").replace("区", "") + "</a>";
                        }
                    }
                    $("#divFromPro").html(str);
                }

                //到达地省份上一页
                $("#spanToProUp").click(function () {
                    var toPageCount = parseInt((jsonToData.length + 12 - 1) / 12);
                    if (toProPageIndex > 1) {
                        toProPageIndex -= 1;
                        funPageToPro(toProPageIndex);
                    }
                })

                //到达地省份下一页
                $("#spanToProDown").click(function () {
                    //根据省份数量获取到总页数
                    var toPageCount = parseInt((jsonToData.length + 12 - 1) / 12);
                    if (toProPageIndex < toPageCount) {
                        toProPageIndex += 1;
                        funPageToPro(toProPageIndex);
                    }
                })

                //到达地省份分页
                function funPageToPro(toProPageIndex) {
                    var str = "";
                    for (var i = (toProPageIndex - 1) * 12; i < toProPageIndex * 12; i++) {
                        if (i < jsonToData.length) {
                            str += "<a data-pro='" + jsonToData[i].provName + "' href=javascript:SetToPro('" + jsonToData[i].provName + "') class='hot-choose'>" + jsonToData[i].provName.replace("省", "").replace("市", "").replace("区", "") + "</a>";
                        }
                    }
                    $("#divToPro").html(str);
                }

                //出发城市上一页
                $("#spanFromCityUp").click(function () {
                    if (fromCityPageIndex > 1) {
                        fromCityPageIndex -= 1;
                    }
                    //fromCityPageIndex = 1;
                    if (fromCityPageIndex <= fromCityPageCount) {
                        var str = "";
                        for (var i = 0; i < pageFromCityJson.length; i++) {
                            if (i == fromCityPageIndex - 1) {
                                for (var k = 0; k < pageFromCityJson[i].citys.length; k++) {
                                    str += "<a data-city='" + pageFromCityJson[i].citys[k].cityname + "' href='javascript:setCity(\"" + pageFromCityJson[i].citys[k].cityname + "\")' class='hot-choose'>" + pageFromCityJson[i].citys[k].cityname.cityname.replace("省", "").replace("市", "").replace("区", "") + "</a>";
                                }
                            }
                        }
                        if (str.length > 0) {
                            $("#divFromCity").html(str);
                        }
                    }
                    else {
                        fromCityPageIndex -= 1;
                    }
                })

                //出发城市下一页
                $("#spanFromCityDown").click(function () {
                    fromCityPageIndex += 1;
                    if (fromCityPageIndex <= fromCityPageCount) {
                        var str = "";
                        for (var i = 0; i < pageFromCityJson.length; i++) {
                            if (i == fromCityPageIndex - 1) {
                                for (var k = 0; k < pageFromCityJson[i].citys.length; k++) {
                                    str += "<a data-city='" + pageFromCityJson[i].citys[k].cityname + "' href='javascript:setCity(\"" + pageFromCityJson[i].citys[k].cityname + "\")' class='hot-choose'>" + pageFromCityJson[i].citys[k].cityname.replace("省", "").replace("市", "").replace("区", "") + "</a>";
                                }
                            }
                        }
                        if (str.length > 0) {
                            $("#divFromCity").html(str);
                        }
                    }
                    else {
                        fromCityPageIndex -= 1;
                    }
                })

                //点击选择框中的省份
                function SetToPro(toProVal) {
                    $("#divTo li a").each(function (index) {
                        if ($(this).hasClass("checked"))
                            $(this).removeClass("checked");
                    })

                    $("#divToMore").hide();
                    $("#ctl00_ContentPlaceHolder_uuuu_hidToPro").val(toProVal);
                    $("#aUp").hide();
                    $("#ctl00_ContentPlaceHolder_uuuu_hidLinePageIndex").val("1");
                    linePageDataWd(1);
                }
            </script>

			<!--形象展示-->
			<!--形象展示开始-->
			<div class="ImageDisplay common-tit xxZhanShi">
				<div class="ImageDisplay-box commonTit-box">
					<h4 class="fl commonTit-li pd20">形象展示</h4>
					<a href="http://18665635806.chinawutong.com/xingxiang.html" target="_blank"
						class="fr">全部<em>＋</em> </a>
				</div>
				<div id="wrap">
					<div id="box" class="box">

						<ul class="ImageDisplay-con commonTit-con"
							style="width: 12420px; left: -1666px;">

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="0"><a
								href="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="1"><a
								href="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="2"><a
								href="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="3"><a
								href="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="4"><a
								href="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="5"><a
								href="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="6"><a
								href="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="7"><a
								href="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="8"><a
								href="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL6ACgZGAAB2oPrA-Bc505.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="9"><a
								href="${ctx }/Content/image/cnHoe1rZvL6ACgZGAAB2oPrA-Bc505.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL6AOI_gAAVdsfI6kFM184.png"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="10"><a
								href="${ctx }/Content/image/cnHoe1rZvL6AOI_gAAVdsfI6kFM184.png"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyAM_doAABiP_aaR2c136.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="11"><a
								href="${ctx }/Content/image/cnHoe1rZvLyAM_doAABiP_aaR2c136.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyACS0_AAI2KQinnVE546.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="12"><a
								href="${ctx }/Content/image/cnHoe1rZvLyACS0_AAI2KQinnVE546.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyATqUVAADmEe2XxXM903.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="13"><a
								href="${ctx }/Content/image/cnHoe1rZvLyATqUVAADmEe2XxXM903.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyAa_yMAABscNAWarQ360.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="14"><a
								href="${ctx }/Content/image/cnHoe1rZvLyAa_yMAABscNAWarQ360.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyAIlqPAABdxGyKpQA695.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="15"><a
								href="${ctx }/Content/image/cnHoe1rZvLyAIlqPAABdxGyKpQA695.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAWR8ZAACSOrkv8qA720.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="16"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAWR8ZAACSOrkv8qA720.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAEP6QAABbAQtTwwI640.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="17"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAEP6QAABbAQtTwwI640.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAT0hKAABVz0vgEHk114.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="18"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAT0hKAABVz0vgEHk114.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuARkeZAAColbbvd4c111.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="19"><a
								href="${ctx }/Content/image/cnHoe1rZvLuARkeZAAColbbvd4c111.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAJxy4AABNmwGUSKk951.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="20"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAJxy4AABNmwGUSKk951.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAFmynAAIu6TzjsGk551.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="21"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAFmynAAIu6TzjsGk551.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuADR3lAABdoGWPHiQ595.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="22"><a
								href="${ctx }/Content/image/cnHoe1rZvLuADR3lAABdoGWPHiQ595.jpg"
								target="_blank">公司照片</a>
							</li>



							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="23"><a
								href="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="24"><a
								href="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="25"><a
								href="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="26"><a
								href="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="27"><a
								href="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="28"><a
								href="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="29"><a
								href="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="30"><a
								href="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="31"><a
								href="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL6ACgZGAAB2oPrA-Bc505.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="32"><a
								href="${ctx }/Content/image/cnHoe1rZvL6ACgZGAAB2oPrA-Bc505.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvL6AOI_gAAVdsfI6kFM184.png"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="33"><a
								href="${ctx }/Content/image/cnHoe1rZvL6AOI_gAAVdsfI6kFM184.png"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyAM_doAABiP_aaR2c136.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="34"><a
								href="${ctx }/Content/image/cnHoe1rZvLyAM_doAABiP_aaR2c136.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyACS0_AAI2KQinnVE546.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="35"><a
								href="${ctx }/Content/image/cnHoe1rZvLyACS0_AAI2KQinnVE546.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyATqUVAADmEe2XxXM903.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="36"><a
								href="${ctx }/Content/image/cnHoe1rZvLyATqUVAADmEe2XxXM903.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyAa_yMAABscNAWarQ360.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="37"><a
								href="${ctx }/Content/image/cnHoe1rZvLyAa_yMAABscNAWarQ360.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLyAIlqPAABdxGyKpQA695.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="38"><a
								href="${ctx }/Content/image/cnHoe1rZvLyAIlqPAABdxGyKpQA695.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAWR8ZAACSOrkv8qA720.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="39"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAWR8ZAACSOrkv8qA720.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAEP6QAABbAQtTwwI640.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="40"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAEP6QAABbAQtTwwI640.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAT0hKAABVz0vgEHk114.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="41"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAT0hKAABVz0vgEHk114.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuARkeZAAColbbvd4c111.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="42"><a
								href="${ctx }/Content/image/cnHoe1rZvLuARkeZAAColbbvd4c111.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAJxy4AABNmwGUSKk951.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="43"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAJxy4AABNmwGUSKk951.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuAFmynAAIu6TzjsGk551.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="44"><a
								href="${ctx }/Content/image/cnHoe1rZvLuAFmynAAIu6TzjsGk551.jpg"
								target="_blank">公司照片</a>
							</li>

							<li><img onclick="funAddDiv();"
								src="${ctx }/Content/image/cnHoe1rZvLuADR3lAABdoGWPHiQ595.jpg"
								width="268" height="198" alt="公司照片" class="ImageDimg" layer-index="45"><a
								href="${ctx }/Content/image/cnHoe1rZvLuADR3lAABdoGWPHiQ595.jpg"
								target="_blank">公司照片</a>
							</li>

						</ul>

					</div>
				</div>
			</div>
			<!--形象展示结束-->






			<script type="text/javascript">
                var oWrap = document.getElementById('wrap');
                var oUl = oWrap.getElementsByTagName('ul')[0];  //获取元素ul
                var oLi = oWrap.getElementsByTagName('li');    //获取全部的li,oLi 是一个数组
                var oBox = document.getElementById('box');
                var timer = null;//定义一个空对象
                var speed = -2;
                oUl.innerHTML = oUl.innerHTML + oUl.innerHTML;  //把oUl的内容复制一次
                $(function () {

                    if ($("#wrap ul li ").length > 0) {
                        move();
                    }

                    layer.photos({
                        photos: '#box', shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
                    });

                    setInterval(function () {
                        if ($(".divClose").length) {
                            return false;
                        }
                        else { $("#layui-layer-photos").before("<div class='divClose' onclick='closeDiv();' style='cursor: pointer; color:#fff; font-size:30px; position:absolute; top:-30px; right:-50px; _top:30px; _right:50px; z-index:9999;'>×</div>"); }
                    }, 500);
                })

                function move() {   //移动
                    if ($("#wrap ul li ").length > 0) {
                        oUl.style.width = oLi[0].offsetWidth * oLi.length + 'px';   //给oUl加一个行内样式的宽度  复制之后，ul宽度一开始没有设置，而外层的DIV 只有600PX,所以要设置 UL里面有多少个LI 就设置多少宽度
                    }
                    timer = setInterval(function () {
                        if (oUl.offsetLeft < -oUl.offsetWidth / 2) {      // 往左走    ul,已经复制了一份，现在里面是8张图片了，当走到UL一半的距离的时候，就把UL拉回来
                            oUl.style.left = 0;
                        }
                        if (oUl.offsetLeft > 0) {    //往右走
                            oUl.style.left = -oUl.offsetWidth / 2 + 'px';
                        }
                        oUl.style.left = oUl.offsetLeft + speed + 'px';
                    }, 30);
                };

                oBox.onmouseover = function () {
                    clearInterval(timer);    //清除定时器
                };
                oBox.onmouseout = function () {
                    move();
                }

                function funAddDiv() {
                    setTimeout(function () { $("#layui-layer-photos").before("<div onclick='closeDiv();' style='cursor: pointer; color:#fff; font-size:30px; position:absolute; top:-30px; right:-50px; _top:30px; _right:50px; z-index:9999;'>×</div>"); }, 500);
                }

                function closeDiv() {
                    layer.closeAll();
                }
            </script>
		</div>
		<!--内容部分-->
		<!--弹出图片部分 S-->
		<div class="fws" id="divFws1" style="display: none;">
			<span class="fwsImg"></span> <span class="fwsClose" onclick="closeFws();"></span>
		</div>
		<!--弹出图片部分 E-->
		<div class="mask" id="divFws2" style="display: none;"></div>




		<div class="footer">
			<!--联系我们-->

			<div class="ContactUs">
				<div class="ContactUs_con">
					<div class="ContactUsTitle">
						联系我们 <img src="${ctx }/Content/image/footer_bg2.jpg" width="114"
							height="22">
					</div>
					<div class="ContactUsInfo">
						<div class="ContactUsTele fl">
							<span class="ContactUsTele_bg"></span>
							<p>
								服务热线：13827512921<br> 联系人： 胡歌<br> <span class="ContactUsNum">
								</span>
							</p>
						</div>
						<div class="ContactUsAf fl">
							<p>
								<span class="comNameTwo"></span>公司名称：广州市广发物流有限公司
							</p>
							<p style="margin: 10px 0;">
								<span class="ContactUsAf_bg1"></span>地址：广州市白云区大围物流中心
							</p>

							<span class="ContactUsFax"><span class="ContactUsAf_bg2"></span>传真：972093728@qq.com</span>

						</div>
						<div class="WeChat fl">


							<div class="WeChat2 fl">
								<div class="WeChat_QR">

									<img src="${ctx }/Content/image/shoujiliulan.png" height="100px"
										width="120px" />

								</div>
								<p>浏览手机网站</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>


		<!--右侧浮动边栏开始-->
		<ul class="ceBianLian cbnav" id="cbl">
			<li class="cbl_list lianXiWoMen cbList"><a
				href="http://18665635806.chinawutong.com/#" class="rightSidebar1 lista">
					<p>联系我们</p> </a>
				<div class="rightBarHidden">
					<div class="item">
						<i class="lxImg"></i>
						<div class="lxTop">
							<h3>联系我们</h3>
						</div>
						<div class="lxRen">
							<p>
								<span class="lxTitle">联系人</span><br> 胡歌&nbsp;&nbsp;&nbsp;

							</p>
						</div>
						<div class="lxDianHua">
							<p>
								<span class="lxTitle">联系电话 </span><br>13827512921
							</p>
						</div>
						<div class="lxDiZhi">
							<p>
								<span class="lxTitle">公司地址</span><br> 广州市白云区大围物流中心
							</p>
						</div>
					</div>
				</div>
			</li>

			<li class="cbl_list cbList shouJiWangZhan"><a href="javascript:void(0);"
				class="rightSidebar3">
					<p>手机网站</p> </a>
				<div class="rightBarHidden">
					<div class="item">
						<i class="coinImg"></i>
						<div class="ewmBox">
							<img src="${ctx }/Content/image/shoujiliulan.png" height="100px"
								width="120px" />
							<div class="textTip">浏览手机网站</div>
						</div>
					</div>
				</div>
			</li>
			<li class="cbl_list elevator_top" style="display: none;"><a
				href="http://18665635806.chinawutong.com/#" class="rightSidebar4">
					<p>回到顶部</p> </a>
			</li>
		</ul>

	</form>
	<script type="text/javascript">
        var pageSize = 6;
        var startIndex = 0;
        var CustomName = '${sessionScope.custom.getCustomname()}';

        $(function () {
            $("#dengLu").html("");
            if (CustomName == null || CustomName == "") {
                $("#dengLu").append('<a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="spanLogin"> <a  href="${ctx }/ClientController/customlogin.do" class="denLu  ">登录</a>&nbsp;&nbsp;<a href="${ctx}/FrontJsp/Register.jsp" class="zhuCe  " target="_blank">免费注册</a>&nbsp;&nbsp; </span>');
                 CustomName=null;
            } else {
                $("#dengLu").append(' <a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span ><a class="denLu  ">' + CustomName + ',您好!</a> &nbsp;&nbsp; <a href="javascript:void(0);" class="zhuCe  " onclick="cancellation()">注销</a></span>');
            }
            //回到顶部
            $(window).scroll(function () {
                var scrollt = $(window).scrollTop();
                if (scrollt > 100) {
                    $(".elevator_top").show();
                } else {
                    $(".elevator_top").stop().hide();
                }
            });

            selectWangDian();
            selectRoute();

            $(".elevator_top").click(function () {
                $("html,body").animate({ scrollTop: "0" }, 200);
                return false;
            });
            //回到顶部

            //右侧边框js效果控制
            $(".ceBianLian .cbList").mouseover(function () {
                $(this).find('.rightBarHidden').css("display", "block");
            });
            $(".ceBianLian .cbList").mouseout(function () {
                $(this).find('.rightBarHidden').css("display", "none");
            });
            //右侧边框js效果控制

            //公司动态js效果控制
            $('#tabTitle li').click(function () {
                var liindex = $('#tabTitle li').index(this);
                $(this).addClass('current').siblings().removeClass('current');
                $('div.tabList').eq(liindex).show().siblings('div.tabList').hide();
            });

            $('#tabTitle li').click(function () {
                var liindex = $('#tabTitle li').index(this);
                $(this).addClass('commonTit-li').siblings().removeClass('commonTit-li');
                $('div.tabList').eq(liindex).show().siblings('div.tabList').hide();
            });

        });

        function cancellation() {
            $.post("${ctx}/ClientController/cancellation.do", function (data) {
                if (data == "true") {
                    location.reload();
                }
            });

        }
         
        
        
        function selectWangDian(proName, cityName) {
            if (proName == undefined) {
                proName = null;
            }
            if (cityName == undefined) {
                cityName = null;
            }
            $.post("${ctx}/ClientController/selectDot.do?proName=" + proName + "&cityName=" + cityName + "&startIndex=0" + "&pageSize=" + 10000, function (data) {

                if (data != "") {
                    if ((typeof data) == "string") {
                        data = JSON.parse(data);
                    }
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#divDataWd").append('<div class="wdCont wdCont1"><h5>' + data[i].proname + ' ' + data[i].dotname + '</h5><p class="chengShi">' + data[i].proname + ' ' + data[i].cityname + ' ' + data[i].disname + '</p><p class="lianXiRen">' + data[i].username + ' <a class="phone">联系电话：' + data[i].tlephone + '</a></p><p class="diDian">' + data[i].adress + '</p></div>');
                        }
                    } else {
                        $("#divDataWd").append('<div class="wdCont wdCont1"><h5>没有查询到有关网点</h5></div>');
                    }

                } else {
                    $("#divDataWd").append('<div class="wdCont wdCont1"><h5>没有查询到有关网点</h5></div>');
                }

            });

        }

        function selectRoute() {
            $.post("${ctx}/ClientController/selectRoute.do?startIndex=" + startIndex + "&pageSize=" + pageSize, function (data) {

                if (data != "") {
                    if ((typeof data) == "string") {
                        data = JSON.parse(data);
                    }

                    for (var i = 0; i < data.length; i++) {
                        var point = data[i].startproname + "-"
                                                    + data[i].startcityname + "-"
                                                    + data[i].startdisname + "/"
                                                    + data[i].endproname + "-"
                                                    + data[i].endcityname + "-"
                                                    + data[i].enddisname;
                        $("#ulWuLiuLine").append('<li class="list1 item10" style="padding: 15px"><a id="' + point + '" onclick="onlineOrder(this.id)"><h4>' + data[i].startproname.split("省")[0] + '&nbsp;' + data[i].startcityname.split("市")[0] + '&nbsp;' + data[i].startdisname.split("区")[0] + '→' + data[i].endproname.split("省")[0] + '&nbsp;' + data[i].endcityname.split("市")[0] + '&nbsp;' + data[i].enddisname.split("区")[0] + '</h4><p><span class="zhongHuo">重货</span> <span class="jiaGe">' + data[i].freightrate + '</span>&nbsp;时效:<span>' + data[i].prescription + '</span></p><p><span class="qingHuo">轻货</span>&nbsp;<span class="jiaGe">' + data[i].freightrate + '</span></p> </a></li>');
                    }
                } else {
                    $("#ulWuLiuLine").html('');
                }
            });
        }
        function onlineOrder(point) {

            window.location.href = "${ctx}/ClientController/online.do?point=" + point;

        }
        /*********************************************网点************************************/


        var hidProVal = $("#ctl00_ContentPlaceHolder_WuLiuWd_hidProValue").val();
        var hidCityVal = $("#ctl00_ContentPlaceHolder_WuLiuWd_hidCityValue").val();
        if (hidProVal != "" && hidCityVal != "") {
            $("#txtPro").val(hidProVal + " - " + hidCityVal);
        }

        //点击搜索时事件
        $("#btnSearch").click(function () {
            var proVal = $("#ctl00_ContentPlaceHolder_WuLiuWd_hidProValue").val();
            var cityVal = $("#ctl00_ContentPlaceHolder_WuLiuWd_hidCityValue").val();

            $("#divDataWd").html("");
            selectWangDian(proVal, cityVal);

        })

        //鼠标离开区域隐藏区域框
        $("#divArea").mouseleave(function () {
            $("#divArea").hide();
        })

        //点击文本框的事件
        $("#txtPro").click(function () {
            if (!$("#liPro").hasClass("current"))
                $("#liPro").addClass("current");
            if ($("#liCity").hasClass("current"))
                $("#liCity").removeClass("current");
            $("#divArea").toggle();
            $("#divPro").show();
            $("#divCity").hide();
        })

        //选中城市时的处理
        function setCityWd(objCity) {
            var pro = $("#ctl00_ContentPlaceHolder_WuLiuWd_hidProValue").val();
            $("#txtPro").val(pro + " - " + objCity);
            $("#divArea").hide();
            $("#ctl00_ContentPlaceHolder_WuLiuWd_hidCityValue").val(objCity);


        }

        //点击省份获取城市
        function getCityWd(proObj) {

            //设置当前的选中的省份
            $("#ctl00_ContentPlaceHolder_WuLiuWd_hidProValue").val(proObj);
            $("#divPro").hide();
            $("#divCity").show();
            if ($("#liPro").hasClass("current"))
                $("#liPro").removeClass("current");
            if (!$("#liCity").hasClass("current"))
                $("#liCity").addClass("current");

            $("#ctl00_ContentPlaceHolder_WuLiuWd_hidCurrentCityPageIndex").val("1");
            $("#ctl00_ContentPlaceHolder_WuLiuWd_hidPageCityTotalCount").val("0");
            var cityPageIndex = $("#ctl00_ContentPlaceHolder_WuLiuWd_hidCurrentCityPageIndex").val();
            CityPageDataWd(proObj, cityPageIndex);
            $("#divDataWd").html("");
        }

        //城市分页
        function CityPageDataWd(proObj, cityPageIndex) {
            $.ajax({
                type: "post",
                url: "${ctx}/ClientController/selectCity.do",
                data: { proName: proObj },
                success: function (data) {
                    if ((typeof data) == "string") {
                        data = JSON.parse(data);
                    }
                    if (data.length > 0) {
                        //选中的省份下面城市的总页面
                        var PageTotalCount = parseInt((data.length + 12 - 1) / 12);
                        $("#ctl00_ContentPlaceHolder_WuLiuWd_hidPageCityTotalCount").val(PageTotalCount);
                        var strLi = "";

                        for (var i = 0; i < data.length; i++) {
                            strLi += "<li class='hot-choose'  data-pro='" + data[i].cityname + "' onclick=setCityWd('" + data[i].cityname + "') >" + data[i].cityname + "</li>";
                        }
                        $("#ulCity").html(strLi);
                    }
                }
            })
        }

        //省份分页
        function ProPageDataWd(userId, proPageIndex) {
            $.ajax({
                type: "post",
                url: "/template/Tem_blue_1/ashx/wangDian.ashx?type=pro",
                data: { userId: userId, proPageIndex: proPageIndex },
                success: function (data) {
                    if (data.Count > 0) {
                        var strPro = "";
                        var jsonData = JSON.parse(data.strDataJson);
                        for (var i = 0; i < jsonData.length; i++) {
                            strPro += "<li class='hot-choose' data-pro='" + jsonData[i].sheng + "' onclick=getCityWd('" + jsonData[i].sheng + "') >" + jsonData[i].sheng + "</li>";
                        }
                        $("#ulPro").html(strPro);
                    }
                }
            })
        }






        $("#liPro").click(function () {
            if (!$("#liPro").hasClass("current"))
                $("#liPro").addClass("current");
            if ($("#liCity").hasClass("current"))
                $("#liCity").removeClass("current");
            $("#divPro").show();
            $("#divCity").hide();
        })


        /********************************************网点************************************/

    

    </script>
</body>
</html>
