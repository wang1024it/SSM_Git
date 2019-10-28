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
<!-- saved from url=(0049)http://18665635806.chinawutong.com/xingxiang.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=1200,initial-scale=0.1,user-scalable=yes">
<link rel="stylesheet" href="${ctx }/Content/css/Memberpublic.css"
	type="text/css"></link>
<link href="${ctx }/Content/css/Memberpublic.css" rel="stylesheet" />

<link href="${ctx }/Content/css/lbt.css" rel="stylesheet" />
<link href="${ctx }/Content/css/MemVipTwopage.css" rel="stylesheet" />

<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>





<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>

<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
<link href="${ctx }/Content/css/share_style0_16.css" rel="stylesheet" />

<title>广州市广发物流有限公司_形象展示</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">


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
							data-bd-bind="1542005844441">
							<a href="http://18665635806.chinawutong.com/order.html#" class="bds_more"
								data-cmd="more"></a> <a
								href="http://18665635806.chinawutong.com/order.html#" class="bds_weixin"
								data-cmd="weixin" title="分享到微信"></a> <a
								href="http://18665635806.chinawutong.com/order.html#" class="bds_sqq"
								data-cmd="sqq" title="分享到QQ好友"></a> <a
								href="http://18665635806.chinawutong.com/order.html#" class="bds_qzone"
								data-cmd="qzone" title="分享到QQ空间"></a> <a
								href="http://18665635806.chinawutong.com/order.html#" class="bds_tsina"
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
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="nav-current">形象展示</a>
					</li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a>
					</li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp" class="">物流专线</a>
					</li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="">货源信息</a>
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
		<div class="wdBanner1"></div>
		<!--子页banner结束-->
		<!--内容部分-->
		<div class="aboutUS_box">

			<div class="main_left left fl" style="height: 483px;" id="tabTitle">
				<div class="main_leftTitle">
					<span class="f_18 col_f">关于我们</span>
				</div>
				<ul class="sidebar">
					<li class="sidebar_li"><a
						href="http://18665635806.chinawutong.com/jianjie.html" class="sidebar_a ">公司简介</a>
					</li>
					<li class="sidebar_li  active"><a
						href="http://18665635806.chinawutong.com/xingxiang.html" class="sidebar_a">形象展示</a>
					</li>
					<li class="sidebar_li"><a
						href="http://18665635806.chinawutong.com/linkus.html" class="sidebar_a">联系我们</a>
					</li>

					<li class="sidebar_li"><a
						href="http://18665635806.chinawutong.com/webnotice.html" class="sidebar_a">公司动态</a>
					</li>

				</ul>
			</div>
			<div id="tabContent">
				<div class="tabList" style="display: block;">
					<div class="main_right right fl xxzs">
						<div class="main_rightTitle">
							<div class="col_2691d5 f_17 fl leftTitle">形象展示</div>
							<div class="col_666666 f_17 fr rightTitle">
								<span class="col_4e4e4e">位置：</span> <a
									href="http://18665635806.chinawutong.com/" class="col_4e4e4e">首页</a><span
									class="col_4e4e4e">&nbsp;&gt;&nbsp;</span><a class="col_4e4e4e">形象展示</a>
							</div>
						</div>
						<div class="gywm_Box">
							<div class="xxzsTittle">
								<ul class="zssubList">
									<li class="xxzs-li"><a id="aAll" href="javascript:void(0);">全部</a>
									</li>
									<li class=""><a id="aZzzm" href="javascript:void(0);">资质证照</a>
									</li>
									<li class=""><a id="aRyzs" href="javascript:void(0);">荣誉证书</a>
									</li>
									<li class=""><a id="aGsxx" href="javascript:void(0);"> 公司形象 </a>
									</li>
								</ul>
							</div>
							<div id="divAll" style="display:block;">

								<div id="divAll1">
									<div class="xxzsCont">
										<ul class="zssubLists">

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
													alt="公司照片" title="公司照片" layer-index="0"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
													alt="公司照片" title="公司照片" layer-index="1"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
													alt="公司照片" title="公司照片" layer-index="2"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
													alt="公司照片" title="公司照片" layer-index="3"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
													alt="公司照片" title="公司照片" layer-index="4"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>


											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
													alt="公司照片" title="公司照片" layer-index="5"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
													alt="公司照片" title="公司照片" layer-index="6"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
													alt="公司照片" title="公司照片" layer-index="7"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
													alt="公司照片" title="公司照片" layer-index="8"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

										</ul>
									</div>

								</div>


								<div id="divAll2">
									<div class="xxzsCont">
										<ul class="zssubLists">

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvL6ACgZGAAB2oPrA-Bc505.jpg"
													alt="公司照片" title="公司照片" layer-index="0"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvL6ACgZGAAB2oPrA-Bc505.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvL6AOI_gAAVdsfI6kFM184.png"
													alt="公司照片" title="公司照片" layer-index="1"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvL6AOI_gAAVdsfI6kFM184.png"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLyAM_doAABiP_aaR2c136.jpg"
													alt="公司照片" title="公司照片" layer-index="2"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLyAM_doAABiP_aaR2c136.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLyACS0_AAI2KQinnVE546.jpg"
													alt="公司照片" title="公司照片" layer-index="3"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLyACS0_AAI2KQinnVE546.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLyATqUVAADmEe2XxXM903.jpg"
													alt="公司照片" title="公司照片" layer-index="4"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLyATqUVAADmEe2XxXM903.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLyAa_yMAABscNAWarQ360.jpg"
													alt="公司照片" title="公司照片" layer-index="5"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLyAa_yMAABscNAWarQ360.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLyAIlqPAABdxGyKpQA695.jpg"
													alt="公司照片" title="公司照片" layer-index="6"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLyAIlqPAABdxGyKpQA695.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuAWR8ZAACSOrkv8qA720.jpg"
													alt="公司照片" title="公司照片" layer-index="7"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuAWR8ZAACSOrkv8qA720.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuAEP6QAABbAQtTwwI640.jpg"
													alt="公司照片" title="公司照片" layer-index="8"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuAEP6QAABbAQtTwwI640.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a>
											</li>

										</ul>
									</div>

								</div>

								<div id="divAll3">
									<div class="xxzsCont">
										<ul class="zssubLists">

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuAT0hKAABVz0vgEHk114.jpg"
													alt="公司照片" title="公司照片" layer-index="0"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuAT0hKAABVz0vgEHk114.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuARkeZAAColbbvd4c111.jpg"
													alt="公司照片" title="公司照片" layer-index="1"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuARkeZAAColbbvd4c111.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuAJxy4AABNmwGUSKk951.jpg"
													alt="公司照片" title="公司照片" layer-index="2"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuAJxy4AABNmwGUSKk951.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuAFmynAAIu6TzjsGk551.jpg"
													alt="公司照片" title="公司照片" layer-index="3"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuAFmynAAIu6TzjsGk551.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvLuADR3lAABdoGWPHiQ595.jpg"
													alt="公司照片" title="公司照片" layer-index="4"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvLuADR3lAABdoGWPHiQ595.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

										</ul>
									</div>

								</div>

								<div class="pageBox">
									<div class="subPagination">
										<div id="page_num">
											<span class="th" onclick="one()" id="one">1</span><a
												href="javascript:void(0);" id="two" onclick="two()">2</a><a
												onclick="three()" href="javascript:void(0);" id="three">3</a>
										</div>
									</div>
								</div>
							</div>
							<div id="divZzzm" style="display:none;">

								<!--资质证照信息空白页-->
								<div class="defaultPage zzPage" aria-disabled="false">
									<div>
										<img src="${ctx }/Content/image/zzNone.jpg" width="214" height="195"
											alt="暂无资质证照图片">
									</div>
									<p>很抱歉，暂时没有资质证照相关图片！</p>
								</div>

							</div>
							<div id="divRyzs" style="display:none;">

								<!--荣誉证书信息空白页-->
								<div class="defaultPage ryPage" onclick="return false;">
									<div>
										<img src="${ctx }/Content/image/ryNone.jpg" width="214" height="195"
											alt="暂无荣誉证书图片">
									</div>
									<p>很抱歉，暂时没有荣誉证书相关图片！</p>
								</div>

							</div>
							<div id="divGsxx" style="display:none;">

								<div id="divGsxx1">
									<div class="xxzsCont">
										<ul class="zssubLists">

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
													alt="公司照片" title="公司照片" layer-index="0"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6OAKdCXAAFM3csjGtE025.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
													alt="公司照片" title="公司照片" layer-index="1"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6OAYpvnAAFQGsSs3tY799.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
													alt="公司照片" title="公司照片" layer-index="2"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6OAcQ2pAAFv-LBgaz0510.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
													alt="公司照片" title="公司照片" layer-index="3"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6KAZv7pAAFZi4Qtu9Y362.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
													alt="公司照片" title="公司照片" layer-index="4"> </a> <a
												href="${ctx }/Content/image/cnHoe1rdk6KAcyOzAAJWbKaFfPY250.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
													alt="公司照片" title="公司照片" layer-index="5"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvMCAN9oQAACFbBwL5Ho651.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
													alt="公司照片" title="公司照片" layer-index="6"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvMCAXadQAABPE0Wn550430.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
													alt="公司照片" title="公司照片" layer-index="7"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvL-ACnHnAAJKTW0KA5Y459.jpg"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

											<li class="zsareaList"><a href="javascript:void(0);"> <img
													onclick="funAddDiv();"
													src="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
													alt="公司照片" title="公司照片" layer-index="8"> </a> <a
												href="${ctx }/Content/image/cnHoe1rZvL-AeUZAAAL8t87ZXJ0856.png"
												target="_blank" class="cangChu">
													<p>公司照片</p> </a></li>

										</ul>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="clear: both; margin-bottom: 20px;"></div>


		<!--内容部分-->

		<script type="text/javascript">
		var CustomName='${sessionScope.custom.getCustomname()}';
        $(function () {  if (CustomName==null||CustomName=="") {
       $("#dengLu").append('<a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="spanLogin"> <a  href="${ctx }/ClientController/customlogin.do" class="denLu  ">登录</a>&nbsp;&nbsp;<a href="${ctx}/FrontJsp/Register.jsp" class="zhuCe  " target="_blank">免费注册</a>&nbsp;&nbsp; </span>');
		
	  }else
	  {
	  $("#dengLu").append(' <a href="javascript:void(0);" class="wuTong">欢迎来到物流公司</a>&nbsp;&nbsp;&nbsp;&nbsp;<span ><a class="denLu  ">'+CustomName+',您好!</a> &nbsp;&nbsp; <a href="javascript:void(0);" class="zhuCe  " onclick="cancellation()">注销</a></span>');
	  } 
        $("#one").css("color","black");
         $("#divAll2").hide();
         $("#divAll3").hide();
            layer.photos({
                photos: '#divZzzm1', shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });

            layer.photos({
                photos: '#divRyzs1', shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });

            layer.photos({
                photos: '#divGsxx1', shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });

            layer.photos({
                photos: '#divAll1', shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });

            

            $("#aAll").click(function () {
                $(".zssubList li").each(function () {
                    $(this).removeClass("xxzs-li");
                })
                $(this).parent().addClass("xxzs-li");
                $("#divAll").show();
                $("#divZzzm").hide();
                $("#divRyzs").hide();
                $("#divGsxx").hide();
            });

            $("#aZzzm").click(function () {
                $(".zssubList li").each(function () {
                    $(this).removeClass("xxzs-li");
                })
                $(this).parent().addClass("xxzs-li");
                $("#divZzzm").show();
                $("#divRyzs").hide();
                $("#divGsxx").hide();
                $("#divAll").hide();
            })

            $("#aRyzs").click(function () {
                $(".zssubList li").each(function () {
                    $(this).removeClass("xxzs-li");
                })
                $(this).parent().addClass("xxzs-li");
                $("#divZzzm").hide();
                $("#divRyzs").show();
                $("#divGsxx").hide();
                $("#divAll").hide();
            })

            $("#aGsxx").click(function () {
                $(".zssubList li").each(function () {
                    $(this).removeClass("xxzs-li");
                })
                $(this).parent().addClass("xxzs-li");
                $("#divZzzm").hide();
                $("#divRyzs").hide();
                $("#divGsxx").show();
                $("#divAll").hide();
            })

            setInterval(function () {
                if ($(".divClose").length) {
                    return false;
                }
                else { $("#layui-layer-photos").before("<div class='divClose' onclick='closeDiv();' style='cursor: pointer; color:#fff; font-size:30px; position:absolute; top:-30px; right:-50px; _top:30px; _right:50px; z-index:9999;'>×</div>"); }
            }, 500);
        })
           function two()
            {
            $("#divAll1").hide();
            $("#divAll2").show();
            $("#divAll3").hide();
            $("#one").css("background-color","#fff");
            $("#two").css("background-color","#2594cb");
            $("#three").css("background-color","#fff");
            
            }
            
            function one() {
				 $("#divAll1").show();
            $("#divAll2").hide();
            $("#divAll3").hide();
             $("#one").css("background-color","#2594cb");
             $("#one").css("color","black");
            $("#two").css("background-color","#fff");
            $("#three").css("background-color","#fff");
			}
          function three() {
	        $("#divAll1").hide();
            $("#divAll2").hide();
            $("#divAll3").show();
            $("#one").css("background-color","#fff");
            $("#two").css("background-color","#fff");
            $("#three").css("background-color","#2594cb");
           }
        function funAddDiv() {
            setTimeout(function () { $("#layui-layer-photos").before("<div onclick='closeDiv();' style='cursor: pointer; color:#fff; font-size:30px; position:absolute; top:-30px; right:-50px; _top:30px; _right:50px; z-index:9999;'>×</div>"); }, 500);
        }

        function closeDiv() {
            layer.closeAll();
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
    $(function () {
        //回到顶部
        $(window).scroll(function () {
            var scrollt = $(window).scrollTop();
            if (scrollt > 100) {
                $(".elevator_top").show();
            } else {
                $(".elevator_top").stop().hide();
            }
        });
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
		$.post("${ctx}/ClientController/cancellation.do",function(data)
		{
		if (data=="true") {
			location.reload();
		}
		});
	}


    </script>
</body>
</html>