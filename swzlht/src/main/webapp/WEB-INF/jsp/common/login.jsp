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
	<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form id="form">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" id="username" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" id="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                </div>
                <div  style="padding:30px;"><input onclick="test()" type="button" class="button button-block bg-main text-big input-big"  id="btn" value="登录" ></div>
            </div>
            </form>          
        </div>
    </div>
</div>
<script type="text/javascript">
var btn2 = document.getElementById('btn');
btn2.addEventListener('click', showMsg, false); //鼠标单击的时候调用showMes这个函数  
function showMsg() {
	var username = $('#username').val();
	var password = $('#password').val();
	if (!username) {
		alert('用户名不能为空');
		return;
	}
	if (!password) {
		alert('密码不能为空');
		return;
	}
	var url = '${base}/swzl/admin/login';
	var data = {
			username: username,
			password: password,
	};
	$.post(url, data, function(result) {
		if (result.retcode == 1) {
			window.location.href = '${base}/swzl/index';
		} else {
			alert(result.msg);
		}
	}, 'json').always(function(){
		//关闭弹层
	});
}
</script>


</body>
</html>