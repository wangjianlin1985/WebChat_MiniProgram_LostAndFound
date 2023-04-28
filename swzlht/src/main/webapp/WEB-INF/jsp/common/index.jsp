<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>失物招领后台</title>
<style type="text/css">
.common-login-div {
	width: 400px;
	height: 320px;
	background-color: #E7F2FD;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -205px;
	margin-top: -140px;
	box-shadow: 10px 10px 5px #545F64;
}

.common-body-bg {
	background-image: url("${base}/res/img/login-bg.jpg");
}

.common-login-title {
	padding: 20px 10px;
	background-color: #545F64;
	text-align: center;
	font-size: 26px;
	color: #fff;
}

.common-header {
	height: 60px;
	border-bottom: 1px solid #404553;
	background-color: #23262E;
}

.common-logo {
	width: 44px;
	height: 32px;
	position: absolute;
	left: 16px;
	top: 15px;
}

.common-nav{
	position: absolute;
	right: 0px;
}
</style>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<link rel="stylesheet" href="${base}/res/css/pintuer.css">
<link rel="stylesheet" href="${base}/res/css/admin.css">
</head>
<body class="common-body-bg">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="${base}/res/img/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />失物招领后台</h1>
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本管理</h2>
  <ul style="display:block">
    <li><a  href="${base}/swzl/user_list" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    <li><a href="${base}/swzl/addnotice" target="right"><span class="icon-caret-right"></span>添加公告</a></li>
    <li><a href="${base}/swzl/gg_list" target="right"><span class="icon-caret-right"></span>公告管理</a></li>
    <li><a href="${base}/swzl/addbanner" target="right"><span class="icon-caret-right"></span>添加广告</a></li>
    <li><a href="${base}/swzl/bannerlist" target="right"><span class="icon-caret-right"></span>广告管理</a></li>
    <li><a href="${base}/swzl/lost_list" target="right"><span class="icon-caret-right"></span>失物管理</a></li>
    <li><a href="${base}/swzl/lost1_list" target="right"><span class="icon-caret-right"></span>招领管理</a></li>
  </ul>
  <h2 ><span class="icon-pencil-square-o"></span>系统设置</h2>
  <ul>
    <li><a href="${base}/swzl/login" target="right"><span class="icon-caret-right"></span>退出系统</a></li>
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>