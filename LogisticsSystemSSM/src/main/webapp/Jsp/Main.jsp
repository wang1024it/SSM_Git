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
<html>
<head>
<meta name="viewport" content="width=device-width" />


<title>首页</title>
<link rel="stylesheet" href="${ctx }/Content/css/sccl.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx }/Content/css/skin.css" type="text/css"></link>

<style>
* {
	font-family: "华文中宋";
}
</style>
</head>

<body>
	<!---cnksakncnksankcas-->
	<div class="layout-admin">
		<header class="layout-header">
			<span class="header-logo">物流系统后台</span> <a class="header-menu-btn"
				href="javascript:void(0)"><i class="icon-font">&#xe600;</i>
			</a><a style="margin-left: 6%" href="javascript:void(0)" id="ShiJian"></a>
			<marquee style="width: 40%;position: absolute;top:14px" id="tip"></marquee>
			<ul class="header-bar">



				<li class="header-bar-nav"><a href="javascript:;">
						${user.getUsername()} <i class="icon-font" style="margin-left:5px;">&#xe60c;</i>
				</a>
					<ul class="header-dropdown-menu">


						<li><a href="#" onclick="TuiChu()">退出</a></li>
					</ul></li>
			</ul>
		</header>
		<aside class="layout-side">
			<ul class="side-menu"></ul>
		</aside>

		<!-- 		<div class="layout-side-arrow"> -->
		<!-- 			<div class="layout-side-arrow-icon"> -->
		<!-- 				<i class="icon-font">&#xe60d;</i> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

		<section class="layout-main">
			<div class="layout-main-tab">
				<button class="tab-btn btn-left">
					<i class="icon-font">&#xe60e;</i>
				</button>
				<nav class="tab-nav">
					<div class="tab-nav-content">
						<a href="javascript:;" class="content-tab active" data-id="home.html">首页</a>
					</div>
				</nav>
				<button class="tab-btn btn-right">
					<i class="icon-font">&#xe60f;</i>
				</button>
			</div>
			<div class="layout-main-body" style="margin: 0px;padding: 0px">
				<iframe id="Content" class="body-iframe" name="iframe0"
					style="width:100%;height:99%" src="" frameborder="0" data-id="home.html"
					seamless></iframe>
			</div>
		</section>
		<div class="layout-footer"></div>
	</div>
	<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/sccl.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/sccl-util.js"></script>
	<script type="text/javascript" src="${ctx}/Content/layer/layer.js"></script>
	<script>
        var leave = '${list}';
        var cash = '${listFun}';
        var orderFormlist = '${orderFormlist}';
        var NeworderFormlist='${NeworderFormlist}';
        var canclelist ='${canclelist}';
        var url;
        var EventUtil = {
            addHandler : function(element, type, handler) {
                if (element.addEventListener) {
                    element.addEventListener(type, handler, false);
                } else if (element.attachEvent) {
                    element.attachEvent("on" + type, handler);
                } else {
                    element["on" + type] = handler;
                }
            }
        };
        EventUtil.addHandler(window, "online", function() {
            layer.msg("有网络了！！", {
                icon : 1,

            });

        });
        EventUtil.addHandler(window, "offline", function() {
            layer.msg("网络连接中断，加载失败！！请重新尝试！！", {
                icon : 5,

            });
        });
        $(function() {
            if ( ${user.getInstitutionalorganizationid()} == 3) {
                url="${ctx}/OrderformController/orderForm.do";
            } else {
                url="${ctx}/OrderFormDisposeController/orderFormDispose.do";
        }
			/* 获取皮肤 */
			// getSkinByCookie();
			/* 菜单json */
			var menu = [
        {
						"id" : "1",
						"name" : "主菜单",
						"parentId" : "0",
						"url" : "",
						"icon" : "",
						"order" : "1",
						"isHeader" : "1",
						"childMenus" : [
								{
								    "id" : "sign",
								    "name" : "签到",
								    "parentId" : "1",
								    "url" : "${ctx}/SignController/signIn.do",
								    "icon" : "<img src= '${ctx}/Content/image/825320.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},{
								    "id" : "AuditLeave",
								    "name" : "审批请假",
								    "parentId" : "1",
								    "url" : "${ctx}/AdministratorsController/auditLeave.do",
								    "icon" : "<img src= '${ctx}/Content/image/404932.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},{
								    "id" : "CustomerManagement",
								    "name" : "客户管理",
								    "parentId" : "2",
								    "url" :"${ctx}//CustomController/customerManagement.do",
								    "icon" : "<img src= '${ctx}/Content/image/625502.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},{
								    "id" : "Enterorder",
								    "name" : "录入新订单",
								    "parentId" : "2",
								    "url" :"${ctx}/OrderFormDisposeController/inputorder.do",
								    "icon" : "<img src= '${ctx}/Content/image/720367.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},
								{
								    "id" : "OrderManagement",
								    "name" : "订单管理",
								    "parentId" : "2",
								    "url" :url,
								    "icon" : "<img src= '${ctx}/Content/image/698885.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},
								{
								    "id" : "DataStatistics",
								    "name" : "数据统计",
								    "parentId" : "3",
								    "url" : "${ctx}/DataStatisticsController/dataStatistics.do",
								    "icon" : "<img src= '${ctx}/Content/image/855056.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},
								{
								    "id" : "PersonnelManagement",
								    "name" : "人员管理",
								    "parentId" : "4",
								    "url" : "",
								    "icon" : "<img src= '${ctx}/Content/image/637291.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [ {
								        "id" : "motorcade",
								        "name" : "车队信息",
								        "parentId" : "5",
								        "url" : "${ctx}/MotorcadeController/personalManage.do",
								        "icon" : "<img src= '${ctx}/Content/image/47521.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "4",
								        "isHeader" : "0"
								    }, {
								        "id" : "Driver",
								        "name" : "司机管理",
								        "parentId" : "5",
								        "url" : "${ctx}/DriverManagementController/driverManagement.do",
								        "icon" : "<img src= '${ctx}/Content/image/486694.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "3",
								        "isHeader" : "0"

								    },{
								        "id" : "Car",
								        "name" : "车辆管理",
								        "parentId" : "5",
								        "url" : "${ctx}/PersonalManageController/carManage.do",
								        "icon" : "<img src= '${ctx}/Content/image/730653.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "3",
								        "isHeader" : "0"

								    }

								    ]
								},{
								    "id" : "DrivilegeManagement",
								    "name" : "权限管理",
								    "parentId" : "2",
								    "url" : "",
								    "icon" :"<img src= '${ctx}/Content/image/1284354.png' width='16px' height='16px' style='margin-top:2px'/>" ,
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [{
								        "id" : "EmployeeInformation",
								        "name" : "员工信息",
								        "parentId" : "DrivilegeManagement",
								        "url" : "${ctx}/EmployeeInformationController/employeeInfor.do",
								        "icon" : "<img src= '${ctx}/Content/image/500846.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "4",
								        "isHeader" : "0"

								    },{
								        "id" : "EmployeeInformation",
								        "name" : "分配权限",
								        "parentId" : "DrivilegeManagement",
								        "url" : "${ctx}/PowerController/power.do",
								        "icon" : "<img src= '${ctx}/Content/image/1019750.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "4",
								        "isHeader" : "0"

								    }]
								},{
								    "id" : "PersonalCenter",
								    "name" : "个人中心",
								    "parentId" : "2",
								    "url" : "",
								    "icon" : "<img src='${ctx}/Content/image/836366.png' width='16px' height='16px' style='margin-top:2px' />",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" :  [ {
								        "id" : "DaoRu",
								        "name" : "基础资料",
								        "parentId" : "",
								        "url" : "${ctx}/PersonalDataController/personal.do",
								        "icon" : "<img src= '${ctx}/Content/image/996724.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "4",
								        "isHeader" : "0"
								    }, {
								        "id" : "JiChu",
								        "name" : "账号安全",
								        "parentId" : "5",
								        "url" : "${ctx}/PersonalDataController/account.do",
								        "icon" : "<img src= '${ctx}/Content/image/268531.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "3",
								        "isHeader" : "0"

								    }, {
								        "id" : "JiChu",
								        "name" : "支付安全",
								        "parentId" : "5",
								        "url" : "${ctx}/PersonalDataController/payment.do",
								        "icon" : "<img src= '${ctx}/Content/image/282803.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "3",
								        "isHeader" : "0"

								    }, {
								        "id" : "CarInformation",
								        "name" : "车辆信息",
								        "parentId" : "5",
								        "url" : "${ctx}/PersonalDataController/carInformation.do",
								        "icon" : "<img src= '${ctx}/Content/image/760390.png' width='16px' height='16px' style='margin-top:2px'/>",
								        "order" : "3",
								        "isHeader" : "0"

								    }


								    ]
								},{
								    "id" : "InformationRecommendation",
								    "name" : "资讯推荐",
								    "parentId" : "2",
								    "url" : "${ctx}/InformationManagementController/informationManagement.do",
								    "icon" : "<img src= '${ctx}/Content/image/83961.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},{
								    "id" : "CapitalRecord",
								    "name" : "资金记录",
								    "parentId" : "2",
								    "url" : "${ctx}/FundRecordController/fundRecord.do",
								    "icon" : "<img src= '${ctx}/Content/image/692424.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},{
								    "id" : "AboutUs",
								    "name" : "关于我们",
								    "parentId" : "2",
								    "url" : "${ctx}/AboutUsController/aboutUs.do",
								    "icon" : "<img src= '${ctx}/Content/image/900521.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								},{
								    "id" : "ChatRoom",
								    "name" : "聊天室",
								    "parentId" : "2",
								    "url" : "${ctx}/ChatController/chat.do",
								    "icon" : "<img src= '${ctx}/Content/image/434559.png' width='16px' height='16px' style='margin-top:2px'/>",
								    "order" : "1",
								    "isHeader" : "0",
								    "childMenus" : [

								    ]
								}]
        },

        ];
        initMenu(menu, $(".side-menu"));

        $(".side-menu > li").addClass("menu-item");
        CheckDengLu();
        setInterval(CheckDengLu, 50000);
        if (${user.getInstitutionalorganizationid()} == 3) {

            $("#Content")
                    .attr2("src", "${ctx}/TransportController/home.do");
            $("#PersonnelManagement").hide();
            $("#DataStatistics").hide();
            $("#DrivilegeManagement").hide();
            $("#InformationRecommendation").hide();
            $("#AuditLeave").hide();
            $("#Enterorder").hide();
            $("#CustomerManagement").hide();
            if (canclelist>0) {
                $("#tip").text("你所运输的订单已作废，请将货物送还给客户！！！");
            }else
            {
                $("#tip").text("记得每天上下班得签到！！");
            }



        } else if (${user.getInstitutionalorganizationid()} == 2) {
            $("#Content").attr2("src",
                    "${ctx}/CustomerController/homeService.do");


            $("#DrivilegeManagement").hide();
            $("#AuditLeave").hide();
            $("#CarInformation").hide();


            $("#InformationRecommendation").hide();
            if (orderFormlist > 0) {
                $("#tip").text("有"+orderFormlist+"条新的订单消息需要审核，请注意查看！！");
            }else
            {
                if (NeworderFormlist>0) {
                    $("#tip").text("有"+NeworderFormlist+"条新的订单需要进行委任，请注意查看");
                }else
                {
                    $("#tip").text("记得每天上下班得签到！！");
                }

            }
        } else {
				if (leave > 0 && cash > 0) {
				    $("#tip").text("有"+leave+"条新的请假和"+cash+"条提现消息，需要批准，请注意查看！！");
				} else {
					if (leave > 0) {

					    $("#tip").text("有"+leave+"条新的请假消息，需要批准，请注意查看！！");

					}
        if (cash > 0) {
            $("#tip").text("有"+cash+"条新的提现消息，需要批准，请注意查看！！");
        }
        }
        $("#Content").attr2("src",
                "${ctx}/AdministratorsController/auditApproval.do");
        $("#Enterorder").hide();
        $("#AboutUs").hide();
        $("#PersonnelManagement").hide();
        $("#CarInformation").hide();
        $("#OrderManagement").hide();

        }

        });

        function CheckDengLu() {
            $.post("${ctx}/MainController/checkLogin.do",
							function(data) {
							    if ((typeof data) == "string") {
							        data = JSON.parse(data);
							    }
							    if (data.state == false) {
							        <%--window.location.href = "${ctx}/index.jsp";--%>
							    } else {
							        var msg;
							        if ((typeof data.msg) == "string") {
							            msg = JSON.parse(data.msg);
							        }
							        if ((typeof msg.Approval) == "string") {
							            msg.Approval = JSON.parse(msg.Approval);
							        }
							        if (${user.getInstitutionalorganizationid()} != 2
											&& ${user.getInstitutionalorganizationid()} != 3) {

											    if (msg.Approval==true && msg.listFun > 0) {
											        $("#tip").text(
                                                            "有新的请假和提现消息，需要审核，请注意查看！！");
											    } else {
											        if (msg.Approval) {

											            $("#tip").text(
                                                                "有新的请假消息，需要审核，请注意查看！！");

											        }else{$("#tip").text(
                                                                "上下班记得签到！！");}
											        if (msg.listFun > 0) {
											            $("#tip").text(
                                                                "有新的提现消息，需要批准，请注意查看！！");
											        }else
											        {

											            $("#tip").text(
                                                                    "上下班记得签到！！");

											        }
											    }

											} else {

										if (msg.Approval) {

										    $("#tip").text("请假信息已经批准，请注意查看！！");

										}else if(msg.Approval==false)
							        {
							            $("#tip").text("请假信息已拒绝，请注意查看！！");
							            if (${user.getInstitutionalorganizationid()}==2) {


							                if (msg.auditlist>0) {
							                    $("#tip").text("请假信息已拒绝，有"+msg.auditlist+"条订单需要审核，请注意查看！！");
							                }
							                if (msg.Appointmentlist>0) {
							                    $("#tip").text("请假信息已拒绝，有"+msg.Appointmentlist+"条订单需要委任，请注意查看！！");
							                }
							                if (msg.auditlist>0&&msg.Appointmentlist>0) {
							                    $("#tip").text("请假信息已拒绝，有"+msg.Appointmentlist+"条订单需要委任，有"+msg.auditlist+"条订单需要审核，请注意查看！！");
							                }}
							        }else
							    {
										if (${user.getInstitutionalorganizationid()}==2) {
										    if (msg.auditlist>0) {
										        $("#tip").text("有"+msg.auditlist+"条订单需要审核，请注意查看！！");
										    }
										    if (msg.Appointmentlist>0) {
										        $("#tip").text("有"+msg.Appointmentlist+"条订单需要委任，请注意查看！！");
										    }
										    if (msg.auditlist>0&&msg.Appointmentlist>0) {
										        $("#tip").text("有"+msg.Appointmentlist+"条订单需要委任，有"+msg.auditlist+"条订单需要审核，请注意查看！！");
										    }}
							}

            }
        }
        });
        }

        function TuiChu() {

            layer.alert("是否退出？？",{icon:0,title:"提示：",btn:["确定","取消"]},function(index)
            {
                layer.close(index);
                $.post("${ctx}/LoginController/cleanLogin.do",function(data){
                    if ((typeof data) == "string") {
                        data = JSON.parse(data);
                    }
                    if (data.state==true) {
                        window.location.href = "${ctx}/Jsp/Login.jsp";
                    }

                });

            });



        }
    </script>
</body>
</html>
