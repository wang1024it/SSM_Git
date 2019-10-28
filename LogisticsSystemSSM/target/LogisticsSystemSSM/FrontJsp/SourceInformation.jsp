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
<!-- saved from url=(0043)http://18665635806.chinawutong.com/huo.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=1200,initial-scale=0.1,user-scalable=yes">
<link href="${ctx }/Content/css/Memberpublic.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>
<link href="${ctx }/Content/css/lbt.css" type="text/css" rel="stylesheet">


<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>


<link rel="stylesheet" type="text/css" href="${ctx }/Content/css/WTMap.css">
<link rel="stylesheet" type="text/css" href="${ctx }/Content/css/huoyuan.css">
<script type="text/javascript" src="${ctx }/Content/js/WTMap.min.js"
	charset="utf-8"></script>
<title>广州市广发物流有限公司_货源</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">

<script src="${ctx }/Content/js/share.js"></script>

<link rel="stylesheet" href="${ctx }/Content/css/share_style0_16.css"
	type="text/css"></link>
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
						target="_blank" href="${ctx }/ClientController/myOrder.do">我的订单</a></li>
					<li class="top_list2 sel"><a
						href="${ctx }/ClientController/personalCenter.do" class="tubiao">个人中心</a>
					</li>
					<li class="top_list2 sel"><a target="_blank"
						href="${ctx }/FrontJsp/HomePage.jsp" class="tubiao">返回首页</a></li>

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
							data-bd-bind="1543198954570">
							<a href="http://18665635806.chinawutong.com/huo.html#" class="bds_more"
								data-cmd="more"></a> <a
								href="http://18665635806.chinawutong.com/huo.html#" class="bds_weixin"
								data-cmd="weixin" title="分享到微信"></a> <a
								href="http://18665635806.chinawutong.com/huo.html#" class="bds_sqq"
								data-cmd="sqq" title="分享到QQ好友"></a> <a
								href="http://18665635806.chinawutong.com/huo.html#" class="bds_qzone"
								data-cmd="qzone" title="分享到QQ空间"></a> <a
								href="http://18665635806.chinawutong.com/huo.html#" class="bds_tsina"
								data-cmd="tsina" title="分享到新浪微博"></a>
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
					<li><a href="${ctx }/FrontJsp/HomePage.jsp">首页</a>
					</li>
					<li><a href="${ctx }/FrontJsp/Introduction.jsp" class="">公司简介</a>
					</li>
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="">形象展示</a>
					</li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a>
					</li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp">物流专线</a>
					</li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="nav-current">货源信息</a>
					</li>

					<li><a href="${ctx }/FrontJsp/Join.jsp" class="">招商加盟</a>
					</li>
					<li><a href="${ctx }/ClientController/online.do">在线下单</a>
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
		<div class="huoYuan" id="divData">
			<div class="hyTitle">
				<div class="hyLeft fl">
					<h4>货源信息</h4>
				</div>

				<div class="clear"></div>
			</div>
			<div class="hyTop">
				<input class="chuFaDi" id="tc_from" type="text"
					wtmap="{c:&#39;tc_from&#39;,cb:true}" placeholder="请输入出发地"
					readonly="readonly"> <a class="jianTou1"> <img
					src="${ctx }/Content/image/jiantao1.png"> </a> <input class="daoDaDi"
					id="tc_to" type="text" wtmap="{c:&#39;tc_to&#39;,cb:true}"
					placeholder="请选择到达地" readonly="readonly"> <input type="button"
					class="souCompany" id="searchComBtn"
					onclick="javascript: return searchCom();" value="搜本公司">
				<button class="souStation" type="button" onclick="searchSite();">搜全站</button>
				<input name="ctl00$ContentPlaceHolder$hidFrom" type="hidden"
					id="ctl00_ContentPlaceHolder_hidFrom"> <input
					name="ctl00$ContentPlaceHolder$hidTo" type="hidden"
					id="ctl00_ContentPlaceHolder_hidTo"> <span class="empty"><a
					href="javascript:void(0);" onclick="reload();" style="color: grey">清空</a> </span>
			</div>
			<div class="hyList">
				<ul class="SupplyInfor_th">
					<li class="Sup1">出发地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						→</li>
					<li class="Sup2">到达地</li>
					<li class="Sup3">货物名称</li>
					<li class="Sup4">货物重量</li>
					<li class="Sup5">货物体积</li>
					<li class="Sup6">需求车型</li>
					<li class="Sup7">信息有效期</li>
				</ul>

			</div>

			<div class="defaultPage hyPage">
				<div>
					<img src="${ctx }/Content/image/HyNone.jpg" width="214" height="195"
						alt="暂无货源信息">
				</div>
				<p>
					很抱歉，本公司暂时没有发布货源信息<br> 全站目前有<span>3795001</span>条货源信息，<span class="See"><a
						href="http://www.chinawutong.com/203/" target="_blank">点击查看!</a> </span>
				</p>
			</div>

		</div>
		<div style="clear: both; margin-bottom: 20px;"></div>
		<input type="hidden" id="hidPage" value="1">
		<!--内容部分-->
		<script type="text/javascript">
			$(function() {

				var pIndex = parseInt($("#hidPage").val());
				if (pIndex > 1) {
					$("html,body").animate({
						scrollTop : $("#divData").offset().top
					}, 300)
				}

				var fromValue = $("#ctl00_ContentPlaceHolder_hidFrom").val();
				var toValue = $("#ctl00_ContentPlaceHolder_hidTo").val();
				$("#tc_from").val(fromValue);
				$("#tc_to").val(toValue);
			})

			//加载
			function reload() {
				$("#ctl00_ContentPlaceHolder_hidFrom").val("");
				$("#ctl00_ContentPlaceHolder_hidTo").val("");
				$("#tc_from").val("");
				$("#tc_to").val("");
				window.location.href = "/huo.html";
			}

			//本公司搜索
			function searchCom() {
				var fromValue = $("#tc_from").val();
				var toValue = $("#tc_to").val();
				if (fromValue == "") {
					alert("请输入出发地！");
					return false;
				}

				if (toValue == "") {
					alert("请输入到达地！");
					return false;
				}
				$("#ctl00_ContentPlaceHolder_hidFrom").val(fromValue);
				$("#ctl00_ContentPlaceHolder_hidTo").val(toValue);
				window.location.href = "/huo/" + fromValue + "/" + toValue
						+ "/p1.html";
			}

			//搜全站
			function searchSite() {
				var fromValue = $("#tc_from").val();
				var toValue = $("#tc_to").val();
				if (fromValue == "") {
					alert("请输入出发地！");
					return;
				}

				if (toValue == "") {
					alert("请输入到达地！");
					return;
				}

				var allSiteUrl = "http://www.chinawutong.com/Ashx/gethuoArea.ashx?f="
						+ escape(fromValue) + "&t=" + escape(toValue);
				var newTab = window.open('about:blank');
				$
						.ajax({
							type : "get",
							async : false,
							url : allSiteUrl,
							dataType : "jsonp",
							jsonp : "callback",
							success : function(json) {
								var areaIds = json.url.split(",");
								newTab.location.href = "http://www.chinawutong.com/203/a"
										+ areaIds[0]
										+ "b"
										+ areaIds[1]
										+ "k"
										+ areaIds[2]
										+ "l"
										+ areaIds[3]
										+ "m"
										+ areaIds[4]
										+ "n"
										+ areaIds[5]
										+ "j-1/";
							},
							error : function() {
								alert('fail');
							}
						});
			}
		</script>



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
			//右侧边框js效果控制

			//公司动态js效果控制
			$('#tabTitle li').click(
					function() {
						var liindex = $('#tabTitle li').index(this);
						$(this).addClass('current').siblings().removeClass(
								'current');
						$('div.tabList').eq(liindex).show().siblings(
								'div.tabList').hide();
					});

			$('#tabTitle li').click(
					function() {
						var liindex = $('#tabTitle li').index(this);
						$(this).addClass('commonTit-li').siblings()
								.removeClass('commonTit-li');
						$('div.tabList').eq(liindex).show().siblings(
								'div.tabList').hide();
					});

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
