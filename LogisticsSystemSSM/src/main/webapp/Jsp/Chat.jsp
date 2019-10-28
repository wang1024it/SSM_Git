<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lj.util.*"%>

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

<title>聊天室</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="chat">

<link rel="stylesheet" href="${ctx }/Content/css/chat.css" type="text/css"></link>


<link rel="stylesheet" href="${ctx }/Content/css/bootstrap.min.css"
	type="text/css"></link>


<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

.chatBox {
	margin: 0px;
	padding: 0px;
}
</style>
</head>

<body>
	<div class="chatBox">
		<div class="chatLeft ">
			<div class="chat01">
				<div class="chat01_title">
					<ul class="talkTo">
						<li><a href="javascript:;" id="UserName">${name}</a>
						</li>
					</ul>
					<ul class="talkTo">
						<li style="float: right;" id="reconnect" onclick="ReConnect()"><a
							href="javascript:;">服务器连接:<span id="Tip"></span> </a></li>
					</ul>

				</div>
				<div class="chat01_content" id="allMsg" onmouseout="TuBiaoHide()"
					style="overflow: auto"></div>
			</div>
			<div class="chat02">
				<div class="chat02_title">
					<a class="chat02_title_btn ctb01" onmouseover="TuBiaoShow()"
						href="javascript:;"></a>
					<form id="enterEmployeeFrom" action="${ctx}/ChatController/uploadFile.do"
						enctype="multipart/form-data" method="post" >
						<a class="chat02_title_btn ctb02" href="javascript:;" title="选择文件"> <input
							type="file" style="opacity:0;z-index: 10;width: 3px;margin-left: -5px"
							id="Filephoto" onchange="loadImg()" name="file" /> </a>

					</form>
					<label class="chat02_title_t"> <a
						href="${ctx}/ChatController/chatRecordJsp.do" target="_blank">聊天记录</a> </label>
					<div class="wl_faces_box">
						<div class="wl_faces_content">
							<div onmouseout="TuBiaoHide()">
								<div class="title">
									<ul>
										<li class="title_name">常用表情</li>
										<li class="wl_faces_close"><span>&nbsp;</span>
										</li>
									</ul>
								</div>
								<div class="wl_faces_main" onmouseover="TuBiaoShow()">
									<ul>
										<li><a href="javascript:;"><img
												src="${ctx }/Content/image/emo_01.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_02.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_03.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_04.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_05.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_06.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_07.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_08.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_09.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_10.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_11.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_12.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_13.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_14.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_15.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_16.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_17.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_18.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_19.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_20.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_21.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_22.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_23.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_24.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_25.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_26.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_27.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_28.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_29.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_30.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_31.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_32.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_33.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_34.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_35.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_36.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_37.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_38.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_39.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_40.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_41.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_42.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_43.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_44.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_45.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_46.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_47.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_48.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_49.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_50.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_51.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_52.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_53.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_54.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_55.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_56.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_57.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_58.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_59.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/emo_60.gif" onclick="HuoQu(this.src)" />
										</a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/one.jpg" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/tow.jpg" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/three.jpg" onclick="HuoQu(this.src)" />
										</a></li>





										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/00.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/01.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/02.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/03.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/04.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/05.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/06.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/07.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/08.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/09.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/10.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/11.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/12.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/13.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/14.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/15.gif" onclick="HuoQu(this.src)" /> </a></li>
										<li><a href="javascript:;"> <img
												src="${ctx }/Content/image/16.gif" onclick="HuoQu(this.src)" /> </a></li>

									</ul>
								</div>
							</div>
						</div>
						<div class="wlf_icon"></div>
					</div>
				</div>
				<div class="chat02_content" onmouseout="TuBiaoHide()">
					<div id="msg" onmouseover="TuBiaoHide()" onclick="GuanBi()"
						style="overflow: auto;" contenteditable="true"></div>
					<audio id="audio" src="${ctx }/Content/vioce/3761.mp3"></audio>
					<audio id="Outaudio" src="${ctx }/Content/vioce/595.mp3"></audio>

				</div>
				<div class="chat02_bar">
					<ul>
						<li style="right: 5px; top: 5px;" onclick="sendMessage('')"><a
							href="javascript:;"> <img src="${ctx }/Content/image/send_btn.jpg">
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="chatRight">
			<div class="chat03">
				<div class="chat03_title" style="overflow: auto;">
					<label class="chat03_title_t"> 成员列表 </label>
				</div>
				<div class="chat03_content">
					<ul id="Users">


					</ul>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
















	<!-- 	<div class="content"> -->
	<!-- 		<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3" -->
	<!-- 			style="  height: 400px; border: 1px solid black;overflow: auto" -->
	<!-- 			></div> -->
	<!-- 		<div class="col-lg-9 col-sm-9 col-md-9 col-xs-9" -->
	<!-- 			style="  height: 400px; border: 1px solid black;overflow: auto;" -->
	<!-- 			id="allMsg"></div> -->
	<!-- 		<div class=" col-lg-8 col-sm-8 col-md-8 " id="msg" -->
	<!-- 			style="height: 200px;border: 1px solid black;overflow: auto; " -->
	<!-- 			contenteditable="true"></div> -->
	<!-- 		<button class="btn btn-info" onclick="sendMessage('')">发送(Enter)</button> -->
	<!-- 		<form id="enterEmployeeFrom" enctype="multipart/form-data" -->
	<!-- 			method="post"> -->
	<!-- 			<input type="file" id="file" name="file" onchange="loadImg()" /> -->

	<!-- 		</form> -->
	<!-- 		<button class="btn btn-info" onclick="colseConnect()">关闭聊天</button> -->

	<div class="modal fade" id="modal" style="margin-left:-30%">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 150%;height: 500px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="title">私聊：</h4>
				</div>
				<div class="modal-body">
					<div style="height: 280px;  border: 1px solid black;overflow: auto;"
						id="privateAllMsg"></div>

					<div contenteditable="true"
						style="height: 100px;  border: 1px solid black;overflow: auto;"
						id="privateMsg"></div>
					<button class="btn btn-info" id="FaSong">发送(Enter)</button>
				</div>

			</div>
		</div>
	</div>




	<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>

	<script type="text/javascript" src="${ctx}/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="${ctx}/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/Content/layer/layer.js"></script>

	<script type="text/javascript" src="${ctx}/Content/js/HuoQuShiJian.js"></script>
	<script type="text/javascript">
		var webSocket = null;
		var loginName = '${name}';//获取登录账号
		var loginNames = '${loginName}';//获取登录所有的账号
		var Photo = '${Photo}';
		var privateuser;
		var UserArry = new Array();
		var fileName;
		var astrict = 0;
		var SendName;
		var PhotoArry = new Array();
		var facePhoto = "";
		var FenBian = 0;
		var ImgShuZu = [ "bmp", "jpg", "png", "tif", "gif", "pcx", "tga",
				"exif", "fpx", "svg", "psd", "cdr", "pcd", "dxf", "ufo", "eps",
				"ai", "raw", "WMF", "webp" ];
		var step = 0;
		var TimeOut;
		var audioEle = $("#audio")[0];
		var OutaudioEle = $("#Outaudio")[0];
		var Count = 0;
		var TimeName;
		var oDiv = document.getElementById('msg');
		var obj;
		var alternation = 0;

		$(function() {

			if (!window.WebSocket) {
				alert('你的浏览器不支持WebSocket');
			} else {

				startConnect();
				setInterval(CountTime, 10000);
			}
			refresh(loginNames);
			$("#Tip").text("成功");
		});

		function startConnect() {
			//记住 是ws开关 是ws开关 是ws开关 ws://IP:端口/项目名/Server.java中的@ServerEndpoint的value
			var url = "ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/chat/"
					+ loginName;
			webSocket = new WebSocket(url);//一个websocket

			webSocket.onerror = function(event) {//websocket的连接失败后执行的方法
				onError(event)
			};
			webSocket.onopen = function(event) {//websocket的连接成功后执行的方法
				onOpen(event)
			};
			webSocket.onmessage = function(event) {//websocket的接收消息时执行的方法
				onMessage(event)
			};
			webSocket.onclose = function(event) {//websocket的关闭执行的方法
				onclose(event)
			};

		}
		function colseConnect() {//关闭连接

			$.post("${ctx}/ChatController/outLine.do", function(data) {
				if ((typeof data) == "string") {
					data = JSON.parse(data);
				}
				if (data.state == true) {
					$("#allMsg").append(
							"<p style='text-align:center'>您已经下线了</p>");
					if (webSocket != null) {

						if (webSocket.readyState == 1) {
							webSocket.send(loginName + "下线了！！");
						}
						webSocket.close();
					}

					webSocket = null;
				} else {
					layer.alert("下线失败！！", {
						icon : 0,
						title : "提示："
					});
				}

			});

			/* 跳转登录页 我这里就不清空Users.user中对应的对象 ，
			    你可以用window.location.href请求到后去删除Users.user的相关对象 然后跳转到index.jsp 
			    用servlet3.0接收请求就行
			    */
		}
		function onMessage(event) {
			if (event.data != "heartbeat") {

				var reg = new RegExp("上线了！！");
				var rg = new RegExp("下线了！！");
				if (reg.test(event.data)) {
					RefreshOnlineUser();
				}
				if (rg.test(event.data)) {
					RefreshOnlineUser();
				}

				CaoZuoXinXi(event.data);

				$('#allMsg').scrollTop(999999);
				$('#privateAllMsg').scrollTop(999999);
			} else if (event.data == "heartbeat") {
				Count = 0;
			}
		}
		oDiv.ondragover = function(ev) {
			ev.preventDefault();
		}
		oDiv.ondrop = function(ev) {

			ev.preventDefault();
			var fs = ev.dataTransfer.files;
			for ( var i = 0; i < fs.length; i++) {
				loadImg(fs[i]);
			}

		}

		function RefreshOnlineUser() {
			$.post("${ctx}/ChatController/refurbish.do");
			try {

				$.post("${ctx}/ChatController/selectPhoto.do", function(data) {
					if (data != "") {

						Photo = data;
						refresh();
						//OutaudioEle.play(); //播放	
					}

				});
			} catch (e) {
			}
		}

		function onOpen(event) {

			$("#allMsg").append("<p style='text-align:center'>已连接至服务器</p>");
			$("#allMsg").append("<p style='text-align:center'>您已经加入群聊</p>");
			webSocket.send(loginName + "上线了！！");
			$('#allMsg').scrollTop(999999);
		}
		function onError(event) {
			CountErr++;
			$("#allMsg").append("<p style='text-align:center'>连接服务器发生错误</p>");
			$('#allMsg').scrollTop(999999);

			webSocket.close();
			//$.post("${ctx}/ChatController/reConnect");
			//parent.window.location.href = "${ctx}/index.jsp";

		}
		function onclose() {

			$("#allMsg").append("<p style='text-align:center'>服务器已经关闭</p>");
			$('#allMsg').scrollTop(999999);
			$("#Tip").text("失败");

			webSocket.close();
			//$.post("${ctx}/ChatController/reConnect");
			//parent.window.location.href = "${ctx}/index.jsp";

		}

		function sendMessage(Name) {
			if (alternation == 0) {

				if ($("#msg").text().length < 200) {

					if (webSocket.readyState != 1) {//断了或其他原因连不上，就得重新连接一下
						startConnect();
					}
					FenBian = 0;
					if (Name == "") {
						var Face = new Array();
						if (Trim($("#msg").text()) != "" || facePhoto != "") {
							if ($("#msg").text() != "" || facePhoto != "") {

								if (facePhoto != "") {

									facePhoto = facePhoto + "@";
									facePhoto = facePhoto.replace("☛@", "");

									Face = facePhoto.split("☛");
									facePhoto = "";
									for ( var i = 0; i < Face.length; i++) {
										if (Face[i] != null) {
											facePhoto += "<img src="+ Face[i]+" />";
										}

									}
								} else {
									facePhoto = "";
								}
								$("#msg").text($("#msg").text() + facePhoto);
								webSocket.send(loginName + $("#msg").text());//向服务器发送消息
								alternation = 1;
								$("#msg").text("");//清空输入框

								$("#msg").empty();
								Face.slice(0, Face.length);
								facePhoto = "";
							} else {
								SendFile();
								alternation = 1;
							}
						} else {

							if ($("#msg").text() != "") {

								SendFile();
								alternation = 1;
							} else {
								layer.alert("请输入内容！！", {
									icon : 0,
									offset : '100px',
									title : "提示："
								});
							}

						}

					} else {
						if (Trim($("#privateMsg").text()) != "") {
							webSocket.send(loginName + "▂" + Name + "▂"
									+ $("#privateMsg").text());//向服务器发送消息
							$("#privateMsg").empty();
							$("#privateMsg").text("");//清空输入框
							alternation = 1;
						} else {
							if ($("#privateMsg").text() != "") {
								webSocket.send(loginName + "/" + Name + ":"
										+ fileName);//向服务器发送消息
								$("#privateMsg").empty();//清空输入框
								alternation = 1;
							} else {
								layer.alert("请输入内容！！", {
									icon : 0,
									offset : '100px',
									title : "提示："
								});
							}
						}
					}
				} else {
					layer.alert("只能输入62字以内的汉字！！", {
						icon : 0,
						offset : '100px',
						title : "提示："
					});
				}
			} else {
				setTimeout(function Clean() {
					clearTimeout();
					alternation = 0;
				}, 500);
			}
		}

		function SendFile() {

			layer.load(0, {
				offset : '100px'
			});
			if (obj != undefined) {
				var form = new FormData();
				form.append("file", obj);

				$.ajax({
					type : "post",
					url : "${ctx}/ChatController/uploadFile.do",
					data : form,
					processData : false,
					contentType : false,
					success : function(data) {
						UploadFile(data);
						obj = undefined;
					},
					error : function(data) {
						layer.alert("上传失败！！！", {
							icon : 0,
							title : "提示："
						}, function(index) {
							layer.close(index);
							layer.closeAll('loading');
						});
					}

				});

			} else {

				$("#enterEmployeeFrom").attr("action",
						"${ctx}/ChatController/uploadFile.do");
				$("#enterEmployeeFrom").ajaxSubmit(function(data) {
					UploadFile(data);
				});
			}
		}

		function UploadFile(data) {
			if (data.split(":")[0] == "成功") {
				var QuFen = 0;
				layer.closeAll('loading');
				fileName = data.split(":")[1];
				layer.msg("上传成功");
				var url = "${ctx }/Temp/ChatTemp/" + fileName;
				$
						.ajax(
								url,
								{
									type : 'get',
									async : true,//取消ajax的异步实现
									timeout : 2000,
									success : function() {

										for ( var i = 0; i < ImgShuZu.length; i++) {

											if (ImgShuZu[i].toLowerCase() == fileName
													.split(".")[1]
													.toLowerCase()) {
												webSocket
														.send(loginName
																+ "<img height='150px'width='150px'   src='${ctx}/Temp/ChatTemp/"
																+ fileName
																+ "' id='"
																+ fileName
																		.split(".")[0]
																+ "'  onclick='showImg(this.id)'  />");//向服务器发送消息
												QuFen++;
												break;

											}
										}

										if (QuFen == 0) {
											webSocket
													.send(loginName
															+ "<a href='javascript:;' id='"
															+ fileName
															+ "' onclick='downLoad(this.id)' style='margin-right:0px;padding-right:0px'>"
															+ fileName
															+ "  </a>");
										}

									},
									error : function() {
										webSocket
												.send(loginName
														+ "<a href='javascript:;' id='"
														+ fileName
														+ "' onclick='downLoad(this.id)' style='margin-right:0px;padding-right:0px'>"
														+ fileName + " </a>");
									}
								});

				$("#msg").empty();//清空输入框
			} else {
				layer.closeAll('loading');
				layer.alert("失败", {
					icon : 0,
					offset : '100px',
					title : "提示："
				});
			}
		}

		function refresh() {

			$("#Users").empty();

			var ShuZu = new Array();
			ShuZu = Photo.split("/");
			if (ShuZu.length > 0) {
				for ( var i = 0; i < ShuZu.length; i++) {
					if (ShuZu[i] != "" && ShuZu[i].split(":")[0] != loginName) {
						var url = "${ctx }/Temp/" + ShuZu[i].split(":")[1]
						try {

							$.ajax(url, {
								type : 'get',
								async : true,//取消ajax的异步实现
								timeout : 2000,
								success : function() {

								},
								error : function() {
									url = "${ctx }/Content/image/user.jpg";

								}
							});
						} catch (e) {
							url = "${ctx }/Content/image/user.jpg";
						}
						$("#Users")
								.append(
										'<li  id="'
												+ ShuZu[i].split(":")[0]
												+ '"  onclick="privateTalk(this.id)"><label class="online"> </label> <a href="javascript:;"><img src="'
												+ url
												+ '"style="width: 30px;height: 30px"  > </a><a href="javascript:;"class="chat03_name">'
												+ ShuZu[i].split(":")[0]
												+ '</a></li>');
					}
				}
			}
		}

		function privateTalk(ID) {
			$("#privateAllMsg").html("");

			$("#modal").modal("toggle");
			$("#title").text("正在与" + ID + "私聊中：");
			privateuser = ID;
		}

		$("#FaSong").click(function() {

			sendMessage(privateuser);
		});
		document.onkeydown = function(event) {

			if (alternation == 0) {
				var code = event.keyCode;
				if (code == 13) { //这是键盘的enter监听事件
					//绑定焦点，有可能不成功，需要多试试一些标签
					if (Trim($("#msg").text()) != "" || facePhoto != "") {
						sendMessage("");
					} else if (Trim($("#privateMsg").text()) != "") {
						$("#FaSong").click();
					} else {
						layer.alert("请输入内容！！", {
							icon : 0,
							offset : '100px',
							title : "提示："
						});
					}

				}

				if ((event.ctrlKey == true && code == 82) || (code == 116)
						|| (event.ctrlKey == true && code == 116)
						|| code == 114) {
					event.keyCode = 0;

					event.returnValue = false;
					event.cancelBubble = true;
					return false;

				}

			} else {
				setTimeout(function Clean() {
					clearTimeout();
					alternation = 0;
				}, 500);
			}
		}

		function Trim(str) {

			return str.replace(/(^\s*)|(\s*$)/g, "");
		}

		//读取图片
		function loadImg(File) {
			//获取文件
			var file;
			if (File != "" && File != null) {
				file = File;
				obj = File;
			} else {
				file = $("#Filephoto")[0].files[0];
			}

			//$("#FileName" + Count).val(file.name);
			//创建读取文件的对象
			var reader = new FileReader();

			//创建文件读取相关的变量
			var imgFile;
			//正式读取文件
			reader.readAsDataURL(file);
			//为文件读取成功设置事件
			reader.onload = function(e) {
				imgFile = e.target.result;

				var QuFen = 0;
				for ( var i = 0; i < ImgShuZu.length; i++) {

					if (ImgShuZu[i].toLowerCase() == file.name.split(".")[1]
							.toLowerCase()) {
						$("#msg")
								.append(
										' <img id="imgContent" src="'
												+ imgFile
												+ '" style="width:300px;height:100px" onclick="showImg(this.id)" />');
						QuFen++;
						break;

					}
				}
				if (QuFen == 0) {
					$("#msg")
							.append(
									' <a href="javascript:;"><input value="'+file.name+'"  /></a>');
				}

			};

		}

		function CaoZuoXinXi(msg) {
			if (PhotoArry.length > 0) {
				PhotoArry.splice(0, PhotoArry.length - 1);
			}

			PhotoArry = Photo.split("/");
			if (FenBian == 0) {
				var Msg;
				var regs = new RegExp(loginName);
				if (regs.test(msg)) {
					Msg = msg.replace(loginName, "")

				}

				var ChatRecord = loginName + "：" + Msg + "---------------"
						+ getCurDate() + "";
				$.post("${ctx}/ChatController/chatRecord.do?ChatRecord="
						+ ChatRecord, function() {

				});
			}
			var regs = new RegExp(loginName);
			FenBian = 1;

			if (msg.split("▍")[0] == "私聊") {
				SendName = msg.split("▍")[1].split("▂")[0];
				if ($('body').hasClass('modal-open')) {

				} else {
					$("#title").text("正在与" + SendName + "私聊中：");
					$("#privateAllMsg").html("");
					$("#modal").modal("toggle");
					privateuser = msg.split("▍")[1].split("▂")[0];
				}
				if (SendName == loginName) {
					msg = msg.split("▍")[1].split("▂")[2];
					$("#privateAllMsg")
							.append(
									"<div class='ChatRecord' style='margin:0px'> <div class='message clearfix'> <div class='user-logo'style='float:right' ><img class='Img' style='height:50px;width:70px;'  src='"
											+ UserPicture()
											+ "' /> </div> <div class='wrap-text' style='float:right;margin-right: 10px;' ><h5 class='clearfix' style='text-align:right'>"
											+ loginName
											+ "</h5> <div style='text-align:right;float:right'>"
											+ msg
											+ "</div> </div>  <div style='clear:both;'><span>"
											+ getCurDate()
											+ "</span> </div> </div></div>");

				} else {
					$("#privateAllMsg")
							.append(
									"<div  class='message clearfix' ><div class='user-logo'><img class='Img'style='height:70px;width:70px;'  src='"
											+ OtherUserPicture(
													SendName
															+ msg.split("▍")[1]
																	.split("▂")[2])
													.split("@")[0]
											+ "'></div><div class='wrap-text'><h5 class='clearfix'>"
											+ SendName
											+ "</h5><div>"
											+ msg.split("▍")[1].split("▂")[2]
											+ "</div></div><div class='wrap-ri'><div clsss='clearfix'><span>"
											+ getCurDate()
											+ "</span></div></div><div style='clear:both;'></div></div>");
					TimeOut = setTimeout("flash_title()", 1000);
					audioEle.play(); //播放	
				}

			} else {

				if (regs.test(msg)) {
					msg = msg.replace(loginName, "")

					if ("上线了！！" != msg && "下线了！！" != msg) {

						$("#allMsg")
								.append(
										"<div class='ChatRecord' style='margin:0px'> <div class='message clearfix'> <div class='user-logo'style='float:right' ><img class='Img' style='height:70px;width:70px;'  src='"
												+ UserPicture()
												+ "' /> </div> <div class='wrap-text' style='float:right;margin-right: 10px;' ><h5 class='clearfix' style='text-align:right'>"
												+ loginName
												+ "</h5> <div style='text-align:right;float:right'>"
												+ msg
												+ "</div> </div>  <div style='clear:both;'><span>"
												+ getCurDate()
												+ "</span> </div> </div></div>");

					}
				} else {
					var Msg = msg;
					msg = msg.replace(OtherUserPicture(msg).split("@")[1], "");
					var reg = new RegExp("上线了！！");
					var rg = new RegExp("下线了！！");
					if (!reg.test(msg) && !rg.test(msg)) {

						$("#allMsg")
								.append(
										"<div  class='message clearfix' ><div class='user-logo'><img class='Img'style='height:70px;width:70px;'  src='"
												+ OtherUserPicture(Msg).split(
														"@")[0]
												+ "'></div><div class='wrap-text'><h5 class='clearfix'>"
												+ OtherUserPicture(Msg).split(
														"@")[1]
												+ "</h5><div>"
												+ msg
												+ "</div></div><div class='wrap-ri'><div clsss='clearfix'><span>"
												+ getCurDate()
												+ "</span></div></div><div style='clear:both;'></div></div>");
						TimeOut = setTimeout("flash_title()", 1000);
						audioEle.play(); //播放	

					} else {
						$("#allMsg").append(
								"<p style='text-align:center'>" + Msg + "</p>");

					}
				}

			}

		}

		function showImg(ID) {
			$(".layui-layer-close2").click();
			var url = $("#" + ID).prop("src");
			if (url == undefined) {
				url = $("#" + ID).attr("src");
			}

			//alert(url);
			var img_infor = "<img src='" + url + "' style='height: 330px;width:500px;'  /> ";
			layer.open({
				type : 1,
				closeBtn : 1,
				offset : '100px',
				shade : false,
				title : false, //不显示标题
				//skin: 'layui-layer-nobg', //没有背景色
				shadeClose : false,
				area : [ '500px', '390px' ],
				//area: [img.width + 'px', img.height+'px'],
				content : img_infor,
				//捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
				btn : [ "下载" ],
				yes : function(index, layero) {
					downLoad(url.split("ChatTemp/")[1])
				},

				cancel : function() {
					layer.msg('图片查看结束！', {
						time : 1000,
						offset : '100px',
						icon : 6
					});
				}

			})

		}

		function downLoad(fileName) {

			window.open("${ctx}/ChatController/downFile.do?file=" + fileName);
		}

		window.onbeforeunload = function() {
			var Text = parent.$("#GetText").html().split("</i>")[1];
			if (Text != "聊天室") {
				colseConnect();
			}

		}

		function TuBiaoShow() {

			$(".wl_faces_box").show();
		}
		function HuoQu(src) {

			$("#msg").append("<img src="+src+" />");
			src = "${ctx}" + src.split("LogisticsSystemSSM")[1] + "☛";

			facePhoto += src;

		}

		function TuBiaoHide() {
			GuanBi();
			$(".wl_faces_box").hide();
		}

		function flash_title() {
			step++
			if (step == 7) {
				step = 1
			}
			if (step == 1) {
				window.parent.document.title = "【您有---新消息！！！】";
			}
			if (step == 2) {
				window.parent.document.title = "【未读！！！！！！！！】";
			}
			if (step == 3) {
				window.parent.document.title = "【新的消息未读！！！！】";
			}
			if (step == 4) {
				window.parent.document.title = "【读取您的新消息！！！】";
			}
			if (step == 5) {
				window.parent.document.title = "【新消息！！！！！！】";
			}
			if (step == 6) {
				window.parent.document.title = "【未读一条消息！！！】";
			}

		}
		function GuanBi() {
			clearTimeout(TimeOut);
			window.parent.document.title = "物流系统";
		}
		$("#msg").hover(function() {
			GuanBi();
		});

		function UserPicture() {
			var UserPhoto = "${ctx }/Temp/";
			try {

				for ( var i = 0; i < PhotoArry.length; i++) {
					if (PhotoArry[i].split(":")[0] == loginName) {
						UserPhoto = UserPhoto + PhotoArry[i].split(":")[1];
						break;
					}
				}

				$.ajax(UserPhoto, {
					type : 'get',
					async : true,//取消ajax的异步实现,
					timeout : 2000,
					success : function() {

					},
					error : function() {
						UserPhoto = "${ctx }/Content/image/user.jpg";

					}
				});
			} catch (e) {
				UserPhoto = "${ctx }/Content/image/user.jpg";
			}
			return UserPhoto;
		}

		function OtherUserPicture(msg) {
			var UserPhoto = "${ctx }/Temp/";
			var Name;
			try {

				for ( var i = 0; i < PhotoArry.length; i++) {
					var PhotoImg = new RegExp(PhotoArry[i].split(":")[0]);
					if (PhotoImg.test(msg)) {
						UserPhoto = UserPhoto + PhotoArry[i].split(":")[1];

						Name = PhotoArry[i].split(":")[0];
						break;
					}

				}
				$.ajax(UserPhoto, {
					type : 'get',
					async : true,//取消ajax的异步实现
					timeout : 2000,
					success : function() {

					},
					error : function() {
						UserPhoto = "${ctx }/Content/image/user.jpg";

					}
				});
			} catch (e) {
				UserPhoto = "${ctx }/Content/image/user.jpg";
			}
			return UserPhoto + "@" + Name;
		}

		function CountTime() {

			if (webSocket.readyState == 1 && Count <= 2) {
				webSocket.send("heartbeat");

				$("#Tip").text("成功");
				Count++;
			} else if (Count > 0) {
				$("#Tip").text("请点击此处进行重连");
				webSocket.close();
				webSocket = null;
				startConnect();
			}
			RefreshOnlineUser();
		}

		function ReConnect() {
			if (astrict == 0) {

				$("#Tip").text("正在重连！！");
				$.post("${ctx}/ChatController/reConnect.do", function(data) {
					if ((typeof data) == "string") {
						data = JSON.parse(data);
					}
					if (data.state == true) {
						astrict = 1;
						startConnect();

						$("#Tip").text("成功");
					}

				});
				setTimeout(function time() {
					clearTimeout();
					astrict = 0;
				}, 20000);

			} else {
				layer.tips('您已经进行从新连接，请等待！！', '#reconnect', {
					tips : [ 4, '#78BA32' ]
				});
			}
		}

		$("#msg")
				.on(
						'paste',
						function(ev) {
							var data = ev.clipboardData;
							var items = (event.clipboardData || event.originalEvent.clipboardData).items;
							for ( var index in items) {
								var item = items[index];
								if (item.kind === 'file') {
									var blob = item.getAsFile();
									loadImg(blob);
								}
							}
						});

		// 		function JieTu() {
		// 			$.post("${ctx}/ChatController/screenshot", function() {

		// 			});

		// 		}
	</script>
</body>
</html>
