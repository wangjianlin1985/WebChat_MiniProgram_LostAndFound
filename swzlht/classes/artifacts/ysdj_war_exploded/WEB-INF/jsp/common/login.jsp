<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>登陆</title>
<script type="text/javascript">
if (top.location != self.location){   
    top.location = self.location;   
}
</script>
<style type="text/css">
.common-login-div {
	width: 400px;
	height: 360px;
	background-color: #E7F2FD;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -205px;
	margin-top: -140px;
	box-shadow: 10px 10px 5px #545F64;
}

.common-body-bg {
	background-image: url("${pageContext.request.contextPath}/res/img/login-bg.jpg");
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
</head>
<body class="common-body-bg">
	<div class="common-login-div">
		<div class="common-login-title">后台管理</div>
		<div style="margin-left: 50px;margin-top: 25px;">
			<form class="layui-form layui-form-pane" id="form">
				<div class="layui-form-item">
				    <label class="layui-form-label">用户名</label>
				    <div class="layui-input-inline">
				    	<input type="text" id="username" placeholder="用户名" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label">密码</label>
				    <div class="layui-input-inline">
				    	<input type="password" id="password" placeholder="密码" class="layui-input">
					</div>
				</div>
				
				<div style="margin-left:70px;">
				      <input type="radio" name="role" value="0" title="管理" checked>
				      <input type="radio" name="role" value="1" title="商家" >
			    </div>
				
				
				<div class="layui-form-item" style="margin-left: 60px;margin-top: 20px">
			        <button class="layui-btn" type="button" style="width: 200px;" id="btn">登陆</button>
			        <div class="layui-form-item" style="margin-top: 20px;margin-left: 40px">
			        	<a href="${base}/yxdj/busreg">还未账户？点击注册</a>
			    	</div>
		    	</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function(){
	 var form = layui.form;
	 form.render();
	//登陆
	$('#btn').click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		if (!username) {
			layer.alert('用户名不能为空');
			return;
		}
		if (!password) {
			layer.alert('密码不能为空');
			return;
		}
		var role = $('input[name="role"]:checked').val(); 
		if(role == 0){
			var url = '${base}/yxdj/admin/login';
			var data = {
					username: username,
					password: $('#password').val()
			};
			var index = layer.load(1);
			$.post(url, data, function(result) {
				if (result.code == 0) {
					window.location.href = '${base}/yxdj/index';
				} else {
					layer.alert(result.msg);
				}
			}, 'json').always(function(){
				//关闭弹层
				layer.close(index);
			});
		}else {
			var url = '${base}/yxdj/bus/login';
			var data = {
					userName: username,
					password: $('#password').val()
			};
			var index = layer.load(1);
			$.post(url, data, function(result) {
				if (result.code == 0) {
					if (result.user.state == 0) {
						layer.alert('您的账号管理员正在审核，请耐心等待');
					}else {
						window.location.href = '${base}/yxdj/busindex?id='+result.user.id;
					}
				} else {
					layer.alert(result.msg);
				}
			}, 'json').always(function(){
				//关闭弹层
				layer.close(index);
			});	
		}
	});
});
</script>
</body>
</html>