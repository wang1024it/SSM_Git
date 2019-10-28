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
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于我们</title>

<base href="<%=basePath%>">

<style type="text/css">
* {
	font-family: "华文仿宋";
	font-weight: bolder;
}
</style>
<link rel="shortcut icon" type="image/svg" href="${ctx}/Content/image/1.ico"
	media="screen" />
<link rel="stylesheet" href="${ctx }/Content/css/lbstyle.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>
</head>
<body>

	<div class="Choices">
		<div class="Choices_text">
			<div style="height: 30px"></div>
			<div class="text-primary">
				<p>
					&ensp;&ensp;&ensp;&ensp;广州广发物流有限公司创始于1996年，公司是一家由传统运输型企业转型为以信息科技为先导，融货物运输、现代金融、互联网交易平台于一体的国家AAAA级综合型现代物流企业和高新技术企业。公司创建的广发物流平台被省发改委确定为江西省省级物流公共信息平台（www.jiangxiwuliu.com），现已成为全国十大重点物流平台、全国第一批无车承运试点合格企业。</p>
			</div>

			<div class="Choices_content"
				style="background-image:url(${ctx}/Content/image/1.jpg);background-repeat:no-repeat ;background-size:100% 100%;">

				<div class="Choicesnext"></div>
				<div class="Choices_banner">
					<ul>
						<li>
							<div class="Choices_left">
								<img id="picture" width="100%" height="399px" title="图片" />
							</div>
							<div class="Choices_right">
								<h1 id="title"></h1>

								<p id="content"></p>
								<div class="Choicesbut">
									<a onclick="interactive.openNtkf('0','')">了解广发物流</a>
								</div>
							</div>
						</li>
						<li>
							<div class="Choices_left">
								<img id="picture1" width="100%" height="399px" title="图片" />
							</div>
							<div class="Choices_right">
								<h1 id="title1"></h1>
								<h2></h2>
								<p id="content1"></p>
								<div class="Choicesbut">
									<a onclick="interactive.openNtkf('0','')">了解广发物流</a>
								</div>
							</div>
						</li>
						<li>
							<div class="Choices_left">
								<img id="picture2" width="100%" height="399px" title="图片" />
							</div>
							<div class="Choices_right">
								<h1 id="title2"></h1>
								<h2></h2>
								<p id="content2"></p>
								<div class="Choicesbut">
									<a onclick="interactive.openNtkf('0','')">了解广发物流</a>
								</div>
							</div>
						</li>
					</ul>
				</div>

			</div>

		</div>
		<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
			<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
				<img alt="图片" height="auto" width="100%" src="${ctx}/Content/image/8001.jpg">
			</div>
			<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6 text-primary">
				<p>&ensp;&ensp;&ensp;&ensp;广发物流积极按照“互联网+高效物流”的战略，打造“中国智慧物流领军企业”，秉承“全程呵护•放心托付”的宗旨，竭诚为广大中小企业、社会运输车辆、第三方物流、仓储配送、工业商贸企业等各类物流市场主体提供物流公共信息服务、平台运力在线管理、物流在线交易担保、货物在线投保、交易主体验证、汽车后市场服务等全系列物流增值服务。通过线上（互联网交易平台）与线下（服务中心）互动模式，实现货与车的高效匹配，运用大数据等先进信息技术为企业提供个性化定制服务。有效地构建大物流市场格局，推动了互联网+物流的网络化发展，降低中小物流企业信息化投入门槛，奠定网络和数据基础，通过现代物流+互联网金融等创新服务提升了产业集中度，为物流业降低运输成本达10%-20%。
				</p>
			</div>
		</div>

		<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="margin-top: 50px">
			<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6 text-primary">
				<p>
					&ensp;&ensp;&ensp;&ensp;广发物流拥有国内一流的运营管理和信息技术团队，开发了运物联（司机版、车主版）、广发物流宝、广发移动APP、广发云车库、广发龙卡等信息服务产品。将订单管理、库存、运输、仓储管理、物料处理以及包装管理优化成一个有机整体，使物流过程能与供应链整体运作保持同步。</p>
				<p>
				<p>&ensp;&ensp;&ensp;&ensp;广发物流立足江西，面向全国，在省内搭建了吉安、南昌、赣州、九江、萍乡等市级物流公共信息平台，加大了在其它设区市的推广力度；在四川、湖北、广东、湖南、河南等省份设立分公司及各地枢纽城市设立物流平台服务中心近百家。</p>
				<p>&ensp;&ensp;&ensp;&ensp;广发物流负责运营的江西省省级物流公共信息平台，是以汇聚物流行业大数据、推进行业发展进程为重点，以整合发改、商务、交通运输、交通管理、市场监管、邮政管理、税务、海关（含检验检疫）、银行、保险等政府部门政务信息及运行数据，铁路、公路、水路、民航等各种运输方式相关数据为目标的公共服务平台，共享物流数据共建诚信联盟，打通政府之间数据对接，形成全省物流大数据。</p>
			</div>
			<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
				<img alt="图片" height="auto" width="100%" src="${ctx}/Content/image/8002.jpg">
			</div>

		</div>

		<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="margin-top: 50px">

			<img alt="图片" height="400px" width="100%" src="${ctx}/Content/image/800.jpg">
		</div>

		<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-primary"
			style="margin-top: 50px">
			<p>&ensp;&ensp;&ensp;&ensp;广发物流独创了中国物流行业“4+3“模式，即以“第四方物流平台为核心，整合第三方物流资源为基础”的物流电商创新模式。全面构建物流产业链，形成命运共同体，依托行业领先的智能化物流技术，致力于打造国内领先的一站式物流公共服务平台；以平台为纽带，以向塘省级分拨中心为枢纽，以物流联盟为载体，以城市物流中心、市县物流园区、乡村服务站为网络，以第三方运力资源为主体，形成面向全国的城乡一体配送体系，实现铁路、公路、水运多式联运，城市配送、专线快运、整车运输等新业态、新模式共享的智慧物流生态圈。</p>
		</div>

		<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="margin-top: 30px">
			<img alt="图片" width="99%" src="${ctx}/Content/image/1.jpg">
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>


	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script>
		var NeiRong = '${information.getInformationcontent()}';
		var Picture = '${information.getInformationpicture()}';
		$(function() {

			$("#title").html(NeiRong.split("@")[0].split("/")[0]);
			$("#content").html(NeiRong.split("@")[0].split("/")[1]);
			$("#picture").attr2(
					"src",
					"${ctx}/PersonalManageController/getPicture.do?fileName="
							+ Picture.split("@")[0]);
			$("#title1").html(NeiRong.split("@")[1].split("/")[0]);
			$("#content1").html(NeiRong.split("@")[1].split("/")[1]);
			$("#picture1").attr2(
					"src",
					"${ctx}/PersonalManageController/getPicture.do?fileName="
							+ Picture.split("@")[1]);
			$("#title2").html(NeiRong.split("@")[2].split("/")[0]);
			$("#content2").html(NeiRong.split("@")[2].split("/")[1]);
			$("#picture2").attr2(
					"src",
					"${ctx}/PersonalManageController/getPicture.do?fileName="
							+ Picture.split("@")[2]);

			$('.Choicesnext').click(
					function() {
						$(".Choices_banner ul").animate(
								{
									marginLeft : "-1184px"
								},
								600,
								function() {
									$(".Choices_banner ul>li").eq(0).appendTo(
											$(".Choices_banner ul"));
									$(".Choices_banner ul").css('marginLeft',
											'0px');
								});

					})
			/*$('.Choicesprev').click(function () {
			    $(".Choices_banner ul").css('marginLeft','-1184px');
			    $(".Choices_banner ul>li").eq(3).prependTo($(".Choices_banner ul"));
			    $(".Choices_banner ul").animate({marginLeft:"0px"},600);
			    $(".Choicestel ul").css('marginLeft','-1184px');
			    $(".Choicestel ul>li").eq(3).prependTo($(".Choicestel ul"));
			    $(".Choicestel ul").css({marginLeft:"0px"},600);
			})  */
		})

		$(function() {
			setInterval("Choices", "3000");
			var tabChange = setInterval(Choices, 3000);
			//鼠标悬停暂停切换
			$('.Choicesnext').mouseover(function() {
				clearInterval(tabChange);
			});
			$('.Choicesnext').mouseout(function() {
				tabChange = setInterval(Choices, 3000);
			});

		});
		function Choices() {
			$(".Choices_banner ul").animate(
					{
						marginLeft : "-1184px"
					},
					600,
					function() {
						$(".Choices_banner ul>li").eq(0).appendTo(
								$(".Choices_banner ul"));
						$(".Choices_banner ul").css('marginLeft', '0px');
					});

		}
	</script>

</body>
</html>
