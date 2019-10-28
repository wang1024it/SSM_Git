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
<!-- saved from url=(0044)http://18665635806.chinawutong.com/line.html -->
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

<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
<link href="${ctx }/Content/css/WTMap.css" rel="stylesheet" />

<link href="${ctx }/Content/css/zhuanxian.css" rel="stylesheet" />
<script src="${ctx }/Content/js/share.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/WTMap.min.js"></script>


<title>物流专线_广州市广发物流有限公司</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">

<link href="${ctx }/Content/css/share_style0_16.css" rel="stylesheet" />




<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
</head>
<body>
	<form name="aspnetForm" method="post"
		action="http://18665635806.chinawutong.com/WuLiuLine.aspx?id=1711562"
		id="aspnetForm">


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
					<li class="top_list2 sel"><a
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
					<li><a href="${ctx }/FrontJsp/HomePage.jsp">首页</a></li>
					<li><a href="${ctx }/FrontJsp/Introduction.jsp" class="">公司简介</a></li>
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="">形象展示</a></li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a></li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp"
						class="nav-current">物流专线</a></li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="">货源信息</a>
					</li>

					<li><a href="${ctx }/FrontJsp/Join.jsp" class="">招商加盟</a></li>

					<li><a href="${ctx }/ClientController/online.do">在线下单</a>
					</li>
					<li><a href="${ctx }/FrontJsp/ContactUs.jsp" class="">联系我们</a>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<!--导航信息结束-->
		<!--子页banner开始-->
		<div class="wdBanner"></div>
		<!--子页banner结束-->
		<!--内容部分-->
		<div class="logisticsLine" id="divData">
			<div class="zxTitle">
				<div class="zxLeft fl">
					<h4>物流专线</h4>
				</div>

				<div class="zxLeft fr">
					<span>广州市广发物流有限公司一共发布<i id="total"></i>条线路信息</span>
				</div>

				<div class="clear"></div>
			</div>
			<div class="zxTop">
				<input id="tc_from" type="text" wtmap="{c:&#39;tc_from&#39;,cb:true}"
					placeholder="请选择出发地" class="chuFaDi" readonly="readonly"> <a
					class="jianTou1"> <img src="../Content/image/jiantao1.png" /> </a> <input
					id="tc_to" type="text" wtmap="{c:&#39;tc_to&#39;,cb:true}"
					placeholder="请选择到达地" class="daoDaDi" readonly="readonly"> <input
					type="button" id="btnSearch" onclick="javascript: return searchCom();"
					value="搜本公司" class="souCompany"> <input type="button"
					id="btnSearch" onclick="javascript: return searchAll();" value="搜索全部"
					class="souCompany"><span class="empty"><a
					href="javascript:void(0);" onclick="reload();" style="color: grey">清空</a> </span>
			</div>
			<div class="webList" id="XianLu"></div>

			<div class="pageBox">
				<div class="subPagination" id="area_footer">
					<div id="page_num"></div>
				</div>
			</div>

		</div>
		<div style="clear: both; margin-bottom: 20px;"></div>



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
				</div></li>

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
				</div></li>
			<li class="cbl_list elevator_top" style="display: none;"><a
				href="http://18665635806.chinawutong.com/#" class="rightSidebar4">
					<p>回到顶部</p> </a></li>
		</ul>

	</form>
	<script type="text/javascript">
		var startIndex = 0;
		var pageSize = 10;
		var YeShu = 1;
		var ZongYeShu;
		var fromValue;
		var toValue;
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
			page(null, null);
			selectRoute(startIndex, pageSize, null, null);
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

		function cancellation() {
			$.post("${ctx}/ClientController/cancellation.do", function(data) {
				if (data == "true") {
					location.reload();
				}
			});
		}
		function selectRoute(startIndex, pageSize, startName, endName) {

			$
					.post(
							"${ctx}/ClientController/selectRoute.do?startIndex="
									+ startIndex + "&pageSize=" + pageSize
									+ "&startName=" + startName + "&endName="
									+ endName,
							function(data) {

								if (data != "") {
									if ((typeof data) == "string") {
										data = JSON.parse(data);
									}
									$("#XianLu").html('');
									$("#XianLu")
											.append(
													'<ul class="SupplyInfor_th "><li class="Sup1">出发地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;→</li><li class="Sup2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到达地</li><li class="Sup3">运价</li><li class="Sup4">时效</li><li class="Sup6">联系人</li><li class="Sup7">联系电话</li></ul>');
									for ( var i = 0; i < data.length; i++) {
										var point = data[i].startproname + "-"
												+ data[i].startcityname + "-"
												+ data[i].startdisname + "/"
												+ data[i].endproname + "-"
												+ data[i].endcityname + "-"
												+ data[i].enddisname;

										$("#XianLu")
												.append(
														'<ul class="SupplyInfor_source SupplyInfor_zx"><li class="SupList1"><a href="#" target="_blank">'
																+ data[i].startproname
																+ '&nbsp; '
																+ data[i].startcityname
																+ ' &nbsp;'
																+ data[i].startdisname
																+ '<i>&nbsp;→&nbsp;</i>'
																+ data[i].endproname
																+ ' &nbsp;'
																+ data[i].endcityname
																+ ' &nbsp;'
																+ data[i].enddisname
																+ '</a></li><li class="SupList4">重货：<span>'
																+ data[i].freightrate
																+ '</span><br> 轻货：<span>'
																+ data[i].freightrate
																+ '</span></li><li class="SupList5"><span>'
																+ data[i].prescription
																+ '</span></li><li class="SupList7">'
																+ data[i].name
																+ '</li><li class="SupList8">'
																+ data[i].phonenumber
																+ '</li><li class="SupList9"><a id="'
																+ point
																+ '" onclick="onlineOrder(this.id)" href="javascript:void(0);" >在线下单</a></li></ul>');
									}
								} else {
									$("#XianLu").html('');
								}
							});
		}

		function page(startName, endName) {

			$
					.post(
							"${ctx}/ClientController/selectRouteConut.do?startName="
									+ startName + "&endName=" + endName,
							function(data) {
								if (data != '') {
									$("#total").text(data);
									ZongYeShu = Math.ceil(data / pageSize);
									if (ZongYeShu > 0) {

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
										$("#" + (parseInt(pageNumber))).css(
												'color', '#2594cb');
										$("#" + (parseInt(pageNumber))).css(
												'border', '1px solid #2594cb');
									} else {
										$("#page_num").html("");
									}
								} else {
									$("#page_num").html("");
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
			YeShu = parseInt(ID + 1);
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
				YeShu = parseInt(shu) + 1;
			} else {
				layer.alert("已经是最后一页了！！", {
					icon : 0,
					title : "提示："
				});
			}
			scrollTo("#divData", 1000);
			pageNumber = parseInt(pageNumber) + 1;
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

		//本公司搜索
		function searchCom() {
			$("#XianLu").html('');
			$("#page_num").html("");
			fromValue = $("#tc_from").val();
			toValue = $("#tc_to").val();
			if (fromValue == "") {
				layer.alert("请输入出发地！", {
					icon : 0,
					title : "提示："
				});
				$("#total").text(0);
				return false;
			}
			if (toValue == "") {
				layer.alert("请输入到达地！", {
					icon : 0,
					title : "提示："
				});
				$("#total").text(0);
				return false;
			}
			page(fromValue, toValue);
			selectRoute(startIndex, pageSize, fromValue, toValue);
			scrollTo("#divData", 1000);
			$("#" + (parseInt(0))).css('color', '#2594cb');
			$("#" + (parseInt(0))).css('border', '1px solid #2594cb');
		}
		function searchAll() {
			reload();

			page(null, null);
			selectRoute(startIndex, pageSize, null, null);
			scrollTo("#divData", 1000);
			$("#" + (parseInt(0))).css('color', '#2594cb');
			$("#" + (parseInt(0))).css('border', '1px solid #2594cb');
		}
		function reload() {
			$("#ctl00_ContentPlaceHolder_hidFrom").val("");
			$("#ctl00_ContentPlaceHolder_hidTo").val("");
			$("#tc_from").val("");
			$("#tc_to").val("");
			fromValue = undefined;
			toValue = undefined;
			$("#XianLu").html('');
			$("#page_num").html("");
			$("#total").text(0);
		}
		function onlineOrder(point) {

			window.location.href = "${ctx }/ClientController/online.do?point="
					+ point;

		}
	</script>
</body>
</html>