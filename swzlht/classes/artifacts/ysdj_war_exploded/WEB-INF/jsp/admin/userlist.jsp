<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<style type="text/css">
	.layui-table-cell{
            height: auto;
            white-space: normal;
            text-align: center;
        }
</style>
</head>
<body style="margin: 10px;">
<fieldset class="layui-elem-field">
	<legend>注册用户管理</legend>
  	<div class="layui-field-box">
		<form class="layui-form" action="" style="margin-top: 20px;">
		    <div class="layui-inline">
				<label class="layui-form-label">手机号</label>
		      	<div class="layui-input-inline" style="width: 193px;" >
		        	<input type="text" id="phone" class="layui-input" placeholder="手机号">
		      	</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
		      	<div class="layui-input-inline" style="width: 193px;" >
		        	<input type="text" id="userName" class="layui-input" placeholder="用户名">
		      	</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
		      	<div class="layui-input-inline" style="width: 193px;" >
		        	<input type="text" id="realname" class="layui-input" placeholder="姓名">
		      	</div>
			</div>
		    <div class="layui-inline">
				<label class="layui-form-label"><button type="button" class="layui-btn" id="search">查询</button></label>
			</div>
		</form>
  	</div>
</fieldset>
<table id="tb" lay-filter="tb"></table>
<script type="text/html" id="bar">
	<div class="layui-btn-group">
		<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</a>
	</div>
</script>
<script>
function reload(){
	var table = layui.table;
	table.reload('tb',{
		where: {
			phone: $('#phone').val(),
			userName: $('#userName').val(),
			realname: $('#realname').val(),
		}
	});
}
$(document).ready(function(){
	var form = layui.form;
	form.render();
	var table = layui.table;
	table.render({
		id: 'tb',
		url: '${base}/yxdj/admin/user_list',
		elem: '#tb',
		limits: [10,20,50,100],
		limit: 10,
		page: true,
		method: 'post',
		cellMinWidth: 150,
		where: {
			phone: $('#phone').val(),
			userName: $('#userName').val(),
			realname: $('#realname').val(),
		},
		cols:  [[ //标题栏
			{field:'userName',width:150,title: '用户名'},
			{field:'phone',width:150,title: '手机号'},
			{field:'realname',width:150,title: '姓名'},
			{field:'sex',width:150,title: '性别'},
			{field:'address',width:600,title: '地址'},
			{field:'email',width:150,title: '邮箱'},
			{title:'操作',fixed: 'right',toolbar: '#bar',width:300}
		]]
	});
	//监听工具条
	table.on('tool(tb)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data; //获得当前行数据
	  	var layEvent = obj.event; //获得 lay-event 对应的值
	  	var tr = obj.tr; //获得当前行 tr 的DOM对象
	  	if(layEvent == 'del'){
	  		layer.confirm('确定删除？', function(index){
	    		var url = '${base}/yxdj/admin/delauser';
	    		var reqData = {
	    			id: data.id,
	    		};
	    		var index = layer.load(1);
	    		$.post(url, reqData, function(result) {
	    			if (result.code == 0) {
			      		layer.close(index);
	    				layer.msg('操作成功');
	    				reload();
	    			} else {
	    				layer.alert(result.msg);
	    			}
	    		}, 'json').always(function(){
	    			//关闭弹层
	    			layer.close(index);
	    		});
	    	});
	  	}
	});
	$('#search').click(function(){
		reload();
	});
});
</script>
</body>
</html>