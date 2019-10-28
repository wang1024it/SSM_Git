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
<!-- saved from url=(0046)http://18665635806.chinawutong.com/linkus.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=1200,initial-scale=0.1,user-scalable=yes">

<link rel="stylesheet" href="${ctx }/Content/css/Memberpublic.css"
	type="text/css"></link>
<link href="${ctx }/Content/css/lbt.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx }/Content/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/json2.js"></script>

<script type="text/javascript" src="${ctx }/Content/js/lunbo.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script>
<title>广州市广发物流有限公司_联系我们</title>
<link rel="stylesheet" type="text/css"
	href="${ctx }/Content/css/MemVipTwopage.css">
<style type="text/css">
#wutongmap {
	width: 650px;
	border: solid 1px #c3c3c3;
	height: 400px;
}

.mapwhere {
	padding-left: 20px;
}
</style>
<!--引用百度地图API-->
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
}

.iw_poi_title {
	color: #CC5522;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	padding-right: 13px;
	white-space: nowrap;
}

.iw_poi_content {
	font: 12px arial, sans-serif;
	overflow: visible;
	padding-top: 4px;
	white-space: -moz-pre-wrap;
	word-wrap: break-word;
}
</style>


<script src="${ctx }/Content/js/share.js"></script>
<style type="text/css">
.BMap_mask {
	background: transparent url(http://api0.map.bdimg.com/images/blank.gif);
}

.BMap_noscreen {
	display: none;
}

.BMap_button {
	cursor: pointer;
}

.BMap_zoomer {
	background-image: url(http://api0.map.bdimg.com/images/mapctrls1d3.gif);
	background-repeat: no-repeat;
	overflow: hidden;
	font-size: 1px;
	position: absolute;
	width: 7px;
	height: 7px;
}

.BMap_stdMpCtrl div {
	position: absolute;
}

.BMap_stdMpPan {
	width: 44px;
	height: 44px;
	overflow: hidden;
	background: url(http://api0.map.bdimg.com/images/mapctrls2d0.png)
		no-repeat;
}

.BMap_ie6 .BMap_stdMpPan {
	background: none;
}

.BMap_ie6 .BMap_smcbg {
	left: 0;
	width: 44px;
	height: 464px;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="http://api0.map.bdimg.com/images/mapctrls2d0.png"
		);
}

.BMap_ie6 .BMap_stdMpPanBg {
	z-index: -1;
}

.BMap_stdMpPan .BMap_button {
	height: 15px;
	width: 15px;
}

.BMap_panN,.BMap_panW,.BMap_panE,.BMap_panS {
	overflow: hidden;
}

.BMap_panN {
	left: 14px;
	top: 0;
}

.BMap_panW {
	left: 1px;
	top: 12px;
}

.BMap_panE {
	left: 27px;
	top: 12px;
}

.BMap_panS {
	left: 14px;
	top: 25px;
}

.BMap_stdMpZoom {
	top: 45px;
	overflow: hidden;
}

.BMap_stdMpZoom .BMap_button {
	width: 22px;
	height: 21px;
	left: 12px;
	overflow: hidden;
	background-image: url(http://api0.map.bdimg.com/images/mapctrls2d0.png);
	background-repeat: no-repeat;
	z-index: 10;
}

.BMap_ie6 .BMap_stdMpZoom .BMap_button {
	background: none;
}

.BMap_stdMpZoomIn {
	background-position: 0 -221px;
}

.BMap_stdMpZoomOut {
	background-position: 0 -265px;
}

.BMap_ie6 .BMap_stdMpZoomIn div {
	left: 0;
	top: -221px;
}

.BMap_ie6 .BMap_stdMpZoomOut div {
	left: 0;
	top: -265px;
}

.BMap_stdMpType4 .BMap_stdMpZoom .BMap_button {
	left: 0;
	overflow: hidden;
	background: -webkit-gradient(linear, 50% 0, 50% 100%, from(rgba(255, 255, 255, 0.85)
		), to(rgba(217, 217, 217, 0.85) ) );
	z-index: 10;
	-webkit-border-radius: 22px;
	width: 34px;
	height: 34px;
	border: 1px solid rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: 0 2px 3.6px #CCC;
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-pack: center;
	-webkit-box-sizing: border-box;
}

.BMap_stdMpType4 .BMap_smcbg {
	position: static;
	background: url(http://api0.map.bdimg.com/images/mapctrls2d0_mb.png) 0 0
		no-repeat;
	-webkit-background-size: 24px 32px;
}

.BMap_stdMpType4 .BMap_stdMpZoomIn {
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomIn .BMap_smcbg {
	width: 24px;
	height: 24px;
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomOut {
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomOut .BMap_smcbg {
	width: 24px;
	height: 6px;
	background-position: 0 -25px;
}

.BMap_stdMpSlider {
	width: 37px;
	top: 18px;
}

.BMap_stdMpSliderBgTop {
	left: 18px;
	width: 10px;
	overflow: hidden;
	background: url(http://api0.map.bdimg.com/images/mapctrls2d0.png)
		no-repeat -23px -226px;
}

.BMap_stdMpSliderBgBot {
	left: 19px;
	height: 8px;
	width: 10px;
	top: 124px;
	overflow: hidden;
	background: url(http://api0.map.bdimg.com/images/mapctrls2d0.png)
		no-repeat -33px bottom;
}

.BMap_ie6 .BMap_stdMpSliderBgTop,.BMap_ie6 .BMap_stdMpSliderBgBot {
	background: none;
}

.BMap_ie6 .BMap_stdMpSliderBgTop div {
	left: -23px;
	top: -226px;
}

.BMap_ie6 .BMap_stdMpSliderBgBot div {
	left: -33px;
	bottom: 0;
}

.BMap_stdMpSliderMask {
	height: 100%;
	width: 24px;
	left: 10px;
	cursor: pointer;
}

.BMap_stdMpSliderBar {
	height: 11px;
	width: 19px;
	left: 13px;
	top: 80px;
	overflow: hidden;
	background: url(http://api0.map.bdimg.com/images/mapctrls2d0.png)
		no-repeat 0 -309px;
}

.BMap_stdMpSliderBar.h {
	background: url(http://api0.map.bdimg.com/images/mapctrls2d0.png)
		no-repeat 0 -320px;
}

.BMap_ie6 .BMap_stdMpSliderBar,.BMap_ie6 .BMap_stdMpSliderBar.h {
	background: none;
}

.BMap_ie6 .BMap_stdMpSliderBar div {
	top: -309px;
}

.BMap_ie6 .BMap_stdMpSliderBar.h div {
	top: -320px;
}

.BMap_zlSt,.BMap_zlCity,.BMap_zlProv,.BMap_zlCountry {
	position: absolute;
	left: 34px;
	height: 21px;
	width: 28px;
	background-image: url(http://api0.map.bdimg.com/images/mapctrls2d0.png);
	background-repeat: no-repeat;
	font-size: 0;
	cursor: pointer;
}

.BMap_ie6 .BMap_zlSt,.BMap_ie6 .BMap_zlCity,.BMap_ie6 .BMap_zlProv,.BMap_ie6 .BMap_zlCountry
	{
	background: none;
	overflow: hidden;
}

.BMap_zlHolder {
	display: none;
	position: absolute;
	top: 0;
}

.BMap_zlHolder.hvr {
	display: block;
}

.BMap_zlSt {
	background-position: 0 -380px;
	top: 21px;
}

.BMap_zlCity {
	background-position: 0 -401px;
	top: 52px;
}

.BMap_zlProv {
	background-position: 0 -422px;
	top: 76px;
}

.BMap_zlCountry {
	background-position: 0 -443px;
	top: 100px;
}

.BMap_ie6 .BMap_zlSt div {
	top: -380px;
}

.BMap_ie6 .BMap_zlCity div {
	top: -401px;
}

.BMap_ie6 .BMap_zlProv div {
	top: -422px;
}

.BMap_ie6 .BMap_zlCountry div {
	top: -443px;
}

.BMap_stdMpType1 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpSlider,.BMap_stdMpType3 .BMap_stdMpSlider,.BMap_stdMpType4 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpZoom,.BMap_stdMpType3 .BMap_stdMpPan,.BMap_stdMpType4 .BMap_stdMpPan
	{
	display: none;
}

.BMap_stdMpType3 .BMap_stdMpZoom {
	top: 0;
}

.BMap_stdMpType4 .BMap_stdMpZoom {
	top: 0;
}

.BMap_cpyCtrl a {
	font-size: 11px;
	color: #7979CC;
}

.BMap_scaleCtrl {
	height: 23px;
	overflow: hidden;
}

.BMap_scaleCtrl div.BMap_scaleTxt {
	font-size: 11px;
	font-family: Arial, sans-serif;
}

.BMap_scaleCtrl div {
	position: absolute;
	overflow: hidden;
}

.BMap_scaleHBar img,.BMap_scaleLBar img,.BMap_scaleRBar img {
	position: absolute;
	width: 37px;
	height: 442px;
	left: 0;
}

.BMap_scaleHBar {
	width: 100%;
	height: 5px;
	font-size: 0;
	bottom: 0;
}

.BMap_scaleHBar img {
	top: -437px;
	width: 100%;
}

.BMap_scaleLBar,.BMap_scaleRBar {
	width: 3px;
	height: 9px;
	bottom: 0;
	font-size: 0;
	z-index: 1;
}

.BMap_scaleLBar img {
	top: -427px;
	left: 0;
}

.BMap_scaleRBar img {
	top: -427px;
	left: -5px;
}

.BMap_scaleLBar {
	left: 0;
}

.BMap_scaleRBar {
	right: 0;
}

.BMap_scaleTxt {
	text-align: center;
	width: 100%;
	cursor: default;
	line-height: 18px;
}

.BMap_omCtrl {
	background-color: #fff;
	overflow: hidden;
}

.BMap_omOutFrame {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.BMap_omInnFrame {
	position: absolute;
	border: 1px solid #999;
	background-color: #ccc;
	overflow: hidden;
}

.BMap_omMapContainer {
	position: absolute;
	overflow: hidden;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.BMap_omViewMv {
	border-width: 1px;
	border-style: solid;
	border-left-color: #84b0df;
	border-top-color: #adcff4;
	border-right-color: #274b8b;
	border-bottom-color: #274b8b;
	position: absolute;
	z-index: 600;
}

.BMap_omViewInnFrame {
	border: 1px solid #3e6bb8;
}

.BMap_omViewMask {
	width: 1000px;
	height: 1000px;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #68c;
	opacity: .2;
	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=20 );
}

.BMap_omBtn {
	height: 13px;
	width: 13px;
	position: absolute;
	cursor: pointer;
	overflow: hidden;
	background: url(http://api0.map.bdimg.com/images/mapctrls1d3.gif)
		no-repeat;
	z-index: 1210;
}

.anchorBR .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-left: 1px solid #999;
}

.quad4 .BMap_omBtn {
	background-position: -26px -27px;
}

.quad4 .BMap_omBtn.hover {
	background-position: 0 -27px;
}

.quad4 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -39px -27px;
}

.quad4 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -13px -27px;
}

.anchorTR .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
}

.quad1 .BMap_omBtn {
	background-position: -39px -41px;
}

.quad1 .BMap_omBtn.hover {
	background-position: -13px -41px;
}

.quad1 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -26px -41px;
}

.quad1 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: 0 -41px;
}

.anchorBL .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-right: 1px solid #999;
}

.quad3 .BMap_omBtn {
	background-position: -27px -40px;
}

.quad3 .BMap_omBtn.hover {
	background-position: -1px -40px;
}

.quad3 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -40px -40px;
}

.quad3 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -14px -40px;
}

.anchorTL .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
}

.quad2 .BMap_omBtn {
	background-position: -40px -28px;
}

.quad2 .BMap_omBtn.hover {
	background-position: -14px -28px;
}

.quad2 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -27px -28px;
}

.quad2 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -1px -28px;
}

.anchorR .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	border-top: 1px solid #999;
}

.anchorL .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
	border-top: 1px solid #999;
}

.anchorB .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-left: 1px solid #999;
	border-right: 1px solid #999;
}

.anchorT .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
	border-left: 1px solid #999;
}

.anchorNon .BMap_omOutFrame,.withOffset .BMap_omOutFrame {
	border: 1px solid #999;
}

.BMap_zoomMask0,.BMap_zoomMask1 {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: transparent url(http://api0.map.bdimg.com/images/blank.gif);
	z-index: 1000;
}

.BMap_contextMenu {
	position: absolute;
	border-top: 1px solid #adbfe4;
	border-left: 1px solid #adbfe4;
	border-right: 1px solid #8ba4d8;
	border-bottom: 1px solid #8ba4d8;
	padding: 0;
	margin: 0;
	width: auto;
	visibility: hidden;
	background: #fff;
	z-index: 10000000;
}

.BMap_cmShadow {
	position: absolute;
	background: #000;
	opacity: .3;
	filter: alpha(opacity =                                               30);
	visibility: hidden;
	z-index: 9000000;
}

div.BMap_cmDivider {
	border-bottom: 1px solid #adbfe4;
	font-size: 0;
	padding: 1px;
	margin: 0 6px;
}

div.BMap_cmFstItem {
	margin-top: 2px;
}

div.BMap_cmLstItem {
	margin-bottom: 2px;
}

.BMap_shadow img {
	border: 0 none;
	margin: 0;
	padding: 0;
	height: 370px;
	width: 1144px;
}

.BMap_pop .BMap_top {
	border-top: 1px solid #ababab;
	background-color: #fff;
}

.BMap_pop .BMap_center {
	border-left: 1px solid #ababab;
	border-right: 1px solid #ababab;
	background-color: #fff;
}

.BMap_pop .BMap_bottom {
	border-bottom: 1px solid #ababab;
	background-color: #fff;
}

.BMap_shadow,.BMap_shadow img,.BMap_shadow div {
	-moz-user-select: none;
	-webkit-user-select: none;
}

.BMap_checkbox {
	background: url(http://api0.map.bdimg.com/images/mapctrls1d3.gif);
	vertical-align: middle;
	display: inline-block;
	width: 11px;
	height: 11px;
	margin-right: 4px;
	background-position: -14px 90px;
}

.BMap_checkbox.checked {
	background-position: -2px 90px;
}

.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img
	{
	display: none;
}

@media print {
	.BMap_noprint {
		display: none;
	}
	.BMap_noscreen {
		display: block;
	}
	.BMap_mask {
		background: none;
	}
	.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img
		{
		display: block;
	}
}

.BMap_vectex {
	cursor: pointer;
	width: 11px;
	height: 11px;
	position: absolute;
	background-repeat: no-repeat;
	background-position: 0 0;
}

.BMap_vectex_nodeT {
	background-image: url(http://api0.map.bdimg.com/images/nodeT.gif);
}

.BMap_vectex_node {
	background-image: url(http://api0.map.bdimg.com/images/node.gif);
}

.iw {
	width: 100%;
	-webkit-box-sizing: border-box;
	border: .3em solid transparent;
	-webkit-background-clip: padding;
}

.iw_rt {
	position: relative;
	height: 46px;
	width: 195px;
	-webkit-box-sizing: border-box;
	display: -webkit-box;
	-webkit-box-align: center;
	margin: 2px 5px 0 2px;
	background-color: rgba(0, 0, 0, 0.8);
	-webkit-box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 2px;
	color: #fff;
}

.iw_rt:after {
	content: "";
	position: absolute;
	left: 50%;
	bottom: -8px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-top: 8px solid rgba(0, 0, 0, 0.8);
	border-right: 5px solid transparent;
	margin: 0 0 0 -6px;
}

.iw_s {
	text-align: center;
	vertical-align: middle;
	height: 100%;
	-webkit-box-sizing: border-box;
}

.iw_rt .iw_s1 {
	color: #cbcbcb;
}

.iw_rt b {
	color: #fff;
	font-weight: bold;
}

.iw_rt_gr {
	margin-left: -4px;
}

.iw_busline {
	margin: 32px 0 0 -3px;
}

.iw_busline .iw_cc {
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	padding: 0 6px;
}

.iw_r {
	-webkit-box-ordinal-group: 3;
}

.iw_r,.iw_l {
	height: 100%;
	font-size: 4.5em;
	text-align: center;
	color: #747474;
	border: none;
	-webkit-box-sizing: border-box;
	-webkit-border-radius: 0;
	line-height: .7em;
	border: 1px solid rgba(255, 255, 255, 0.2);
	width: 41px;
}

.iw_r {
	border-style: none none none solid;
}

.iw_l {
	border-style: none solid none none;
}

.iw_search,.iw_l {
	background:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAlCAYAAAAuqZsAAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ bWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6 eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEz NDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv IiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RS ZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpD cmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNl SUQ9InhtcC5paWQ6QjA3NjMyREJDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiIHhtcE1NOkRvY3Vt ZW50SUQ9InhtcC5kaWQ6QjA3NjMyRENDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiPiA8eG1wTU06 RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMDc2MzJEOUM3NDYxMUUxOUFB QzlDOUJENkY4NkJCRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMDc2MzJEQUM3NDYxMUUx OUFBQzlDOUJENkY4NkJCRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1w bWV0YT4gPD94cGFja2V0IGVuZD0iciI/PllB9T8AAAKuSURBVHjaxFjRcdpAEAX+mVEqiFxB5AoQ HZAKElcArsBWBSgVQCoAVwCuwEoFlivwGQpI7jKrzGXn7ep0EsPO7BjLp/O73bdv9xifTqdRpCXW c+sz65n1lNy3mvzZemX9aN34C6bTKdx8HAHMgVlaX0QeaGv9J4EcBJgD9EA/hzAH7N4Cq/oAW1tf KX+vKEXP7PlMSLFvhQX32BWY49GBOIRO7FKy57wBlnoUQHu5yJX+g4mymdvgFWzkAM3JtwGgmiJw a2/pvQoEYBQCLKNI8RfuaeNjT245gAUdqgHdmkqUPiOctLdJVYkithkAVO/K5cC+M30KAZVSxboo /ybnn1eIR5r5qUyI7P4GX6nqJHskbQsxQ7wqu6aSn2qrgHLrXjqAat5ZC0WlRuzVE0J3uhtBCjRt a3qjX92JIMiOIqYtYgumzpo+7RRtu/E0zvknokMF5GgdQv4Ze/5DWL8CFVe2aNuedGsLCi1vS+WL F4WKNkL2Dnh414FnO1b1R5vKuRaxjKUF2YKBqjuCGtF6nyL5+XxOJWCcL2/CpjzdRYRuGpDShQQs ARUj9U/OnRh7Yr9/CW1JXU4fYxXoHIMCu+iB+gBLIt/LgShDYCYktGCDfCBgvyRgVQgZwTy/jIzy EnQNMZV1QCT4bJ+3XFCkS81/WijdkiYAdSak04BWtabWEmIbsNZYgU00YE+gjyErQeo31GpShVMH Yc+/dwsEzh97/D6ojT2ZMlM1XwN8WP9Ma7NAbZvbtBoEjE+jBT2TusCu5SIbI7z/wLWN1rdKi0o6 cqwTuAmYyTm5NQW/82atWvlnBbo7apxD98qDJxl7mkC76JQ2Qm0CI1xKF95Gb4oLXHJDwJlxjy/u LgruGtNFM8lqnNtfK2JqN3CVeW1gzWj9jThd0xd59R8BBgAAiefGO1Bt1gAAAABJRU5ErkJggg==")
		no-repeat 50% 50%;
	-webkit-background-size: 19px 19px;
}

.iw_line_s,.iw_r {
	background:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAmCAYAAABDClKtAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ bWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6 eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEz NDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv IiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RS ZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpD cmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNl SUQ9InhtcC5paWQ6QjA3NjMyREZDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiIHhtcE1NOkRvY3Vt ZW50SUQ9InhtcC5kaWQ6QjA3NjMyRTBDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiPiA8eG1wTU06 RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMDc2MzJEREM3NDYxMUUxOUFB QzlDOUJENkY4NkJCRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMDc2MzJERUM3NDYxMUUx OUFBQzlDOUJENkY4NkJCRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1w bWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqheQ+MAAAEtSURBVHja7JftDYIwEIbB8JeEUXACZQPd oGygE+gGxAnQEZzAOgEdwREIDKBXUgjBIqW5Npj0kvcHpG0erveFX1WVZ8l2oBhEhRoLw/BroW8J KgeR3vMVlI5BrSwAHQZAnngmYxtMe4oIL41ZAp6iNqF4/BQTa0oBxmxAcaAHKFJY+wKtAaw0CRUJ oHjGHiY8VpqCKmYCdRkJUKmJ7Ms1gZqkqOs6w/bUGXRCOGePCcXjaItwDsW8PoZ0zhM70IeeyiZi jH/Isf+CF9MAOdCppDj+LJ6yim6j9802B6VqQa818BFjY6AHakHp9Crj15ctCaiFIi7Q/wCKLRHq vjSoVNKWunH4rTBDv5Cv7NKeKfvvU2nINzHAuexzUA7KQTkoB6UxDicKvc+qfQQYABaiUBxugCsr AAAAAElFTkSuQmCC")
		no-repeat 50% 50%;
	-webkit-background-size: 19px 19px;
}

.iw_line {
	height: 64px;
	width: 228px;
	padding: 0 11px;
	line-height: 20px;
}

.iw_bustrans .iw_cc {
	text-align: center;
}

.iw_c {
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-flex: 1;
}

.iw_cc {
	-webkit-box-sizing: border-box;
	width: 100%;
	border: none;
}

.gray_background {
	filter: alpha(opacity =                                               50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5
}

.light_gray_background {
	filter: alpha(opacity =                                               70);
	-moz-opacity: 0.7;
	-khtml-opacity: 0.7;
	opacity: 0.7
}

.panoInfoBox {
	cursor: pointer;
}

.panoInfoBox {
	position: relative;
	width: 323px;
	height: 101px;
	margin-bottom: 4px;
	cursor: pointer;
}

.panoInfoBox .panoInfoBoxTitleBg {
	width: 323px;
	height: 19px;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 2;
	background-color: #000;
	opacity: .7;
}

.panoInfoBox .panoInfoBoxTitleContent {
	font-size: 12px;
	color: #fff;
	position: absolute;
	bottom: 2px;
	left: 5px;
	z-index: 3;
	text-decoration: none;
}

.RouteAddressOuterBkg {
	position: relative;
	padding: 32px 4px 4px 3px;
	background-color: #ffdd99;
}

.RouteAddressInnerBkg {
	padding: 3px 5px 8px 8px;
	background-color: #ffffff;
}

#RouteAddress_DIV1 {
	margin-top: 5px;
}

.RouteAddressTip {
	position: absolute;
	width: 100%;
	top: 0px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	color: #994c00;
}

.route_tip_con {
	position: absolute;
	top: 145px;
}

.route_tip_con .route_tip {
	position: absolute;
	width: 233px;
	height: 29px;
	color: #803300;
	text-align: center;
	line-height: 29px;
	border: #cc967a solid 1px;
	background: #fff2b2;
	z-index: 100000;
}

.route_tip_con .route_tip span {
	position: absolute;
	top: 0;
	right: 0;
	_right: -1px;
	width: 14px;
	height: 13px;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat 0 -121px;
	cursor: pointer;
}

.route_tip_con .route_tip_shadow {
	width: 233px;
	height: 29px;
	position: absolute;
	left: 1px;
	top: 1px;
	background: #505050;
	border: 1px solid #505050;
	opacity: 0.2;
	filter: alpha(opacity =                                               20)
}

.sel_body_body_page {
	margin: 5px 0
}

.sel_n {
	margin-top: 5px;
	overflow: hidden;
}

.sel_n .sel_top {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-418px;
	height: 4px;
	font-size: 0px;
}

.sel_n .sel_body_top {
	height: 32px;
	width: 100%;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat 0 -41px;
}

.sel_n .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
}

.sel_n .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-79px -387px;
}

.sel_n .sel_body_name {
	height: 10px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_n .sel_body_button {
	float: left;
	width: 55px;
	margin-left: -55px;
	padding-top: 8px;
}

.sel_n .sel_body_button a {
	
}

.sel_n .sel_bottom {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-415px;
	height: 4px;
	font-size: 0px;
}

.sel_n .sel_body_body {
	padding: 3px 0 0 0
}

.sel_n1 {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_n1 .sel_top {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-418px;
	height: 4px;
	font-size: 0px;
}

.sel_n1 .sel_body_top {
	height: 31px;
	width: 100%;
	background: url(http://api0.map.bdimg.com/images/sel_body_n_top.gif)
		repeat-x;
}

.sel_n1 .sel_body_top {
	height: 32px;
	width: 100%;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat 0 -41px
}

.sel_n1 .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_n1 .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-79px -387px;
}

.sel_n1 .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_n1 .sel_body_button {
	float: left;
	width: 20px;
	height: 31px;
	margin-left: -23px;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-253px -382px;
	overflow: hidden;
	zoom: 1;
	cursor: pointer;
}

.sel_n1 .sel_body_button a {
	display: none;
}

.sel_n1 .sel_body_body {
	display: none
}

.sel_n1 .sel_bottom {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-415px;
	height: 4px;
	font-size: 0px;
}

.sel_y {
	margin-top: 5px;
	overflow: hidden;
}

.sel_y .sel_top {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-439px;
	height: 4px;
	zoom: 1;
	font-size: 0px;
}

.sel_y .sel_body_top {
	height: 32px;
	width: 100%;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat 0 0
}

.sel_y .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_y .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-167px -384px;
}

.sel_y .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #5B7BCB;
}

.sel_y .sel_body_button {
	float: left;
	width: 20px;
	height: 31px;
	margin-left: -20px;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-269px -297px;
	cursor: pointer;
}

.sel_y .sel_body_button a {
	display: none;
}

.sel_y .sel_body_body {
	display: none;
	height: 0px
}

.sel_y .sel_body_body_div {
	
}

.sel_y .sel_bottom {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-436px;
	height: 4px;
	font-size: 0px;
}

.sel_y .sel_body_body_page {
	display: none;
	height: 0px;
}

.sel_x {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_x .sel_top {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-418px;
	height: 4px;
	font-size: 0px;
}

.sel_x .sel_body_top {
	height: 32px;
	width: 100%;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat 0 -41px;
}

.sel_x .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
}

.sel_x .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-122px -384px;
}

.sel_x .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_x .sel_body_button {
	float: left;
	width: 55px;
	margin-left: -55px;
	padding-top: 8px;
}

.sel_x .sel_body_button a {
	
}

.sel_x .sel_body_body {
	
}

.sel_x .sel_body_body_div {
	padding: 5px 5px 0 5px;
}

.sel_x .sel_bottom {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-415px;
	height: 4px;
	font-size: 0px;
}

.sel_x1 {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_x1 .sel_top {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-418px;
	height: 4px;
	font-size: 0px;
}

.sel_x1 .sel_body_top {
	height: 32px;
	width: 100%;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat 0 -41px
}

.sel_x1 .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_x1 .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat
		-122px -384px;
}

.sel_x1 .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_x1 .sel_body_button {
	float: left;
	width: 55px;
	height: 31px;
	margin-left: -55px;
}

.sel_x1 .sel_body_button a {
	display: none;
}

.sel_x1 .sel_body_body {
	display: none;
	height: 0px;
}

.sel_x1 .sel_body_body_div {
	padding: 5px 5px 0 5px;
}

.sel_x1 .sel_bottom {
	background: url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0
		-415px;
	height: 4px;
	font-size: 0px;
}

.sel_body_citylist {
	height: 100px;
	padding: 0 0 0 5px
}

.sel_body_resitem {
	table-layout: fixed;
	overflow-x: hidden;
	overflow-y: hidden;
}

.sel_body_resitem table {
	margin-right: 5px;
}

.sel_body_resitem tr {
	cursor: pointer;
}

.sel_body_resitem th {
	padding-top: 5px;
	padding-left: 5px;
	text-align: left;
	vertical-align: top;
	width: 22px;
}

.sel_body_resitem th div.iconbg {
	background: url(http://api0.map.bdimg.com/images/markers_new_ie6.png)
		no-repeat scroll 0 0;
	height: 29px;
	width: 24px;
}

.sel_body_resitem th div.icon {
	cursor: pointer
}

.sel_body_resitem th div#no_0_1,.sel_body_resitem th div#no_1_1 {
	background-position: 0 -64px
}

.sel_body_resitem th div#no_0_2,.sel_body_resitem th div#no_1_2 {
	background-position: -24px -64px
}

.sel_body_resitem th div#no_0_3,.sel_body_resitem th div#no_1_3 {
	background-position: -48px -64px
}

.sel_body_resitem th div#no_0_4,.sel_body_resitem th div#no_1_4 {
	background-position: -72px -64px
}

.sel_body_resitem th div#no_0_5,.sel_body_resitem th div#no_1_5 {
	background-position: -96px -64px
}

.sel_body_resitem th div#no_0_6,.sel_body_resitem th div#no_1_6 {
	background-position: -120px -64px
}

.sel_body_resitem th div#no_0_7,.sel_body_resitem th div#no_1_7 {
	background-position: -144px -64px
}

.sel_body_resitem th div#no_0_8,.sel_body_resitem th div#no_1_8 {
	background-position: -168px -64px
}

.sel_body_resitem th div#no_0_9,.sel_body_resitem th div#no_1_9 {
	background-position: -192px -64px
}

.sel_body_resitem th div#no_0_10,.sel_body_resitem th div#no_1_10 {
	background-position: -216px -64px
}

.sel_body_resitem td {
	line-height: 160%;
	padding: 3px 0 3px 3px;
	vertical-align: top;
}

.sel_body_resitem div.ra_td_title {
	float: left;
	margin-right: 40px;
}

.sel_body_resitem div.ra_td_button {
	float: right;
	width: 40px;
}

.sel_body_resitem div.ra_td_button input {
	height: 18px;
	font-size: 12px;
	width: 40px;
}

.sel_body_resitem div.clear {
	clear: both;
	height: 0px;
	width: 100%;
}

.sel_body_resitem td .selBtn {
	width: 70px;
	height: 29px;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat -21px -81px;
	text-align: center;
	line-height: 29px;
	visibility: hidden;
	color: #b35900;
	display: inline-block;
	*display: inline;
	*zoom: 1;
}

.sel_body_resitem td .list_street_view_poi {
	display: inline-block;
	float: none;
	margin-right: 6px;
	position: static;
	*vertical-align: -3px;
	_vertical-align: -5px;
	*display: inline;
	*zoom: 1;
}

.selInfoWndBtn {
	width: 70px;
	height: 29px;
	background:
		url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107)
		no-repeat -21px -81px;
	text-align: center;
	line-height: 29px;
	margin: 0 auto;
	cursor: pointer;
	color: #b35900
}

.sel_body_body td a {
	text-decoration: none;
	cursor: auto;
}

.sel_body_body td a:hover,.sel_body_body td a:focus {
	text-decoration: underline;
}

.panoInfoBox {
	cursor: pointer
}

.panoInfoBox {
	position: relative;
	width: 323px;
	height: 101px;
	margin-bottom: 4px;
	cursor: pointer
}

.panoInfoBox .panoInfoBoxTitleBg {
	width: 323px;
	height: 19px;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 2;
	background-color: #000;
	opacity: .7
}

.panoInfoBox .panoInfoBoxTitleContent {
	font-size: 12px;
	color: #fff;
	position: absolute;
	bottom: 2px;
	left: 5px;
	z-index: 3;
	text-decoration: none
}

.pano_switch_left,.pano_switch_right {
	position: absolute;
	width: 28px;
	height: 38px;
	cursor: pointer;
	background-color: #252525;
	background-color: rgba(37, 37, 37, .9)
}

.pano_switch_left {
	background:
		url(http://api0.map.bdimg.com/images/panorama/zuojiantou.png)
		no-repeat;
	-webkit-background-size: 100% 100%;
	background-size: 100% 100%
}

.pano_switch_right {
	background:
		url(http://api0.map.bdimg.com/images/panorama/youjiantou.png)
		no-repeat;
	-webkit-background-size: 100% 100%;
	background-size: 100% 100%
}

.pano_switch_left:hover {
	background:
		url(http://api0.map.bdimg.com/images/panorama/zuojiantou_hover.png)
		no-repeat;
	-webkit-background-size: 100% 100%;
	background-size: 100% 100%
}

.pano_switch_right:hover {
	background:
		url(http://api0.map.bdimg.com/images/panorama/youjiantou_hover.png)
		no-repeat;
	-webkit-background-size: 100% 100%;
	background-size: 100% 100%
}

.pano_switch_left.pano_switch_disable,.pano_switch_right.pano_switch_disable
	{
	background: 0 0;
	border: none
}

.pano_poi_1,.pano_poi_2,.pano_poi_4 {
	display: inline-block;
	width: 16px;
	height: 16px;
	vertical-align: middle;
	background:
		url(http://webmap0.map.bdimg.com/newmap/static/common/images/pano_whole/guide_icons_4b871b2.png)
		no-repeat;
	background-position: 0 0
}

.pano_photo_arrow_l,.pano_photo_arrow_r {
	position: absolute;
	top: 0;
	width: 20px;
	height: 100%;
	background: #f3eeee
}

.pano_photo_arrow_l {
	left: 0
}

.pano_photo_arrow_r {
	right: 0
}

.pano_arrow_l,.pano_arrow_r {
	display: inline-block;
	width: 18px;
	height: 18px;
	background:
		url(http://webmap0.map.bdimg.com/newmap/static/common/images/pano_whole/pano-icons_223a291.png)
		no-repeat
}

.pano_catlogLi {
	cursor: pointer;
	position: relative;
	line-height: 10px;
	font-size: 10px;
	text-align: center;
	color: #abb0b2;
	border: 1px solid #53565c;
	padding: 3px 0;
	margin-top: 3px;
	margin-left: 2px;
	width: 90%
}

.pano_catlogLi:hover {
	color: #3DAAFC;
	border: 1px solid #3DAAFC
}

.pano_catlogLiActive {
	color: #3DAAFC;
	border: 1px solid #3DAAFC
}

.pano_arrow_l {
	background-position: 0 -36px
}

.pano_arrow_r {
	background-position: -54px -36px
}

.pano_photo_arrow_l:hover .pano_arrow_l {
	background-position: -18px -36px
}

.pano_photo_arrow_r:hover .pano_arrow_r {
	background-position: -72px -36px
}

.pano_photo_arrow_l.pano_arrow_disable .pano_arrow_l {
	background-position: -36px -36px
}

.pano_photo_arrow_r.pano_arrow_disable .pano_arrow_r {
	background-position: -90px -36px
}

.pano_photo_item {
	position: relative;
	float: left;
	line-height: 0;
	padding-left: 8px
}

.pano_photo_decs {
	position: absolute;
	bottom: 1px;
	left: 0;
	padding: 2px 0;
	text-indent: 5px;
	margin-left: 8px;
	display: inline-block;
	color: #fff;
	background: #000;
	opacity: .5;
	filter: alpha(opacity =                                               50)
		9;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap
}

.pano_photo_item img {
	display: inline-block;
	border: solid 1px #252525
}

.pano_photo_item:hover img {
	border-color: #005efc
}

.pano_photo_item_seleted {
	position: absolute;
	top: 0;
	left: -100000px;
	border: 3px solid #097df3
}

.pano_close {
	position: absolute;
	right: 10px;
	top: 10px;
	width: 40px;
	cursor: pointer;
	height: 40px;
	line-height: 40px;
	border-radius: 3px;
	background-color: rgba(37, 37, 37, .9);
	background-image:
		url(http://api0.map.bdimg.com/images/panorama/close.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 90%
}

.pano_close:hover {
	background-image:
		url(http://api0.map.bdimg.com/images/panorama/close_hover.png)
}

.pano_pc_indoor_exit {
	position: absolute;
	right: 60px;
	top: 10px;
	width: 89px;
	cursor: pointer;
	height: 40px;
	line-height: 40px;
	color: #ebedf0;
	border-radius: 3px;
	background-color: #252525;
	background-color: rgba(37, 37, 37, .9);
	background-image:
		url(http://api0.map.bdimg.com/images/panorama/indoor_exit.png);
	background-repeat: no-repeat;
	background-position: 15px 12px
}

.pano_pc_indoor_exit:hover {
	background-image:
		url(http://api0.map.bdimg.com/images/panorama/indoor_exit_hover.png);
	color: #2495ff
}

.pano_m_indoor_exit {
	font-size: 16px;
	position: absolute;
	right: 30px;
	top: 10px;
	width: 89px;
	cursor: pointer;
	height: 40px;
	line-height: 40px;
	color: #ebedf0;
	border-radius: 3px;
	background-color: #252525;
	background-color: rgba(37, 37, 37, .9);
	background-image:
		url(http://api0.map.bdimg.com/images/panorama/indoor_exit.png);
	background-repeat: no-repeat;
	background-position: 15px 12px
}

.navtrans-table tr {
	color: #666
}

.navtrans-table tr:hover {
	color: #333
}

.navtrans-navlist-icon {
	float: left;
	width: 18px;
	height: 16px;
	background:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_b5c3223.png)
		no-repeat 0px 0px;
	_background:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_ie6_134841b.png)
		no-repeat 0px 0px;
	margin-top: 2px;
	margin-right: 5px
}

.navtrans-navlist-icon.s-1 {
	background-position: 0px 0px
}

.navtrans-navlist-icon.s-2 {
	background-position: -18px 0px
}

.navtrans-navlist-icon.s-3 {
	background-position: -36px 0px
}

.navtrans-navlist-icon.s-4 {
	background-position: -54px 0px
}

.navtrans-navlist-icon.s-5 {
	background-position: -72px 0px
}

.navtrans-navlist-icon.s-6 {
	background-position: -90px 0px
}

.navtrans-navlist-icon.s-7 {
	background-position: 0px -16px
}

.navtrans-navlist-icon.s-8 {
	background-position: -18px -16px
}

.navtrans-navlist-icon.s-9 {
	background-position: -36px -16px
}

.navtrans-navlist-icon.s-10 {
	background-position: -54px -16px
}

.navtrans-navlist-icon.s-11 {
	background-position: -72px -16px
}

.navtrans-navlist-icon.s-12 {
	background-position: -90px -16px
}

.navtrans-navlist-icon.s-13 {
	background-position: 0px -32px
}

.navtrans-navlist-icon.s-14 {
	background-position: -18px -32px
}

.navtrans-navlist-icon.s-18 {
	background-position: -36px -32px
}

.navtrans-navlist-icon.s-19 {
	background-position: -54px -32px
}

.navtrans-navlist-icon.s-20 {
	background-position: -72px -32px
}

.navtrans-navlist-icon.s-21 {
	background-position: -90px -32px
}

.navtrans-navlist-icon.nav-st,.navtrans-navlist-icon.nav-through {
	background-position: -16px -70px
}

.navtrans-navlist-icon.nav-ed {
	background-position: 0px -70px
}

.navtrans-view {
	border-top: 1px solid #e4e6e7;
	border-left: 1px solid #e4e6e7;
	border-right: 1px solid #e4e6e7
}

.navtrans-view:hover {
	cursor: pointer
}

.navtrans-view .navtrans-arrow {
	position: absolute;
	top: 8px;
	right: 5px;
	width: 7px;
	height: 4px;
	background-image:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_b5c3223.png);
	background-repeat: no-repeat;
	background-position: -40px -70px;
	margin-top: 3px;
	margin-right: 3px;
	_background-image:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_ie6_134841b.png)
}

.navtrans-view.expand:hover .navtrans-arrow {
	background-position: -61px -70px
}

.navtrans-view.expand .navtrans-arrow {
	background-position: -54px -70px
}

.navtrans-view:hover .navtrans-arrow {
	background-position: -47px -70px
}

.navtrans-navlist-content {
	overflow: hidden
}

.navtrans-res {
	border-bottom: 1px solid #E4E6E7;
	border-left: 1px solid #E4E6E7;
	border-right: 1px solid #E4E6E7
}

.navtrans-bus-icon {
	display: inline-block;
	float: left;
	background-image:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/ui3/mo_banner_e1aa2e6.png);
	background-repeat: no-repeat
}

.navtrans-bus-icon.bus {
	width: 13px;
	height: 16px;
	background-position: -1px -192px;
	position: relative;
	top: 4px
}

.navtrans-bus-icon.walk {
	width: 16px;
	height: 18px;
	background-position: -63px -189px;
	position: relative;
	top: 2px;
	left: -2px
}

.navtrans-bus-desc {
	line-height: 24px;
	margin-left: 20px
}

.navtrans-busstation {
	color: #36c;
	font-weight: 600
}

.tranroute-plan-list.expand .trans-title {
	border-bottom: 1px solid #e4e6e7;
	background-color: #ebf1fb
}

.trans-plan-content tr td:hover .bus {
	background-position: -15px -192px
}

.trans-plan-content tr td:hover .walk {
	background-position: -82px -189px
}

.suggest-plan {
	position: absolute;
	background-color: #0C88E8;
	padding: 0px 15px;
	line-height: 20px;
	color: #fff;
	left: 0px;
	top: 0px
}

.suggest-plan-des {
	text-align: left;
	padding: 29px 0px 0px 25px;
	font-size: 13px;
	color: #000
}

.bmap-clearfix { *+
	height: 1%
}

.bmap-clearfix:after {
	content: ".";
	display: block;
	height: 0px;
	clear: both;
	visibility: hidden
}

.BMap_CityListCtrl {
	font-size: 12px
}

.BMap_CityListCtrl a {
	text-decoration: none !important
}

.BMap_CityListCtrl a:hover {
	text-decoration: underline !important
}

.BMap_CityListCtrl .citylist_popup_main {
	border: 1px solid #cdcdcd;
	z-index: 2;
	position: relative;
	width: 100%;
	height: 100%;
	background: #fafafa;
	overflow: hidden;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, .1)
}

.ui_city_change_top .ui_city_change_inner,.ui_city_change_bottom .ui_city_change_inner
	{
	display: inline-block;
	height: 24px;
	line-height: 24px;
	border: 1px solid #c4c7cc;
	background-color: #fff;
	padding: 0 10px 0 10px;
	color: #000
}

.ui_city_change_top .ui_city_change_inner i,.ui_city_change_bottom .ui_city_change_inner i
	{
	width: 8px;
	height: 6px;
	display: inline-block;
	position: relative;
	top: 9px;
	left: 5px;
	-webkit-transition: all ease-in-out .15s;
	transition: all ease-in-out .15s;
	display: none9
}

.ui_city_change_click .ui_city_change_inner i,.ui_city_change_click_close .ui_city_change_inner i
	{
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg)
}

.ui_city_change_top .ui_city_change_inner:hover em {
	border-top-color: #0C88E8
}

.ui_city_change_top .ui_city_change_inner em {
	width: 0;
	height: 0;
	border-color: rgba(255, 255, 255, 0);
	border-top-color: #D0D4DA;
	border-style: solid;
	border-width: 4px
}

.ui_city_change_top .ui_city_change_inner:hover,.ui_city_change_bottom .ui_city_change_inner:hover
	{
	text-decoration: none !important;
	color: #3d6dcc
}

.ui_city_change_bottom .ui_city_change_inner:hover em {
	border-bottom-color: #0C88E8
}

.ui_city_change_bottom .ui_city_change_inner em {
	width: 0;
	height: 0;
	border-color: rgba(255, 255, 255, 0);
	border-bottom-color: #D0D4DA;
	border-style: solid;
	border-width: 4px;
	position: relative;
	top: -18px
}

.citylist_popup_main .citylist_ctr_title {
	background: #f9f9f9;
	border-bottom: 1px solid #dadada;
	height: 25px;
	line-height: 25px;
	font-size: 12px;
	color: #4c4c4c;
	padding-left: 7px
}

.citylist_popup_main .city_content_top {
	position: relative;
	height: 30px;
	padding: 15px 10px 0px 10px;
	border-bottom: 1px solid #CCC;
	margin: 0px 10px
}

.citylist_popup_main .city_content_top .cur_city_info {
	display: inline-block;
	margin: 0;
	padding: 0;
}

#city_ctrl_form {
	position: absolute;
	right: 12px;
	top: 10px
}

#selCityWd {
	border: 1px solid #ccc;
	height: 20px;
	width: 121px;
	line-height: 20px;
	text-indent: 4px;
	outline: none
}

#selCitySubmit:hover {
	background-position: -355px -98px
}

#selCitySubmit {
	float: right;
	background:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/index_a2f1ac4.png)
		no-repeat scroll -302px -98px;
	height: 24px;
	line-height: 24px;
	width: 48px;
	cursor: pointer;
	margin-left: 5px;
	text-align: center
}

#sel_city_letter_list {
	padding-top: 10px
}

#sel_city_letter_list a {
	white-space: nowrap;
	margin-right: 11px;
	line-height: 18px;
	font-size: 13px;
	font-family: Arial, Helvetica, SimSun, sans-serif
}

.city_content_medium {
	padding: 10px 10px 10px 10px;
	border-bottom: 1px solid #CCC;
	margin: 0px 10px
}

.city_content_bottom {
	padding: 10px 10px 10px 8px;
	margin: 9px 5px 5px 5px;
	height: 218px;
	overflow-y: auto
}

#city_detail_table tr td {
	vertical-align: top
}

.sel_city_hotcity a {
	color: #3d6dcc
}

.sel_city_letter {
	padding: 0 14px 0 3px
}

.sel_city_letter div {
	font-size: 24px;
	line-height: 24px;
	font-weight: 700;
	color: #ccc;
	padding: 0;
	margin: 0;
	font-family: Arial, Helvetica, SimSun, sans-serif
}

.sel_city_sf {
	padding-right: 8px;
	font-weight: 700
}

.sel_city_sf a {
	white-space: nowrap;
	line-height: 18px;
	color: #3d6dcc
}

.city_names_wrap {
	margin-bottom: 9px
}

.sel_city_name {
	color: #3d6dcc;
	white-space: nowrap;
	margin-right: 9px;
	line-height: 18px;
	float: left
}

#popup_close {
	outline: none;
	position: absolute;
	z-index: 50;
	top: 7px;
	right: 6px;
	width: 12px;
	height: 12px;
	background:
		url(http://webmap0.map.bdimg.com/wolfman/static/common/images/popup_close_15d2283.gif)
		no-repeat;
	border: 0;
	cursor: pointer
}
</style>
<link rel="stylesheet" href="${ctx }/Content/css/share_style0_16.css">
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
						target="_blank" href="${ctx }/ClientController/myOrder.do">我的订单</a></li>
					<li class="top_list2 sel"><a target="_blank"
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
							data-bd-bind="1542005847807">
							<a href="http://18665635806.chinawutong.com/linkus.html#"
								class="bds_more" data-cmd="more"></a> <a
								href="http://18665635806.chinawutong.com/linkus.html#"
								class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> <a
								href="http://18665635806.chinawutong.com/linkus.html#" class="bds_sqq"
								data-cmd="sqq" title="分享到QQ好友"></a> <a
								href="http://18665635806.chinawutong.com/linkus.html#" class="bds_qzone"
								data-cmd="qzone" title="分享到QQ空间"></a> <a
								href="http://18665635806.chinawutong.com/linkus.html#" class="bds_tsina"
								data-cmd="tsina" title="分享到新浪微博"></a>
						</div>

						<div class="clear"></div>
					</div>

				</div>

				<!--物信通图标-->
				<a href="#" title="点击查看诚信档案" class="wxtQy" target="_blank">
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
					<li><a href="${ctx }/FrontJsp/HomePage.jsp" class="nav-current">首页</a>
					</li>
					<li><a href="${ctx }/FrontJsp/Introduction.jsp" class="">公司简介</a>
					</li>
					<li><a href="${ctx }/FrontJsp/ImageDisplay.jsp" class="">形象展示</a>
					</li>

					<li><a href="${ctx }/FrontJsp/DotDistribution.jsp" class="">网点分布</a>
					</li>

					<li><a href="${ctx}/FrontJsp/LogisticsSpecialLine.jsp" class="">物流专线</a>
					</li>

					<li><a href="${ctx }/FrontJsp/SourceInformation.jsp" class="">货源信息</a>
					</li>

					<li><a href="${ctx }/FrontJsp/Join.jsp" class="">招商加盟</a>
					</li>

					<li><a href="${ctx }/ClientController/online.do" class="">在线下单</a>
					</li>

					<li><a href="${ctx }/FrontJsp/ContactUs.jsp" class="">联系我们</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<!--导航信息结束-->
		<!--子页banner开始-->
		<div class="wdBanner3"></div>
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
					<li class="sidebar_li"><a
						href="http://18665635806.chinawutong.com/xingxiang.html" class="sidebar_a">形象展示</a>
					</li>
					<li class="sidebar_li  active"><a
						href="http://18665635806.chinawutong.com/linkus.html" class="sidebar_a">联系我们</a>
					</li>

					<li class="sidebar_li"><a
						href="http://18665635806.chinawutong.com/webnotice.html" class="sidebar_a">公司动态</a>
					</li>

				</ul>
			</div>
			<div id="tabContent">
				<div class="tabList" style="display: block;">
					<div class="main_right right fl lxwm">
						<div class="main_rightTitle">
							<div class="col_2691d5 f_17 fl leftTitle">联系我们</div>
							<div class="col_666666 f_17 fr rightTitle">
								<span class="col_4e4e4e">位置：</span> <a
									href="http://18665635806.chinawutong.com/" class="col_4e4e4e">首页</a><span
									class="col_4e4e4e">&nbsp;&gt;&nbsp;</span><a class="col_4e4e4e">联系我们</a>
							</div>
						</div>
						<div class="gywm_Box">
							<div class="lxwmL fl">

								<div class="lxLTop">
									<h4>
										<b>广州市广发物流有限公司</b>
									</h4>
									<p>
										联系人：<span>胡歌</span>
									</p>
									<p>
										手&nbsp;&nbsp;机：<span>13827512921 </span>
									</p>
									<p>
										联系电话：<span> 0668-825623 </span>
									</p>
									<p>
										公司传真：<span></span>
									</p>
									<p>
										投诉电话：<span> </span>
									</p>
									<p>
										单据查询：<span></span>
									</p>
									<p>
										E-Mail：<span></span>
									</p>
									<p>
										会员网址：<span></span>
									</p>
									<p>
										总部所在地：<span>广东省 广州市 市辖区</span>
									</p>
									<p>
										总部地址：<span>广州市白云区大围物流中心</span>
									</p>
								</div>
								<div class="lxLBottom">
									<h4>
										<b>企业信息</b>
									</h4>
									<p>
										企业名称：<span>广州市广发物流有限公司</span>
									</p>
									<p>
										营业执照：<span></span>
									</p>
									<p>
										法人/负责人：<span>胡歌</span>
									</p>
									<p>
										成立时间：<span></span>
									</p>
									<p>
										代收货款：<span>是</span>
									</p>
								</div>

							</div>

							<div
								style="width: 450px; height: 450px; border: 1px solid rgb(204, 204, 204); font-size: 12px; overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;"
								id="map">
								<div
									style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default;">
									<div class="BMap_mask"
										style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; user-select: none; width: 450px; height: 450px;"></div>
									<div
										style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
											<span class="BMap_Marker BMap_noprint" unselectable="on"
												"=" " style=" position absolute; padding 0px; margin 0px; border 0px; cursor pointer; background url(&quot;http//api0.map.bdimg.com/images/blank.gif&quot;); width: 20px; height: 25px; left: 215px; top: 213px; z-index: -4648180;"
												title=""></span>
										</div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;">
											<label class="BMapLabel" unselectable="on"
												style="position: absolute; display: none; cursor: inherit; background-color: rgb(190, 190, 190); border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -20000; color: rgb(190, 190, 190);">shadow</label>
										</div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;">
											<span class="BMap_Marker" unselectable="on"
												style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 215px; top: 213px; z-index: -4648180;"><div
													style="position: absolute; margin: 0px; padding: 0px; width: 20px; height: 25px; overflow: hidden;">
													<img src="${ctx }/Content/image/icon.png"
														style="display: block; border:none;margin-left:0px; margin-top:3px; ">
												</div> <label class="BMapLabel" unselectable="on"
												style="position: absolute; display: inline; cursor: inherit; background-color: rgb(255, 255, 255); border: 1px solid rgb(255, 0, 0); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; user-select: none; left: 25px; top: 5px;">我在这里</label>
											</span>
										</div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div>
										<div
											style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div>
									</div>
									<div
										style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;">
										<div
											style="position: absolute; overflow: visible; z-index: -100; left: 225px; top: 225px; display: block; transform: translate3d(0px, 0px, 0px);">

										</div>
									</div>
									<div
										style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: none;">
										<div
											style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: none;"></div>
									</div>
									<div
										style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div>
								</div>
								<div class="pano_close" title="退出全景"
									style="z-index: 1201; display: none;"></div>
								<a class="pano_pc_indoor_exit" title="退出室内景"
									style="z-index: 1201; display: none;"><span
									style="float:right;margin-right:12px;">出口</span> </a>
								<div class=" anchorBL"
									style="height: 32px; position: absolute; z-index: 30; text-size-adjust: none; bottom: 20px; right: auto; top: auto; left: 1px;">
									<a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1"
										style="outline: none;"></a>
								</div>
								<div id="zoomer"
									style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(http://api0.map.bdimg.com/images/openhand.cur) 8 8,default">
									<div class="BMap_zoomer" style="top:0;left:0;"></div>
									<div class="BMap_zoomer" style="top:0;right:0;"></div>
									<div class="BMap_zoomer" style="bottom:0;left:0;"></div>
									<div class="BMap_zoomer" style="bottom:0;right:0;"></div>
								</div>
								<div unselectable="on" class=" BMap_scaleCtrl BMap_noprint anchorBL"
									style="bottom: 18px; right: auto; top: auto; left: 81px; width: 86px; position: absolute; z-index: 10; text-size-adjust: none;">
									<div class="BMap_scaleTxt" unselectable="on"
										style="background-color: transparent; color: black;">2000&nbsp;英尺</div>
									<div class="BMap_scaleBar BMap_scaleHBar"
										style="background-color: black;"></div>
									<div class="BMap_scaleBar BMap_scaleLBar"
										style="background-color: black;"></div>
									<div class="BMap_scaleBar BMap_scaleRBar"
										style="background-color: black;"></div>
								</div>
								<div unselectable="on"
									class=" BMap_omCtrl BMap_ieundefined BMap_noprint anchorBR quad4"
									style="width: 150px; height: 150px; bottom: 0px; right: 0px; top: auto; left: auto; position: absolute; z-index: 10; text-size-adjust: none;">
									<div class="BMap_omOutFrame" style="width: 149px; height: 149px;">
										<div class="BMap_omInnFrame"
											style="bottom: auto; right: auto; top: 5px; left: 5px; width: 142px; height: 142px;">
											<div class="BMap_omMapContainer"
												style="overflow: hidden; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left; z-index: 0;">
												<div
													style="overflow: visible; position: absolute; z-index: 0; left: -71px; top: -71px; cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default;">
													<div class="BMap_mask"
														style="position: absolute; left: 71px; top: 71px; z-index: 9; overflow: hidden; user-select: none; width: 0px; height: 0px;"></div>
													<div
														style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
															<div class="BMap_Division"
																style="position: absolute; width: 28px; display: none; overflow: hidden; border-width: 1px; border-style: solid; border-color: rgb(173, 207, 244) rgb(39, 75, 139) rgb(39, 75, 139) rgb(132, 176, 223); border-image: initial; opacity: 1; z-index: 60; user-select: none; left: 56px; top: 56px; height: 28px;">
																<div class="BMap_omViewInnFrame"
																	style="width: 26px; height: 26px;">
																	<div class="BMap_omViewMask"></div>
																</div>
															</div>
														</div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;">
															<label class="BMapLabel" unselectable="on"
																style="position: absolute; display: none; cursor: inherit; background-color: rgb(190, 190, 190); border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -20000; color: rgb(190, 190, 190);">shadow</label>
														</div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"></div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div>
														<div
															style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div>
													</div>
													<div
														style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;">
														<div
															style="position: absolute; overflow: visible; z-index: -100; left: 71px; top: 71px; display: block; transform: translate3d(0px, 0px, 0px);">

														</div>
													</div>
													<div
														style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: none;">
														<div
															style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: none;"></div>
													</div>
													<div
														style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div>
												</div>
												<div class="pano_close" title="退出全景"
													style="z-index: 1201; display: none;"></div>
												<a class="pano_pc_indoor_exit" title="退出室内景"
													style="z-index: 1201; display: none;"><span
													style="float:right;margin-right:12px;">出口</span> </a>
											</div>
											<div class="BMap_omViewMv"
												style="cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default; width: 28px; height: 28px; left: -15px; top: -15px; display: none;">
												<div class="BMap_omViewInnFrame" style="width: 26px; height: 26px;">
													<div></div>
												</div>
											</div>
										</div>
									</div>
									<div class="BMap_omBtn"
										style="bottom: 0px; right: 0px; top: auto; left: auto;"></div>
								</div>
								<div unselectable="on"
									class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL"
									style="width: 62px; height: 192px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; text-size-adjust: none;">
									<div class="BMap_stdMpPan">
										<div class="BMap_button BMap_panN" title="向上平移"></div>
										<div class="BMap_button BMap_panW" title="向左平移"></div>
										<div class="BMap_button BMap_panE" title="向右平移"></div>
										<div class="BMap_button BMap_panS" title="向下平移"></div>
										<div class="BMap_stdMpPanBg BMap_smcbg"></div>
									</div>
									<div class="BMap_stdMpZoom" style="height: 147px; width: 62px;">
										<div class="BMap_button BMap_stdMpZoomIn" title="放大一级">
											<div class="BMap_smcbg"></div>
										</div>
										<div class="BMap_button BMap_stdMpZoomOut" title="缩小一级"
											style="top: 126px;">
											<div class="BMap_smcbg"></div>
										</div>
										<div class="BMap_stdMpSlider" style="height: 108px;">
											<div class="BMap_stdMpSliderBgTop" style="height: 108px;">
												<div class="BMap_smcbg"></div>
											</div>
											<div class="BMap_stdMpSliderBgBot" style="top: 25px; height: 87px;"></div>
											<div class="BMap_stdMpSliderMask" title="放置到此级别"></div>
											<div class="BMap_stdMpSliderBar" title="拖动缩放"
												style="cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default; top: 25px;">
												<div class="BMap_smcbg"></div>
											</div>
										</div>
										<div class="BMap_zlHolder">
											<div class="BMap_zlSt">
												<div class="BMap_smcbg"></div>
											</div>
											<div class="BMap_zlCity">
												<div class="BMap_smcbg"></div>
											</div>
											<div class="BMap_zlProv">
												<div class="BMap_smcbg"></div>
											</div>
											<div class="BMap_zlCountry">
												<div class="BMap_smcbg"></div>
											</div>
										</div>
									</div>
									<div class="BMap_stdMpGeolocation"
										style="position: initial; display: none; margin-top: 43px; margin-left: 10px;">
										<div class="BMap_geolocationContainer"
											style="position: initial; width: 24px; height: 24px; overflow: hidden; margin: 0px; box-sizing: border-box;">
											<div class="BMap_geolocationIconBackground"
												style="width: 24px; height: 24px; background-image: url(http://api0.map.bdimg.com/images/navigation-control/geolocation-control/pc/bg-20x20.png); background-size: 20px 20px; background-position: 3px 3px; background-repeat: no-repeat;">
												<div class="BMap_geolocationIcon"
													style="position: initial; width: 24px; height: 24px; cursor: pointer; background-image: url(&#39;http://api0.map.bdimg.com/images/navigation-control/geolocation-control/pc/success-10x10.png&#39;); background-size: 10px 10px; background-repeat: no-repeat; background-position: center;"></div>
											</div>
										</div>
									</div>
								</div>
								<div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL"
									style="cursor: default; white-space: nowrap; color: black; background: none; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 11px; line-height: 15px; font-family: arial, sans-serif; bottom: 2px; right: auto; top: auto; left: 2px; position: absolute; z-index: 10; text-size-adjust: none;">
									<span _cid="1" style="display: inline;"><span
										style="background: rgba(255, 255, 255, 0.701961);padding: 0px 1px;line-height: 16px;display: inline;height: 16px;">©&nbsp;2018
											Baidu - GS(2016)2089号 - 甲测资字1100930 - 京ICP证030173号 - Data © 长地万方</span> </span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="clear: both; margin-bottom: 20px;"></div>
		<input type="hidden" id="hidLng" value="113.197538"> <input
			type="hidden" id="hidLat" value="23.240906">
		<!--引用百度地图API-->

		<script type="text/javascript">
			//创建和初始化地图函数：
			function initMap() {
				createMap();//创建地图
				setMapEvent();//设置地图事件
				addMapControl();//向地图添加控件
				addMapOverlay();//向地图添加覆盖物
			}
			function createMap() {
				var lng = $("#hidLng").val();
				var lat = $("#hidLat").val();
				map = new BMap.Map("map");
				map.centerAndZoom(new BMap.Point(lng, lat), 15);
			}
			function setMapEvent() {
				map.enableScrollWheelZoom();
				map.enableKeyboard();
				map.enableDragging();
				map.enableDoubleClickZoom()
			}
			function addClickHandler(target, window) {
				target.addEventListener("click", function() {
					target.openInfoWindow(window);
				});
			}
			function addMapOverlay() {
				var lng = $("#hidLng").val();
				var lat = $("#hidLat").val();

				var markers = [ {
					content : "",
					title : "我在这里",
					imageOffset : {
						width : 0,
						height : 3
					},
					position : {
						lat : lat,
						lng : lng
					}
				} ];
				for ( var index = 0; index < markers.length; index++) {
					var point = new BMap.Point(markers[index].position.lng,
							markers[index].position.lat);
					var marker = new BMap.Marker(
							point,
							{
								icon : new BMap.Icon(
										"http://api.map.baidu.com/lbsapi/createmap/images/icon.png",
										new BMap.Size(20, 25),
										{
											imageOffset : new BMap.Size(
													markers[index].imageOffset.width,
													markers[index].imageOffset.height)
										})
							});
					var label = new BMap.Label(markers[index].title, {
						offset : new BMap.Size(25, 5)
					});
					var opts = {
						width : 200,
						title : markers[index].title,
						enableMessage : false
					};
					var infoWindow = new BMap.InfoWindow(
							markers[index].content, opts);
					marker.setLabel(label);
					addClickHandler(marker, infoWindow);
					map.addOverlay(marker);
				}
				;
			}
			//向地图添加控件
			function addMapControl() {
				var scaleControl = new BMap.ScaleControl({
					anchor : BMAP_ANCHOR_BOTTOM_LEFT
				});
				scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
				map.addControl(scaleControl);
				var navControl = new BMap.NavigationControl({
					anchor : BMAP_ANCHOR_TOP_LEFT,
					type : BMAP_NAVIGATION_CONTROL_LARGE
				});
				map.addControl(navControl);
				var overviewControl = new BMap.OverviewMapControl({
					anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
					isOpen : true
				});
				map.addControl(overviewControl);
			}
			var map;

			$(function() {
				initMap();
			})
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
			//公司动态js效果控制

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
