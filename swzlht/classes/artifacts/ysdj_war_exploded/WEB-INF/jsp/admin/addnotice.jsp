<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加公告</title>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</head>
<body>
	<form class="layui-form" action="">

		<div class="layui-form-item"
			style="margin-top: 20px; margin-right: 800px;">
			<label class="layui-form-label">公告名称</label>
			<div class="layui-input-block">
				<input type="text" placeholder="请输入公告名称" name="title" id="title"
					class="layui-input">
			</div>
		</div>

		<div class="layui-form-item layui-form-text"
			style="margin-top: 20px; margin-right: 800px;">
			<label class="layui-form-label">公告描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入公告描述" name="content" id="content"
					class="layui-textarea"></textarea>
			</div>
		</div>
		
		<button class="layui-btn layui-btn-normal" type="button"
			style="width: 200px; margin-left: 60px; margin-top: 20px;" id="btn">添加</button>
	</form>

	<script charset="utf-8" type="text/javascript">
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  //执行一个laydate实例
	  laydate.render({
		  elem: '#time' //指定元素
	  });
	});
	$(document).ready(function(){
		//用户注册
		$('#btn').click(function(){
			var title = $('#title').val();
			var content = $('#content').val();
			if (!title) {
				layer.alert('公告名称不能为空');
				return;
			}
			if (!content) {
				layer.alert('公告描述不能为空');
				return;
			}
			var data = {
					title :title,
					content :content,
			};
			var url = '${base}/yxdj/admin/addgg';
			var index = layer.load(1);
			$.post(url, data, function(result) {
				if (result.code == 0) {
					window.location.href = '${base}/yxdj/gg_list';
				} else {
					layer.alert('添加失败');
				}
			}, 'json').always(function(){
				//关闭弹层
				layer.close(index);
			});
		})
	});
</script>
</body>
</html>