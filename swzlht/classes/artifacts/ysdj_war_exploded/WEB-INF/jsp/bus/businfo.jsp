<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</head>
<body>
	<form class="layui-form" action="">

		<div class="layui-form-item"
			style="margin-top: 20px; margin-right: 1400px;">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" lay-verify="required" autocomplete="off"
					readonly="readonly" name="userName" id="userName"
					class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">名称</label>
			<div class="layui-input-inline">
				<input type="text" id="name" placeholder="请输入名称" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item layui-form-text"
			style="margin-top: 20px;  margin-right: 800px">
			<label class="layui-form-label">描述</label>
			<div class="layui-input-block" >
				<textarea style="height:200px;" placeholder="请输入店铺描述" name="content" id="content"
					class="layui-textarea"></textarea>
			</div>
		</div>

		<div class="layui-form-item"
			style="margin-top: 20px; margin-left:100px; margin-right: 800px">
			<img style="width: 100px;height: 100px" src="" id="rc" onclick="showBigImage(this)" title="店铺图片" />
		
		<img style="width: 100px; margin-left:80px; height: 100px" src="" id="rc1" onclick="showBigImage(this)" title="营业执照" />
		</div>

		<button class="layui-btn layui-btn-normal" type="button"
			style="width: 200px; margin-left: 200px; margin-top: 80px;" id="btn">修改</button>
	</form>

	<script charset="utf-8" type="text/javascript">
		var id = window.parent.id;
		var pic = '';
		var licensepic = '';
		var data = {
			id : id,
		};
		//查询个人资料
		var url = '${base}/yxdj/bus/getUserinfo';
		var index = layer.load(1);
		$.post(url, data, function(result) {
			if (result.code == 0) {
				$("#userName").attr("value", result.user.userName);
				$("#name").attr("value", result.user.name);
				$("#content").val(result.user.content);
				$("#rc").attr("src",'${base}/../img'+result.user.pic)
				$("#rc1").attr("src",'${base}/../img'+result.user.licensepic)
			} else {
				layer.alert('查询失败');
			}
		}, 'json').always(function() {
			//关闭弹层
			layer.close(index);
		});

		$(document).ready(function() {
			//用户注册
			$('#btn').click(function() {
				var name = $('#name').val();
				var content = $('#content').val();
				if (!name) {
					layer.alert('店铺名称不能为空');
					return;
				}
				if (!content) {
					layer.alert('店铺描述不能为空');
					return;
				}
				var data = {
					id : id,
					name : name,
					content : content,
				};
				var url = '${base}/yxdj/bus/upinfo';
				var index = layer.load(1);
				$.post(url, data, function(result) {
					if (result.code == 0) {
						layer.alert('修改成功');
					} else {
						layer.alert('修改失败');
					}
				}, 'json').always(function() {
					//关闭弹层
					layer.close(index);
				});
			})
		});
		
		/**
		 * @param e 图片对象
		 */
		function showBigImage(e) {
		    layer.open({
		        type: 1,
		        title: false,
		        closeBtn: 0,
		        shadeClose: true, //点击阴影关闭
		        area: [$(e).width + 'px', $(e).height + 'px'], //宽高
		        content: "<img src=" + $(e).attr('src') + " />"
		    });
		}
	</script>
</body>
</html>