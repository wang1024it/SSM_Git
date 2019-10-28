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
<!-- saved from url=(0048)http://18665635806.chinawutong.com/wangdian.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=1200,initial-scale=0.1,user-scalable=yes">

<link href="${ctx }/Content/css/Memberpublic.css" rel="stylesheet" />
<link href="${ctx }/Content/css/lbt.css" rel="stylesheet" />


<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>
<script src="${ctx }/Content/js/json2.js"></script>


<script src="${ctx }/Content/js/lunbo.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/WTMap.min.js"></script>

<link rel="stylesheet" href="${ctx }/Content/css/share_style0_16.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/wangdian.css" type="text/css"></link>
<link href="${ctx }/Content/css/WTMap.css" rel="stylesheet" />
<!-- <script type="text/javascript" -->
<!-- 	src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script> -->
<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
<script src="${ctx }/Content/js/share.js"></script>

<script src="${ctx }/Content/js/convertor.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>

<title>广州市广发物流有限公司_网点</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">
<style type="text/css">
#divMap {
	width: 100%;
	height: 100%;
}
</style>


</head>
<body>
	<form name="aspnetForm" method="post" action="" id="aspnetForm">
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
							data-bd-bind="1542005833050">
							<a href="http://18665635806.chinawutong.com/wangdian.html#"
								class="bds_more" data-cmd="more"></a> <a
								href="http://18665635806.chinawutong.com/wangdian.html#"
								class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> <a
								href="http://18665635806.chinawutong.com/wangdian.html#" class="bds_sqq"
								data-cmd="sqq" title="分享到QQ好友"></a> <a
								href="http://18665635806.chinawutong.com/wangdian.html#"
								class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a
								href="http://18665635806.chinawutong.com/wangdian.html#"
								class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
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
		<!--子页banner开始-->
		<div class="wdBanner"></div>
		<!--子页banner结束-->
		<!--内容部分-->
		<div class="webSite" id="divData">
			<div class="webTitle">
				<h4>网点分布</h4>
			</div>
			<div class="webTop">
				<div class="wdCitys">
					<input id="txtPro" type="text" readonly="" value="请选择城市" class="wdInput">
					<div id="divArea" class="area-select wdarea-select" style="display: none;">
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

									<li class="hot-choose" data-pro="广东省" id="广东省"
										onclick="getCity(this.id)">广东省</li>

									<li class="hot-choose" data-pro="四川省" id="四川省"
										onclick="getCity(this.id)">四川省</li>

								</ul>
							</div>
							<div id="divProPage">
								<div class="area-btn wdarea-pre btnMl">
									<span id="spanProPre" class="area-pre ">&lt;</span>
								</div>
								<div class="area-btn wdarea-pre">
									<span id="spanProNext" class="area-next ">&gt;</span>
								</div>
							</div>
						</div>
						<div id="divCity" style="display: none;">
							<div class="con wdCon" style="overflow: auto;">
								<ul id="ulCity"></ul>
							</div>

						</div>

					</div>
				</div>
				<input name="ctl00$ContentPlaceHolder$hidPro" type="hidden"
					id="ctl00_ContentPlaceHolder_hidPro"> <input id="btnQuery"
					type="button" class="wdCityCx" onclick="query();" value="查询"> <input
					id="btnMapQuery" type="button" class="wdCityCx" value="查询"
					onclick="mapQuery();" style="display: none"> <input
					id="ctl00_ContentPlaceHolder_hidProValue" type="hidden" />

			</div>
			<!-- 			<div class="wtRight fr"> -->
			<!-- 				<a id="aList" href="javascript:void(0);" class=" listMode lbchecked">列表模式</a> -->
			<!-- 				<a id="aMap" href="javascript:createMap(&#39;&#39;,&#39;&#39;);" -->
			<!-- 					class="mapMode">地图模式</a> -->
			<!-- 			</div> -->

			<div class="clear"></div>
			<div id="divWdList">
				<div class="webList" id="webList"></div>

				<div class="pageBox">
					<div class="subPagination" id="area_footer"></div>
					<div id="page_num" style="margin-left: 48%"></div>
				</div>


			</div>

		</div>
		<div style="clear: both; margin-bottom: 20px;"></div>

		<!--内容部分-->


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
		var pageSize = 10;
		var startIndex = 0;
		var ZongYeShu = 0;
		var YeShu = 1;
		var pageNumber = 0;
		var CustomName = '${sessionScope.custom.getCustomname()}';

		$(function() {
			$("#dengLu").html("");
			if (CustomName == null || CustomName == "") {
				$("#dengLu")
						.append(
								'<a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="spanLogin"> <a  href="${ctx }/ClientController/customlogin.do" class="denLu  ">登录</a>&nbsp;&nbsp;<a href="${ctx}/FrontJsp/Register.jsp" class="zhuCe  " target="_blank">免费注册</a>&nbsp;&nbsp; </span>');

			} else {
				$("#dengLu")
						.append(
								' <a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span ><a class="denLu  ">'
										+ CustomName
										+ ',您好!</a> &nbsp;&nbsp; <a href="javascript:void(0);" class="zhuCe  " onclick="cancellation()">注销</a></span>');
			}
			selectWangDian(null, null);
			//selectDotCount(null, null);
			//回到顶部
			$(window).scroll(function() {
				var scrollt = $(window).scrollTop();
				if (scrollt > 100) {
					$(".elevator_top").show();
				} else {
					$(".elevator_top").stop().hide();
				}
			});
			$(".elevator_top").click(function() {
				$("html,body").animate({
					scrollTop : "0"
				}, 200);
				return false;
			});
			//回到顶部

			//右侧边框js效果控制
			$(".ceBianLian .cbList").mouseover(function() {
				$(this).find('.rightBarHidden').css("display", "block");
			});
			$(".ceBianLian .cbList").mouseout(function() {
				$(this).find('.rightBarHidden').css("display", "none");
			});

		});

		function selectDotCount(proName, cityName) {
			if (proName == undefined) {
				proName = null;
			}
			if (cityName == undefined) {
				cityName = null;
			}
			$
					.post(
							"${ctx}/ClientController/selectDotCount.do?proName="
									+ $.trim(proName) + "&cityName="
									+ $.trim(cityName) + "&startIndex="
									+ startIndex + "&pageSize=" + pageSize,
							function(data) {
								if (data != "" && data != null) {
									ZongYeShu = Math.ceil(data / pageSize);
									if (YeShu > 0) {
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
									} else {
										$("#page_num").html("");
									}
								} else {
									$("#page_num").html("");
								}

							});

		}

		function selectWangDian(proName, cityName) {

			$("#webList").html('');
			if (proName == undefined) {
				proName = null;
			}
			if (cityName == undefined) {
				cityName = null;
			}
			$
					.post(
							"${ctx}/ClientController/selectDot.do?proName="
									+ $.trim(proName) + "&cityName="
									+ $.trim(cityName) + "&startIndex="
									+ startIndex + "&pageSize=" + pageSize,
							function(data) {

								if (data != "") {
									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									if (data.length > 0) {

										$("#webList")
												.append(
														'<ul class="SupplyInfor_th"><li class="SupW">网点名称</li><li class="SupS">所在地</li><li class="SupL">联系人</li><li class="SupP">联系电话</li><li class="SupD">地址</li></ul>');

										for ( var i = 0; i < data.length; i++) {
											$("#webList")
													.append(
															'<ul class="SupplyInfor_source"><li class="SupWD wd" > <a >'
																	+ data[i].dotname
																	+ '</a> </li>  <li class="SupDD">'
																	+ data[i].proname
																	+ '  '
																	+ data[i].cityname
																	+ ' '
																	+ data[i].disname
																	+ '  </li><li class="SupRE"><span>'
																	+ data[i].username
																	+ '</span></li> <li class="SupDH"><span>'
																	+ data[i].tlephone
																	+ ' </span> </li>  <li class="SupDZ"><span >'
																	+ data[i].adress
																	+ '</span></li><li class="SupDT"></li> <li class="SupZX"><a href="${ctx}/FrontJsp/OnlineOrder.jsp" target="_blank">在线下单</a></li></ul>');
										}
									} else {
										$("#divDataWd")
												.append(
														'<div class="wdCont wdCont1"><h5>没有查询到有关网点</h5></div>');
									}

								} else {
									$("#divDataWd")
											.append(
													'<div class="wdCont wdCont1"><h5>没有查询到有关网点</h5></div>');
								}

							});

		}

		function next(ID) {
			$("#" + ID).css('color', '#2594cb');
			$("#" + ID).css('border', '1px solid #2594cb');
			startIndex = (ID * pageSize);
			if (fromValue != undefined && toValue != undefined) {
				selectRoute(startIndex, pageSize, fromValue, toValue);
			} else {
				selectRoute(startIndex, pageSize, null, null);
			}
			$("#" + pageNumber).css('color', "black");
			$("#" + pageNumber).css('border', "1px solid #aaa");
			YeShu = ID + 1;
			scrollTo("#divData", 1000);
			pageNumber = parseInt(ID);
		}
		function xiaYiYe(shu) {
			$("#" + (parseInt(pageNumber) + 1)).css('color', '#2594cb');
			$("#" + (parseInt(pageNumber) + 1)).css('border',
					'1px solid #2594cb');
			$("#" + pageNumber).css('color', "black");
			$("#" + pageNumber).css('border', "1px solid #aaa");
			if (parseInt(shu) < ZongYeShu) {

				startIndex = (shu * pageSize);
				selectRoute(startIndex, pageSize, null, null);
				YeShu = shu + 1;
			} else {
				layer.alert("已经是最后一页了！！", {
					icon : 0,
					title : "提示："
				});
			}
			scrollTo("#divData", 1000);
			pageNumber = parseInt(pageNumber) + 1;
		}

		//查询
		function query() {
			var name = $("#txtPro").val();
			selectWangDian(name.split("-")[0], name.split("-")[1]);

		}

		//点击文本框的事件
		$("#txtPro").click(function() {
			if (!$("#liPro").hasClass("current"))
				$("#liPro").addClass("current");
			if ($("#liCity").hasClass("current"))
				$("#liCity").removeClass("current");
			$("#divArea").show();
			$("#divPro").show();
			$("#divCity").hide();
			$("#webList").html('');

		})

		$(".SupplyInfor_source #wangDian").mouseover(function() {
			$(this).find('.leftBarHidden').css("display", "block");
		});

		$(".SupplyInfor_source #wangDian").mouseout(function() {
			$(this).find('.leftBarHidden').css("display", "none");
		});

		//选中城市时的处理
		function setCity(objCity) {
			var pro = $("#ctl00_ContentPlaceHolder_hidProValue").val();
			$("#txtPro").val(pro + " - " + objCity);
			$("#divArea").hide();
			$("#ctl00_ContentPlaceHolder_hidCityValue").val(objCity);
			query();
		}

		//点击省份获取城市
		function getCity(proObj) {
			//设置当前的选中的省份
			$("#ctl00_ContentPlaceHolder_hidProValue").val(proObj);
			$("#divPro").hide();
			$("#divCity").show();
			if ($("#liPro").hasClass("current"))
				$("#liPro").removeClass("current");
			if (!$("#liCity").hasClass("current"))
				$("#liCity").addClass("current");

			$("#ctl00_ContentPlaceHolder_hidCurrentCityPageIndex").val("1");
			$("#ctl00_ContentPlaceHolder_hidPageCityTotalCount").val("0");
			var cityPageIndex = $(
					"#ctl00_ContentPlaceHolder_hidCurrentCityPageIndex").val();
			CityPageData(proObj);
		}

		//城市分页
		function CityPageData(proObj) {
			$
					.ajax({
						type : "post",
						url : "${ctx}/ClientController/selectCity.do",
						data : {
							proName : proObj
						},
						success : function(data) {
							if ((typeof data) == "string") {
								data = JSON.parse(data);
							}
							if (data.length > 0) {
								//选中的省份下面城市的总页面
								var PageTotalCount = parseInt((data.length + 12 - 1) / 12);
								$(
										"#ctl00_ContentPlaceHolder_WuLiuWd_hidPageCityTotalCount")
										.val(PageTotalCount);
								var strLi = "";

								for ( var i = 0; i < data.length; i++) {
									strLi += "<li class='hot-choose'  data-pro='"
											+ data[i].cityname
											+ "' onclick=setCity('"
											+ data[i].cityname
											+ "') >"
											+ data[i].cityname + "</li>";
								}
								$("#ulCity").html(strLi);
							}
						}
					})
		}

		function LookMap(lngObj, latObj, proObj, cityObj) {
			$("#ctl00_ContentPlaceHolder_hidProValue").val(proObj);
			$("#ctl00_ContentPlaceHolder_hidCityValue").val(cityObj);
			createMap(lngObj, latObj);
		}

		//地图查询
		function mapQuery() {
			var proVal = $("#ctl00_ContentPlaceHolder_hidProValue").val();
			var cityVal = $("#ctl00_ContentPlaceHolder_hidCityValue").val();
			createMap("", "");
		}

		$("#liPro").click(function() {
			if (!$("#liPro").hasClass("current"))
				$("#liPro").addClass("current");
			if ($("#liCity").hasClass("current"))
				$("#liCity").removeClass("current");
			$("#divPro").show();
			$("#divCity").hide();
		});
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
