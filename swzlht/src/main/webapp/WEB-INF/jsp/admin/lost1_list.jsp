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
	<legend>招领管理</legend>
	<div class="layui-field-box">
		<form class="layui-form" action="" style="margin-top: 20px;">
			<div class="layui-inline">
				<label class="layui-form-label">名称</label>
				<div class="layui-input-inline" style="width: 193px;" >
					<input type="text" id="name" class="layui-input" placeholder="物品名称">
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
	<a class="layui-btn layui-btn-sm layui-btn-danger"  lay-event="del">删除</a>
</script>

<script type="text/html" id="imgs_tpl">
	{{# var list = d.pic.split(','); 
	    for(var i=0;i<list.length;i++){
			var index = i + 1;
	    	var t = list[i];
	}}
		<a onclick="openImg('${base}/../file{{= t }}')">图片{{= index }}</a>
	{{# } }}
</script>

<script>

function openVideo(path){
	layer.open({
        type: 2,
        content: path,
        area: ['600px', '450px'],
        offset:'t',
        maxmin: true,
        end: function () {
        }
    });
}

function openImg(path){
	layer.open({
	  type: 1,
	  title: false,
	  closeBtn: 0,
	  shadeClose: true,
	  skin: 'layui-layer-nobg', //加上边框
	  content: '<img style="width:400px;" src="'+path+'"></img>'
	});
}

var id=window.parent.id;
function reload(){
	var table = layui.table;
	table.reload('tb',{
		where: {
			type:"招领",
			name: $('#name').val(),
		}
	});
}

function ZhuangTai1(data) {
	var state = data.state;
	var btns = "";
	if (state == '0') {
		btns += '<a class="" style="color:#2F4F4F">待认领</a>';
	}
	if (state == '1') {
		btns += '<a class="" style="color:#00FF00">已认领</a>';
	}
	return btns;
}

$(document).ready(function(){
	var form = layui.form;
	form.render();
	var table = layui.table;
	table.render({
		id: 'tb',
		url: '${base}/swzl/api/lost_list',
		elem: '#tb',
		limits: [10,20,50,100],
		limit: 10,
		page: true,
		method: 'post',
		cellMinWidth: 150,
		where: {
			type:"招领",
		},
		cols:  [[ //标题栏
			{title:'图片',width:200,templet: '#imgs_tpl'},
			{field:'name',width:100,title: '物品名称'},
			{field:'time',width:150,title: '发布时间'},
			{field:'contacts',width:100,title: '联系人'},
			{field:'phone',width:150,title: '联系电话'},
			{field:'address',width:150,title: '丢失地址'},
			{field:'content',width:350,title: '内容'},
			{field: 'state',width:150, title: '状态', templet: ZhuangTai1, align: 'center'},
			{title:'操作',fixed: 'right',toolbar: '#bar',width:300}
		]]
	});
	//监听工具条
	table.on('tool(tb)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data; //获得当前行数据
	  	var layEvent = obj.event; //获得 lay-event 对应的值
	  	var tr = obj.tr; //获得当前行 tr 的DOM对象
	  	if(layEvent == 'del'){
			//删除
			layer.confirm('确定删除？', function(index){
	    		var url = '${base}/admin/delalost';
	    		var reqData = {
	    			id: data.id,
	    		};
	    		var index = layer.load(1);
	    		$.post(url, reqData, function(result){
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