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
<!-- saved from url=(0049)http://18665635806.chinawutong.com/zhaoshang.html -->
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
<link rel="stylesheet" href="${ctx }/Content/css/zhaoshang.css" type="text/css"></link>

<link rel="stylesheet" href="${ctx }/Content/css/share_style0_16.css"
	type="text/css"></link>

<title>物流加盟_招商加盟_加盟快递_广州市广发物流有限公司</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">


</head>
<body>
	<form name="aspnetForm" method="post" action="" id="aspnetForm">



		<!--头部信息开始-->
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
							data-bd-bind="1543198175485">
							<a href="http://18665635806.chinawutong.com/zhaoshang.html#"
								class="bds_more" data-cmd="more"></a> <a
								href="http://18665635806.chinawutong.com/zhaoshang.html#"
								class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> <a
								href="http://18665635806.chinawutong.com/zhaoshang.html#"
								class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a> <a
								href="http://18665635806.chinawutong.com/zhaoshang.html#"
								class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a
								href="http://18665635806.chinawutong.com/zhaoshang.html#"
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
					<li><a href="${ctx }/FrontJsp/HomePage.jsp">首页</a></li>
					<li><a href="${ctx }/FrontJsp/Introduction.jsp" class="">公司简介</a></li>
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="">形象展示</a></li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a></li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp" class="">物流专线</a></li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="">货源信息</a></li>

					<li><a href="${ctx }/FrontJsp/Join.jsp" class="nav-current">招商加盟</a></li>

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
		<div class="wdBanner2"></div>
		<!--子页banner结束-->


		<div class="zhaoShang" id="divData">
			<div class="zsTitle">
				<div class="zsLeft fl">
					<h4>招商加盟</h4>
				</div>

				<div class="clear"></div>
			</div>
			<div class="zsList">
				<ul class="SupplyInfor_th">
					<li class="Sup1">招商标题</li>
					<li class="Sup2">招商区域</li>
					<li class="Sup3">起始时间</li>
					<li class="Sup4">结束时间</li>
					<li class="Sup5">联系人</li>
					<li class="Sup6">联系电话</li>
				</ul>

			</div>

			<div class="defaultPage jmPage">
				<div>
					<img src="${ctx }/Content/image/jmNone.jpg" width="214" height="195"
						alt="暂无招商加盟信息">
				</div>
				<p>很抱歉，本公司暂时没有发布招商加盟信息！</p>
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
		var CustomName = '${sessionScope.custom.getCustomname()}';

		$(function() {
			$("#dengLu").html("");
			if (CustomName == null || CustomName == "") {
				$("#dengLu")
						.append(
								'<a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="spanLogin"> <a  href="${ctx }/ClientController/customlogin.do" class="denLu  ">登录</a>&nbsp;&nbsp;<a href="#" class="zhuCe  " target="_blank">免费注册</a>&nbsp;&nbsp; </span>');

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