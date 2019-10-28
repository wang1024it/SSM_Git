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
<!-- saved from url=(0045)http://18665635806.chinawutong.com/order.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=1200,initial-scale=0.1,user-scalable=yes">
<link href="${ctx }/Content/css/Memberpublic.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet" href="${ctx }/Content/css/lbt.css" type="text/css"></link>


<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/lunbo.js"></script>
<script src="${ctx }/Content/js/WTMap.min.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>

<script src="${ctx }/Content/js/WTComm.js"></script>




<link rel="stylesheet" type="text/css"
	href="${ctx }/Content/css/MemVipTwopage.css">
<link rel="stylesheet" type="text/css"
	href="${ctx }/Content/css/Memberpublic.css">
<link rel="stylesheet" type="text/css" href="${ctx }/Content/css/WTComn.css">
<link rel="stylesheet" type="text/css" href="${ctx }/Content/css/WTMap.css">

<title>广州市广发物流有限公司_在线订单</title>
<meta name="keywords" content="广州市广发物流有限公司,18929585464">
<meta name="description"
	content="广州市广发物流有限公司,18929585464,广发物流辐射线路   珠三角地区--成都   珠三角地区--乐山   珠三角地区--眉山   珠三角">
<script src="${ctx }/Content/js/share.js"></script>

<link rel="stylesheet" href="${ctx }/Content/css/share_style0_16.css">
<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
<style type="text/css">
.cus_sel_txt_comm {
	width: 200px
}
</style>
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
					<li><a href="${ctx }/FrontJsp/HomePage.jsp">首页</a></li>
					<li><a href="${ctx }/FrontJsp/Introduction.jsp" class="">公司简介</a></li>
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="">形象展示</a></li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a></li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp" class="">物流专线</a>
					</li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="">货源信息</a>
					</li>

					<li><a href="${ctx }/FrontJsp/Join.jsp" class="">招商加盟</a></li>


					<li><a href="${ctx }/ClientController/online.do" class="nav-current">在线下单</a>
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
		<div class="xiadan_box">
			<div class="xiadan_Tab">
				<div class="xiadan-tits">
					<h4 class="fl">在线下单</h4>
					<span class="Required fl">（<em class="r-point">*</em> 代表必填项）</span>
					<div class="clear"></div>
				</div>
				<div class="reg-con">
					<!--出发地→到达地-->
					<div class="item-form">
						<div class="itemform_Th">
							<div class="icon-redbar"></div>
							<h4>
								出发地 → 到达地 <a href="javascript:void(0);"> <img
									src="${ctx }/Content/image/321.jpg" width="30px;" height="30px"
									onclick="select()" /> </a>
							</h4>
						</div>
						<div class="item-cell item-mar">
							<label class="fl"><span class="r-point">* </span>出发地：</label>
							<div class="item-primary item-primaryIE7  w392 fl">
								<input id="tc_from" name="tc_from" type="text"
									wtmap="{c:&#39;tc_from&#39;,cb:true}"
									class="item-input  PlaceBg w392 end" placeholder="请选择省-市-县" /> <input
									id="customid" name="customid"
									value="${sessionScope.custom.getCustomid()}" type="hidden" />

							</div>
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="item-input  PlaceBg   end"
								style="height: 35px;width: 220px" name="sendadress" placeholder="发货详细地址"
								maxlength="100" />
							<div class="clear"></div>
						</div>
						<div class="item-cell cl">
							<label class="fl"><span class="r-point">* </span>到达地：</label>
							<div class="item-primary item-primaryIE7 CLIE7 w392 fl">
								<input id="tc_to" name="tc_to" type="text"
									wtmap="{c:&#39;tc_to&#39;,cb:true}"
									class="item-input  PlaceBg w392 end" placeholder="请选择省-市-县">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="item-input  PlaceBg   end"
								style="height: 35px;width: 220px" name="takeadress" placeholder="收货详细地址"
								maxlength="100" />
						</div>
						<div class="clear"></div>
					</div>
					<!-- 货物信息-->
					<div class="item-form">
						<div class="itemform_Th">
							<div class="icon-redbar"></div>
							<h4>
								货物信息 <a href="javascript:void(0);"> <img
									src="${ctx }/Content/image/123.jpg" width="30px;" height="30px"
									onclick="Add()" /> </a> <a href="javascript:void(0);"> <img
									src="${ctx }/Content/image/1234.jpg" width="30px;" height="30px"
									onclick="Reduce()" /> </a>
							</h4>
						</div>
						<div>
							<div class="item-cell item-mar LBlock fl">
								<label class="fl"><span class="r-point">* </span>货物名称：</label>
								<div class="item-primary fl">
									<input id="txtGoodsName" class="item-input " type="text"
										name="Mrchlist[0].mrchandisename" placeholder="请输入货物的名称"
										maxlength="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


								</div>
							</div>
							<div class="CargoType  LBlock  item-mar">
								<label class="fl ml60 Ctlabel"><span class="r-point">* </span>货物类型：</label>
								<div style="display: inline-block;">

									<select id="selectGoods" name="Mrchlist[0].mrchandisetypeid"
										style="width: 165px;height: 36px">
										<option value="">---请选择---</option>
										<c:forEach items="${MRlist}" var="list">
											<option value="${list.getMrchandisetypeid()}">${list.getMrchandisetypename()}</option>
										</c:forEach>

									</select>

								</div>

							</div>
						</div>
						<div class="item-cell  LBlock clfl">
							<label class="fl">货物重量：</label>
							<div class="item-primary fl">
								<input name="orderformdetaillist[0].weight" placeholder="请输入货物的重量"
									maxlength="4" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')"
									id="ctl00_ContentPlaceHolder_txtHwzl">&nbsp;&nbsp;kg
							</div>
						</div>
						<div class="CargoType  LBlock">
							<label class="fl  ml60 Ctlabel">货物体积：</label>
							<div class="item-primary fl">
								<input name="orderformdetaillist[0].volume" placeholder="请输入货物的体积"
									maxlength="4" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" type="text"
									id="ctl00_ContentPlaceHolder_txtTj" class="item-input ">&nbsp;立方米
							</div>
						</div>


						<div class="clear"></div>
					</div>

					<div class="item-form" id="HuoWu2">

						<div>
							<div class="item-cell item-mar LBlock fl">
								<label class="fl"><span class="r-point">* </span>货物名称：</label>
								<div class="item-primary fl">
									<input id="txtGoodsName" name="Mrchlist[1].mrchandisename"
										class="item-input " type="text" placeholder="请输入货物的名称" maxlength="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


								</div>
							</div>
							<div class="CargoType  LBlock  item-mar">
								<label class="fl ml60 Ctlabel"><span class="r-point">* </span>货物类型：</label>
								<div class="item-primary fl ">

									<select id="selectGoods" name="Mrchlist[1].mrchandisetypeid"
										style="width: 165px;height: 36px">
										<option value="">请选择</option>
										<c:forEach items="${MRlist}" var="list">
											<option value="${list.getMrchandisetypeid()}">${list.getMrchandisetypename()}</option>
										</c:forEach>

									</select>

								</div>

							</div>
						</div>
						<div class="item-cell  LBlock clfl">
							<label class="fl">货物重量：</label>
							<div class="item-primary fl">
								<input name="orderformdetaillist[1].weight" placeholder="请输入货物的重量"
									maxlength="4" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" type="text"
									id="ctl00_ContentPlaceHolder_txtHwzl">&nbsp;&nbsp;kg
							</div>
						</div>
						<div class="CargoType  LBlock">
							<label class="fl  ml60 Ctlabel">货物体积：</label>
							<div class="item-primary fl">
								<input name="orderformdetaillist[1].volume" placeholder="请输入货物的体积"
									maxlength="4" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" type="text"
									id="ctl00_ContentPlaceHolder_txtTj" class="item-input ">&nbsp;立方米
							</div>
						</div>


						<div class="clear"></div>
					</div>
					<div class="item-form" id="HuoWu3">

						<div>
							<div class="item-cell item-mar LBlock fl">
								<label class="fl"><span class="r-point">* </span>货物名称：</label>
								<div class="item-primary fl">
									<input id="txtGoodsName" name="Mrchlist[2].mrchandisename"
										class="item-input " type="text" placeholder="请输入货物的名称" maxlength="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


								</div>
							</div>
							<div class="CargoType  LBlock  item-mar">
								<label class="fl ml60 Ctlabel"><span class="r-point">* </span>货物类型：</label>
								<div class="item-primary fl ">

									<select id="selectGoods" name="Mrchlist[2].mrchandisetypeid"
										style="width: 165px;height: 36px"><option value="">请选择</option>
										<c:forEach items="${MRlist}" var="list">
											<option value="${list.getMrchandisetypeid()}">${list.getMrchandisetypename()}</option>
										</c:forEach>

									</select>

								</div>

							</div>
						</div>
						<div class="item-cell  LBlock clfl">
							<label class="fl">货物重量：</label>
							<div class="item-primary fl">
								<input name="orderformdetaillist[2].weight" placeholder="请输入货物的重量"
									maxlength="4" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" type="text"
									id="ctl00_ContentPlaceHolder_txtHwzl">&nbsp;&nbsp;kg
							</div>
						</div>
						<div class="CargoType  LBlock">
							<label class="fl  ml60 Ctlabel">货物体积：</label>
							<div class="item-primary fl">
								<input name="orderformdetaillist[2].volume" placeholder="请输入货物的体积"
									maxlength="4" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" type="text"
									id="ctl00_ContentPlaceHolder_txtTj" class="item-input ">&nbsp;立方米
							</div>
						</div>


						<div class="clear"></div>
					</div>

					<!-- 联系信息-->
					<div class="item-form">
						<div class="itemform_Th">
							<div class="icon-redbar"></div>
							<h4>联系信息</h4>
						</div>
						<div class="item-cell item-mar LBlock">
							<label class="fl"><span class="r-point">* </span>联系姓名：</label>
							<div class="item-primary fl">
								<input name="sendname" type="text" id="sendname" class="item-input w92">
								<div class="cus_sel_box_comm dropDownUl Gender LBlock mt2 selSex"
									style=""></div>
								<select name="goods_unit" class="dropDownUl Gender LBlock mt2 selSex"
									style="display: none;">
									<option value="1" selected="selected">先生</option>
									<option value="0">女士</option>
								</select>
							</div>
						</div>
						<div class="CargoType  LBlock item-mar">
							<label class="fl ml60 Ctlabel"><span class="r-point">* </span>联系电话：</label>
							<div class="item-primary fl">
								<input maxlength="11"
									onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"
									onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')"
									placeholder="请输入联系人手机号码" type="text" onchange="YanZheng(this.id,value)"
									id="SendPhoneNumber" name="sendphonenumber" class="item-input W125">
							</div>
						</div>
						<div class="item-cell LBlock clearie">
							<label class="Remarks fl">备注：</label>
							<div class="item-primary2 fl">
								<textarea name="remark" id="ctl00_ContentPlaceHolder_txtDesc"
									class="item-textarea w470" rows="5" placeholder="请填写您的需求说明，如：尽快与我联系"
									maxlength="100"></textarea>
							</div>
						</div>

					</div>
					<!-- 在线下单-->
					<div class="item-form btn">

						<input type="button" id="btnOrder" onclick="funOrder();" class="btn-blue"
							value="立即下单">
					</div>
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
		var QuFen = 0;
		$(function() {
			$("#HuoWu2").hide();
			$("#HuoWu3").hide();

			$.post("${ctx}/ClientController/online.do");

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

			var fromValue = null;
			if (getUrlVal("point") != null) {
				fromValue = getUrlVal("point").split("/")[0];
			}
			$("#tc_from").val(fromValue);

			var toValue = null
			if (getUrlVal("point")) {
				toValue = getUrlVal("point").split("/")[1];
			}

			$("#tc_to").val(toValue);

		});

		function cancellation() {
			$.post("${ctx}/ClientController/cancellation.do", function(data) {
				if (data == "true") {
					location.reload();
				}
			});
		}

		//在线下单验证
		function funOrder() {
			var from = $("#tc_from").val();
			if (from == "") {
				layer.alert("请填写出发地！", {
					icon : 0,
					title : "提示："
				});
				return false;
			}
			$("#ctl00_ContentPlaceHolder_hidFrom").val(from);

			var to = $("#tc_to").val();
			if (to == "") {
				layer.alert("请填写到达地！", {
					icon : 0,
					title : "提示："
				});
				return false;
			}

			var linkName = $("#sendname").val();
			if (linkName == "") {
				layer.alert("联系姓名不能为空！", {
					icon : 0,
					title : "提示："
				});
				return false;
			}

			var linkPhone = $("#SendPhoneNumber").val();
			if (linkPhone == "") {
				layer.alert("联系电话不能为空！", {
					icon : 0,
					title : "提示："
				});
				return false;
			}

			if (checkIsMobile(linkPhone) == false) {
				layer.alert("联系电话格式不正确！", {
					icon : 0,
					title : "提示："
				});
				return false;
			}

			var ForData = $("#aspnetForm").serializeArray();
			$.post("${ctx}/ClientController/insertOrderForm.do", ForData,
					function(data) {
						if ((typeof data) == "string") {
							data = JSON.parse(data);
						}
						if (data.state == true) {
							if (layer.alert(data.msg, {
								icon : 1,
								offset : '100px',
								btn : [ "确定" ]
							}, function(layerIndex) {
								layer.close(layerIndex);//关闭提示框
								location.reload();
							}))
								;
						} else {
							layer.alert(data.msg, {
								icon : 0,
								title : "提示",
								offset : '100px'
							});
						}
					});
		}

		//校验手机号码
		function checkIsMobile(s) {
			var patrn = /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
			if (!patrn.test(s))
				return false
			return true
		}
		function cancellation() {
			$.post("${ctx}/ClientController/cancellation.do");
			window.location.reload();
		}
		function Add() {

			if (QuFen == 0) {
				$("#HuoWu2").show();
				QuFen = 1;
			} else if (QuFen == 1) {
				$("#HuoWu3").show();
				QuFen = 2;
			} else {
				layer.alert("只能填写3个物品！！", {
					icon : 0,
					title : "提示："
				});
			}

		}
		function Reduce() {
			if (QuFen > 0) {
				if (QuFen == 2) {
					$("#HuoWu3").hide();
					$("#HuoWu3 input").val("");
					QuFen = 1;
				} else {
					$("#HuoWu2").hide();
					$("#HuoWu2 input").val("");
					QuFen = 0;
				}
			}
		}
		function YanZheng(ID, value) {
			checkIsMobile($("#" + ID).val());
			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(value)) {
				$("#" + ID).val("");
			}

		}

		function select() {
			var startName = $("#tc_from").val();
			var endName = $("#tc_to").val();
			$.get("${ctx}/ClientController/selectRoute.do?startIndex=0"
					+ "&pageSize=100000" + "&startName=" + startName
					+ "&endName=" + endName, function(data) {
				if (data == null || data == "" || data == "[]") {
					layer.alert("暂未开通之路线，请选择其他路线", {
						icon : 0,
						title : "提示："
					});
				} else {
					layer.alert("路线已开通！！", {
						icon : 1,
						title : "提示："
					});
				}

			});

		}
	</script>
</body>
</html>
