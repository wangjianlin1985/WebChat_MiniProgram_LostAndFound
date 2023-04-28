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
	<legend>广告管理</legend>
  	<div class="layui-field-box">
		<form class="layui-form" action="" style="margin-top: 20px;">
		    <div class="layui-inline">
				<label class="layui-form-label">名称</label>
		      	<div class="layui-input-inline" style="width: 193px;" >
		        	<input type="text" id="name" class="layui-input" placeholder="广告名称">
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
			title: $('#name').val(),
		}
	});
}

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


$(document).ready(function(){
	var form = layui.form;
	form.render();
	var table = layui.table;
	table.render({
		id: 'tb',
		url: '${base}/swzl/api/banner_list',
		elem: '#tb',
		limits: [10,20,50,100],
		limit: 10,
		page: true,
		method: 'post',
		cellMinWidth: 150,
		where: {
			title: $('#name').val(),
		},
		cols:  [[ //标题栏
			{
				title: '图片'
				,align: "center"
				,width:150
				,templet: function (d) {
					return '<div ><img src="${base}/../file'+d.pic+'" alt="" width="100px" height="100px" onclick="showBigImage(this)"></a></div>';
				}
			},
			{field:'title',width:300,title: '名称'},
			{field:'content',width:900,title: '描述'},
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
	    		var url = '${base}/swzl/admin/delabanner';
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