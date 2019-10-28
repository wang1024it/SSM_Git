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

<title>数据统计</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>

<link rel="stylesheet" href="${ctx}/Content/css/datatables.min.css"
	type="text/css"></link>
<style type="text/css">
* {
	font-family: "华文仿宋";
	font-weight: bolder;
}

label {
	float: right;
	height: 34px;
	font-family: '华文中宋';
	color: #6f7b8a;
	font-size: 13.5px;
	line-height: 20px;
	margin-right: -3px;
	text-align: center;
	font-weight: normal;
	background: #F4F4F4;
	border: #AAAAAA solid 1px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: none;
	z-index: 100;
}

.control-label {
	padding-left: 0;
}

.interval {
	padding-left: 0;
}

td,th {
	vertical-align: middle;
	text-align: center;
}

tr {
	font-size: 14px;
	vertical-align: middle
}

thead {
	background: #cfecf3;
}

.dataTable {
	text-align: center;
	vertical-align: middle;
}

span {
	color: #337ab7;
}
</style>
</head>

<body>

	<div class="container-fluid">

		<form class="form-horizontal" id="formChoose" onsubmit="return false">
			<div class="form-group">
				<div class="col-lg-2 col-sm-2 col-sm-2">
					<span class="control-label col-lg-11 col-sm-11 col-md-11" id="Count"></span>

				</div>
				<div class="col-lg-2 col-sm-2 col-sm-2">
					<span class="control-label col-lg-8 col-sm-8 col-md-8"
						style="margin-left: 0px;padding-left: 0px" id="finish"></span>

				</div>
				<div class="col-lg-2 col-sm-2 col-sm-2">
					<span class="control-label col-lg-8 col-sm-8 col-md-8"
						style="margin-left: 0px;padding-left: 0px" id="Notfinish"></span>

				</div>


				<div class="col-lg-2 col-sm-2 col-sm-2">
					<span class="control-label col-lg-8 col-sm-8 col-md-8"
						style="margin-left: 0px;padding-left: 0px" id="YiJiaoKuan"></span>
				</div>

				<div class="col-lg-2 col-sm-2 col-sm-2">
					<span class="control-label col-lg-8 col-sm-8 col-md-8"
						style="margin-left: 0px;padding-left: 0px" id="WeiJiaoKuan"></span>

				</div>
				<div class="col-lg-2 col-sm-2 col-sm-2">
					<span class="control-label col-lg-8 col-sm-8 col-md-8"
						style="margin-left: 0px;padding-left: 0px" id="Cancel"></span>

				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-4 col-sm-4 col-sm-4">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary ">开始时间：</label>
					<div class="col-lg-6 col-sm-6 col-md-6 interval">

						<input class="form-control " type="date" id="startTime" name="startTime"
							onchange="start()" style="color:#337ab7 " />

					</div>
				</div>
				<div class="col-lg-4 col-sm-4 col-sm-4">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary">结束时间：</label>
					<div class="col-lg-6 col-sm-6 col-md-6 interval">

						<input class="form-control " type="date" id="endTime" name="endTime"
							onchange="end()" style="color:#337ab7 " />

					</div>
				</div>
				<div class="col-lg-4 col-sm-4 col-sm-4">
					<label class="control-label col-lg-4 col-sm-4 col-md-4 text-primary">显示方式：</label>
					<div class="col-lg-6 col-sm-6 col-md-6 interval">
						<select class="form-control " id="form" name="form"
							onchange="Change(this.value)" style="color:#337ab7 ">
							<option value="0">---请选择---</option>
							<option value="1">---列表显示---</option>
							<option value="2">---扇形图---</option>
							<option value="3">---柱状图---</option>
							<option value="4">---折线图---</option>
						</select>
					</div>
				</div>
			</div>

			<div class=" form-group" id="Table">

				<table id="TabOrderForm"
					class="display table table-hover table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>

							<th style="vertical-align: middle">订单编号</th>
							<th style="text-align: center;vertical-align: middle">运输司机</th>
							<th style="vertical-align: middle">寄货人（公司）名称</th>
							<th style="vertical-align: middle">寄货人（公司）地址</th>
							<th style="vertical-align: middle">收货人（公司）名称</th>
							<th style="vertical-align: middle">收货人（公司）地址</th>
							<th style="vertical-align: middle">订单状态</th>

						</tr>
					</thead>
				</table>
				<div style="margin-top: 10px;margin-bottom: 10px">
					<button class="btn btn-info" onclick="Exprot()">导出Excel</button>

				</div>
			</div>




		</form>
		<div id="TuXing">
			<div id="BingZHuang" class="col-lg-12 col-sm-12 col-md-12"
				style="height:350px;"></div>

			<div id="ZhuZhuang" class="col-lg-12 col-sm-12 col-md-12"
				style="height:350px;"></div>

			<div id="ZheXian" class="col-lg-12 col-sm-12 col-md-12" style="height:350px;"></div>


			<button class="btn btn-info" onclick="Print()">打印</button>
		</div>
	</div>





	<script type="text/javascript" src="${ctx}/Content/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>

	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/datatables.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/mycustom.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script>
		var ShuJu = null;
		var TabOrderForm;
		var BingZHuang;
		var ZhuZhuang;
		var ZheXian;
		var TianShu = new Array();
		var startTime;
		var endTime;
		var CurDate;
		$(function() {
			$("#TuXing").hide();
			$("#Table").show();
			var count = Math.round((window.screen.height - 400) / 50);
			TabOrderForm = $('#TabOrderForm').DataTable({
				"pagingType" : "simple_numbers",//设置分页控件的模式  
				searching : false,//屏蔽datatales的查询框  
				aLengthMenu : [ count ],//设置一页展示10条记录  
				"bSort" : false,// 是否排序功能
				"bLengthChange" : false,//屏蔽tables的一页展示多少条记录的下拉列表  
				"bAutoWidth" : false,// 是否非自动宽度  设置为false
				"oLanguage" : { //对表格国际化  
					"sLengthMenu" : "每页显示 _MENU_条",
					"sZeroRecords" : "没有找到符合条件的数据",
					//  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",    
					"sInfo" : "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
					"sInfoEmpty" : "木有记录",
					"sInfoFiltered" : "(从 _MAX_ 条记录中过滤)",
					"sSearch" : "搜索：",
					"sProcessing" : "正在加载中......",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "前一页",
						"sNext" : "后一页",
						"sLast" : "尾页"

					}
				},
				"lengthMenu" : [ 5, 10, 20, 50, 100 ],
				"processing" : true, //打开数据加载时的等待效果  
				"serverSide" : true,//打开后台分页  
				"ajax" : {
					"url" : "${ctx}/DataStatisticsController/getList.do",
					"dataSrc" : "aaData",
					"data" : function(d) {
						d.startTime = $("#startTime").val();
						d.endTime = $("#endTime").val();

					}
				},

				"columns" : [

				{
					"data" : "ordernumber",
					"width" : "60px"
				}, {
					"data" : "username",
					"width" : "60px"
				}, {
					"data" : "sendname",
					"width" : "130px"
				}, {
					"data" : "sendadress"

				}, {
					"data" : "takename",
					"width" : "130px"
				}, {
					"data" : "takeadress",
					"width" : "140px"
				}, {
					"data" : "statusname",
					"width" : "60px"
				}

				]

			});

			$("#ZheXian").hide();
			$("#ZhuZhuang").hide();
			HuanCun();

		});

		function HuanCun() {
			layer.load();
			var formChoose = $("#formChoose").serializeArray();
			$
					.post("${ctx}/DataStatisticsController/selectOrderForm.do",
							formChoose, function(data) {
								if ((typeof data) == "string") {
									data = JSON.parse(data);
								}
								if (data != null) {
									ShuJu = data;
									$("#Count")
											.html("订单总数：" + data.Count + "条");
									$("#finish").html(
											"已完成：" + data.finish + "条");
									$("#Notfinish").html(
											"未完成：" + data.Notfinish + "条");
									$("#YiJiaoKuan").html(
											"已交款：" + data.YiJiaoKuan + "条");
									$("#WeiJiaoKuan").html(
											"未交款：" + data.WeiJiaoKuan + "条");
									$("#Cancel")
											.html("作废：" + data.Cancel + "条");

									Change($("#form").val());
								} else {
									$("#Count").html("订单总数：0条");
									$("#finish").html("已完成：0条");
									$("#Notfinish").html("未完成：0条");
									$("#YiJiaoKuan").html("已交款：0条");
									$("#WeiJiaoKuan").html("未交款：0条");
									$("#Cancel").html("作废：0条");

									layer.closeAll('loading');
								}
							});
		}

		function Change(value) {
			if (value > 1) {
				$("#TuXing").show();
				$("#Table").hide();
			} else {
				$("#TuXing").hide();
				$("#Table").show();
			}
			$("#ZheXian").hide();
			$("#BingZHuang").hide();
			$("#ZhuZhuang").hide();
			$("#BingZHuang").empty();
			$("#ZhuZhuang").empty();

			if (value == 0 || value == 1) {

				$("#BingZHuang").empty();
				$("#ZhuZhuang").empty();
			} else {

				var TianShuZu = new Array();
				var BingShuZu = new Array();

				var str = "[";

				var data;
				TianShu = ShuJu.ZheXian.split("`");
				for ( var i = 0; i < TianShu.length; i++) {
					if (TianShu[i] != null && TianShu[i] != "") {
						TianShuZu.push(TianShu[i].split("/")[0]);
						str += TianShu[i].split("/")[1] + ",";
						data = {
							value : TianShu[i].split("/")[1],
							name : TianShu[i].split("/")[0]
						};

						BingShuZu.push(data);
					}

				}

				str += "/";
				str = str.replace(",/", "");
				str += "]";

				if (value == 2) {
					$("#BingZHuang").show();
					if (BingZHuang != undefined) {
						BingZHuang.dispose();
					}

					BingZHuang = echarts.init(document
							.getElementById("BingZHuang"));

					//扇形图
					Option = {
						title : {
							text : "订单情况",
							left : "left"
						},
						tooltip : {
							trigger : 'item',
							//formatter: "住宅:{a}  车位:{b} <br/>商铺:{c} , 比例:{d}%"//饼图、仪表盘、漏斗图: {a}（系列名称），{b}（数据项名称），{c}（数值）, {d}（百分比）
							formatter : "{a}  {b} {c} , 比例:{d}%"//饼图、仪表盘、漏斗图: {a}（系列名称），{b}（数据项名称），{c}（数值）, {d}（百分比）
						},
						legend : {
							orient : 'horizontal',//图例列表的布局朝向。'horizontal'横向   'vertical'垂直
							left : 'center',
							data : TianShuZu
						},
						series : [ {
							//name: '建筑性质',
							name : '',
							type : 'pie',//饼图
							radius : [ 10, '55%' ],//饼图的半径，数组的第一项是内半径，第二项是外半径。
							center : [ '45%', '50%' ],//饼图的中心（圆心）坐标，数组的第一项是横坐标，第二项是纵坐标。
							data : BingShuZu
						} ]
					};
					BingZHuang.setOption(Option, true);

				} else if (value == 3) {
					$("#ZhuZhuang").show();
					if (ZhuZhuang != undefined) {
						ZhuZhuang.dispose();
					}
					ZhuZhuang = echarts.init(document
							.getElementById("ZhuZhuang"));
					option = {
						tooltip : {
							trigger : 'axis',
							axisPointer : { // 坐标轴指示器，坐标轴触发有效
								type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
							}
						},
						legend : {
							data : [ "天数" ],
						},
						grid : {
							left : '3%',
							right : '4%',
							bottom : '3%',
							containLabel : true
						},
						yAxis : [ {
							type : 'value'
						} ],
						xAxis : [ {
							type : 'category',
							axisTick : {
								show : false
							},
							data : TianShuZu,
						},

						],
						series : [ {
							name : '订单情况',
							type : 'bar',
							label : {
								normal : {
									show : true,
									position : 'inside'
								}
							},
							data : BingShuZu,
						}

						]
					};

					ZhuZhuang.setOption(option, true);

				} else if (value == 4) {

					if (ShuJu.ZheXian != "") {
						var starttime = $("#startTime").val();
						if (starttime == "" || starttime == null) {
							starttime = TianShuZu[0];
						}
						var endtime = $("#endTime").val();
						if (endtime == "") {
							endtime = GetTime();
						}
						var title = starttime + "~" + endtime + "的订单折线图如下：";
						$("#ZheXian").show();
						$("#BingZHuang").hide();
						ZheXian = echarts.init(document
								.getElementById("ZheXian"));
						$("#ZhuZhuang").hide();

						//TianShuZu = JSON.stringify(TianShuZu);
						option = {
							tooltip : {
								trigger : 'axis',
								formatter : "订单情况 : <br/>{b} : {c}条"
							},
							legend : {
								data : [ title ]
							},
							xAxis : {
								type : 'category',
								data : TianShuZu,

							},

							yAxis : {
								type : 'value',
								axisLine : {
									onZero : false
								},
								axisLabel : {
									formatter : '{value} 条'
								},
							},
							series : [ {
								name : title,
								data : JSON.parse(str),
								type : 'line',
								smooth : true,
								lineStyle : {
									normal : {
										width : 3,
										shadowColor : 'rgba(0,0,0,0.4)',
										shadowBlur : 10,
										shadowOffsetY : 10
									}
								},
							} ]
						};

						ZheXian.setOption(option, true);
					} else {
						layer.alert("没有数据！！", {
							icon : 0,
							title : "提示"
						});
						$("#ZheXian").hide();
					}

				}

			}
			layer.closeAll('loading');
		}

		function start() {
			ChangDay();

			if (startTime > CurDate) {
				layer.alert("开始日期不可以超过当前日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#startTime").val("");
				return;
			}
			if (startTime > endTime) {
				layer.alert("开始日期不可以超过结束日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#startTime").val("");
				return;
			}

			if (startTime != NaN && endTime != NaN) {
				var Day = parseInt(Math.abs(endTime - startTime) / 1000 / 60
						/ 60 / 24);
				var day = parseInt(Math.abs(CurDate - startTime) / 1000 / 60
						/ 60 / 24);
				if (Day > 366) {
					layer.alert("选择的日期不可以超过一年！！", {
						icon : 0,
						title : "提示："
					});
					$("#startTime").val("");
					return;
				}
				if (day > 366) {
					layer.alert("开始日期与现在的日期的时间差不能超过一年！！", {
						icon : 0,
						title : "提示："
					});
					$("#startTime").val("");
					return;
				}

				if (Day == 0) {
					layer.alert("结束的日期和开始的日期不可以同一天！！", {
						icon : 0,
						title : "提示："
					});
					$("#endTime").val("");
					return;

				}

			}
			TabOrderForm.ajax.reload();
			HuanCun();

		}
		function end() {
			ChangDay();
			if (endTime > CurDate) {
				layer.alert("结束日期不可以超过当前日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#endTime").val("");
				return;
			}
			if (startTime > endTime) {
				layer.alert("结束日期不可以小于开始日期！！", {
					icon : 0,
					title : "提示："
				});
				$("#endTime").val("");
				return;
			}
			if (startTime != NaN && endTime != NaN) {
				var Day = parseInt(Math.abs(endTime - startTime) / 1000 / 60
						/ 60 / 24);
				if (Day > 366) {

					layer.alert("选择的日期不可以超过一年！！", {
						icon : 0,
						title : "提示："
					});
					$("#endTime").val("");
					return;
				}
				if (Day == 0) {
					layer.alert("结束的日期和开始的日期不可以同一天！！", {
						icon : 0,
						title : "提示："
					});
					$("#endTime").val("");
					return;

				}

			}
			TabOrderForm.ajax.reload();
			HuanCun();

		}

		function ChangDay() {
			$("#BingZHuang").empty();
			$("#ZhuZhuang").empty();

			startTime = new Date($("#startTime").val().replace("-", "/")
					.replace("-", "/"));
			endTime = new Date($("#endTime").val().replace("-", "/").replace(
					"-", "/"));
			CurDate = new Date(GetTime().replace("-", "/").replace("-", "/"));
		}

		function Print() {
			window.print();
		}
		function Exprot() {

			var dataTable = $('#TabOrderForm').DataTable();

			var info = dataTable.page.info();

			var pageSize = info.end;

			var startIndex = info.start;
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			window.open("${ctx}/DataStatisticsController/export.do?startTime="
					+ startTime + "&endTime=" + endTime + "&pageSize="
					+ pageSize + "&startIndex=" + startIndex);

		}
	</script>
</body>
</html>
