<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>登陆</title>
<script type="text/javascript">
	if (top.location != self.location) {
		top.location = self.location;
	}
</script>
<style type="text/css">
.common-login-div {
	width: 600px;
	height: 850px;
	background-color: #E7F2FD;
	position: absolute;
	left: 50%;
	top: 10%;
	margin-left: -205px;
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

.common-nav {
	position: absolute;
	right: 0px;
}
</style>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</head>
<body class="common-body-bg">
	<div class="common-login-div">
		<div class="common-login-title">商家注册</div>
		<div style="margin-left: 50px; margin-top: 25px;">
			<form class="layui-form layui-form-pane" id="form">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" id="username" placeholder="请输入用户名"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" id="password" placeholder="请输入密码"
							class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">名称</label>
					<div class="layui-input-inline">
						<input type="text" id="name" placeholder="请输入名称"
							class="layui-input">
					</div>
				</div>

				<div class="layui-form-item layui-form-text"
					style="margin-top: 20px;margin-right: 50px">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入店铺描述" name="content" id="content"
							class="layui-textarea"></textarea>
					</div>
				</div>

				<div class="layui-form-item"
					style="margin-top: 20px;  margin-right: 50px;">
					<button type="button" class="layui-btn" id="test3">店铺图片</button>
					<div class="layui-upload-list" id="demo3"></div>
				</div>

				<div class="layui-form-item"
					style="margin-top: 20px; margin-right: 50px;">
					<button type="button" class="layui-btn" id="test2">营业执照</button>
					<div class="layui-upload-list" id="demo2"></div>
				</div>
				
				<button class="layui-btn layui-btn-normal" type="button"
					style="width: 200px; margin-left: 60px; margin-top: 20px;" id="btn">注册</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	 var pic = '';
	   var picture = '';
	   
	   layui.use('upload', function () {
		    var $ = layui.jquery
		  , upload = layui.upload;  //特别注意  这里的两个参数必须要  不然的话  js会报错  一开始没注意 找了好久
		    upload.render({
		   elem: '#test3'
		   , accept:"file"
		   , url: '${base}/yxdj/img/upload'
		   , multiple: true
		   , before: function (obj) {
		       //预读本地文件示例，不支持ie8
		       obj.preview(function (index, file, result) {
		           $('#demo3').append('<img src="' + result + '" width="100px" height="100px"  alt="' + file.name + '" class="layui-upload-img">')
		       });
		   },done: function(res) {
			   pic = res.fileurl;
		   }
		   , Alldone: function (res) {     //done是单个上传完就执行回调  Alldone是全部上传完了才执行回调  后面才发现  入了一个很大的坑
		       if (res) {
				window.parent.location.reload();//刷新父级页面
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引 
				parent.layer.close(index); //再执行关闭
		       }
		   }
		    });
		});

	   layui.use('upload', function () {
		    var $ = layui.jquery
		  , upload = layui.upload;  //特别注意  这里的两个参数必须要  不然的话  js会报错  一开始没注意 找了好久
		    upload.render({
		   elem: '#test2'
		   , accept:"file"
		   , url: '${base}/yxdj/img/upload'
		   , multiple: true
		   , before: function (obj) {
		       //预读本地文件示例，不支持ie8
		       obj.preview(function (index, file, result) {
		           $('#demo2').append('<img src="' + result + '" width="100px" height="100px"  alt="' + file.name + '" class="layui-upload-img">')
		       });
		   },done: function(res) {
			   picture = res.fileurl;
		   }
		   , Alldone: function (res) {     //done是单个上传完就执行回调  Alldone是全部上传完了才执行回调  后面才发现  入了一个很大的坑
		       if (res) {
				window.parent.location.reload();//刷新父级页面
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引 
				parent.layer.close(index); //再执行关闭
		       }
		   }
		    });
		});
	   
	   $(document).ready(function(){
			 var form = layui.form;
			 form.render();
			//登陆
			$('#btn').click(function(){
				var username = $('#username').val();
				var password = $('#password').val();
				var name = $('#name').val();
				var content = $('#content').val();
				if (!username) {
					layer.alert('用户名不能为空');
					return;
				}
				if (!password) {
					layer.alert('密码不能为空');
					return;
				}
				if (!name) {
					layer.alert('店铺名称不能为空');
					return;
				}
				if (!content) {
					layer.alert('店铺描述不能为空');
					return;
				}
				if (!pic) {
					layer.alert('店铺图片不能为空');
					return;
				}
				if (!picture) {
					layer.alert('营业执照不能为空');
					return;
				}
				var url = '${base}/yxdj/bus/reg';
				var data = {
						userName: username,
						password:password,
						name:name,
						content:content,
						pic:pic,
						licensepic:picture,
						state:0,
				};
				var index = layer.load(1);
				$.post(url, data, function(result) {
					if (result.code == 0) {
						window.location.href = '${base}/yxdj/logout';
					} else {
						layer.alert(result.msg);
					}
				}, 'json').always(function(){
					//关闭弹层
					layer.close(index);
				});
			});
		});
	</script>
</body>
</html>