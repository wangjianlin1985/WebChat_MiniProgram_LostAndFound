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
	<legend>用户管理</legend>
  	<div class="layui-field-box">
		<form class="layui-form" action="" style="margin-top: 20px;">
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
		      	<div class="layui-input-inline" style="width: 193px;" >
		        	<input type="text" id="userName" class="layui-input" placeholder="用户名">
		      	</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">名称</label>
		      	<div class="layui-input-inline" style="width: 193px;" >
		        	<input type="text" id="name" class="layui-input" placeholder="商家名称">
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
		 {{# if(d.state === 0){ }}
		 	<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="btg">不通过</a>
  			<a class="layui-btn layui-btn-sm" lay-event="tongguo" >通过</a>
	  	 {{# } }}
		 {{# if(d.state === 1){ }}
  			<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</a>
	  	 {{# } }}
	</div>
</script>
<script>
function reload(){
	var table = layui.table;
	table.reload('tb',{
		where: {
			userName: $('#userName').val(),
			name: $('#name').val(),
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
		url: '${base}/yxdj/api/bus_list',
		elem: '#tb',
		limits: [10,20,50,100],
		limit: 10,
		page: true,
		method: 'post',
		cellMinWidth: 150,
		where: {
			userName: $('#userName').val(),
			realname: $('#realname').val(),
		},
		cols:  [[ //标题栏
			{field:'userName',width:150,title: '用户名'},
			{field:'name',width:100,title: '店铺名称'},
			{
		        title: '图片'
		        ,align: "center"
		        ,width:150
		        ,templet: function (d) {
		            return '<div ><img src="${base}/../img'+d.pic+'" alt="" width="100px" height="100px" onclick="showBigImage(this)"></a></div>';
		        }
		    },
		    {
		        title: '营业执照'
		        ,align: "center"
		        ,width:150
		        ,templet: function (d) {
		            return '<div ><img src="${base}/../img'+d.licensepic+'" alt="" width="100px" height="100px" onclick="showBigImage(this)"></a></div>';
		        }
		    },
			
			{field:'content',width:600,title: '店铺描述'},
			{field: 'state',width:100, title: '状态',templet: ZhuangTai, align: 'center'},
			{title:'操作',fixed: 'right',toolbar: '#bar',width:200}
		]]
	});
	//监听工具条
	table.on('tool(tb)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data; //获得当前行数据
	  	var layEvent = obj.event; //获得 lay-event 对应的值
	  	var tr = obj.tr; //获得当前行 tr 的DOM对象
	  	if(layEvent == 'del'){
	  		layer.confirm('确定删除？', function(index){
	    		var url = '${base}/yxdj/admin/delabus';
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
	  	}else if (layEvent == 'btg') {
	  		layer.confirm('确定拒绝该商家入驻？', function(index){
	  			var url = '${base}/yxdj/admin/delabus';
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
		}else if (layEvent == 'tongguo') {
	  		layer.confirm('确定同意该商家入驻？', function(index){
	  			var url = '${base}/yxdj/bus/upinfo';
	    		var reqData = {
	    			id: data.id,
	    			state:1,
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
function ZhuangTai(data) {
	var state = data.state;
	var btns = "";
	if (state == 0) {
		btns += '<a class=""style="color:#FF0000">待审核</a>';
	}else if (state == 1) {
		btns += '<a class=""style="color:#00FF00">已通过</a>';
	}
	return btns;
}
</script>
</body>
</html>