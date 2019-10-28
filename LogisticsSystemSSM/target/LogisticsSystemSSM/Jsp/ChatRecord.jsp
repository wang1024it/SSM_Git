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

<title>聊天记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" href="${ctx}/Content/css/bootstrap.min.css"
	type="text/css"></link>
</head>

<body>
	<div class="content">
		<div
			style="border: 2px solid black; padding:5px; height: 95% ;width: 100%;overflow: auto"
			id="Chat"></div>

	</div>


	<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/Content/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="${ctx }/Content/js/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx }/Content/layer/layer.js"></script>
	<script type="text/javascript">
		var NeiRong = "“" + "${NeiRong}" + "”";
		var ShuZu = new Array();

		$(function() {
			ShuZu = NeiRong.split("▁");

			for ( var i = 0; i < ShuZu.length; i++) {
				if (ShuZu[i] != "") {
					$("#Chat").append(
							"<a ><p style='margin-left:20px'> " + ShuZu[i]
									+ "</p> </a>");
				}

			}
			$('div').scrollTop(999999);
		});

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
	</script>
</body>
</html>
