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
	<legend>订单管理</legend>
  	<div class="layui-field-box">
		<form class="layui-form" action="" style="margin-top: 20px;">
			
		</form>
  	</div>
</fieldset>
<table id="tb" lay-filter="tb"></table>
<script type="text/html" id="bar">
	<div class="layui-btn-group">
		{{# if(d.state === 0){ }}
		    <a class="layui-btn layui-btn-sm" lay-event="del" >批准</a>
		{{# } }}
		
	</div>
</script>
<script>
var id = window.parent.id;

function reload(){
	var table = layui.table;
	table.reload('tb',{
		where: {
			busId: id,
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

function ZhuangTai(data) {
    var state = data.state;
    var btns = "";
    if (state == 0) {
        btns += '<a class="" style="color:#2F4F4F">待发货</a>';
    }
    if (state == 1) {
        btns += '<a class="" style="color:#00FF00">已发货</a>';
    }
    if (state == 2) {
        btns += '<a class="" style="color:#FF0000">已完成</a>';
    }
    return btns;
}

$(document).ready(function(){
	var form = layui.form;
	form.render();
	var table = layui.table;
	table.render({
		id: 'tb',
		url: '${base}/yxdj/api/order_list',
		elem: '#tb',
		limits: [10,20,50,100],
		limit: 10,
		page: true,
		method: 'post',
		cellMinWidth: 150,
		where: {
			busId: id,
		},
		cols:  [[ //标题栏
			{
                field: 'shop',
                title: '商品名称',
                width:150,
                align: "center",
                templet: '<div>{{d.shop.name}}</div>'
            },
			{
		        title: '图片'
		        ,align: "center"
		        ,width:150
		        ,templet: function (d) {
		            return '<div ><img src="${base}/../img'+d.shop.pic+'" alt="" width="100px" height="100px" onclick="showBigImage(this)"></a></div>';
		        }
		    },
			{field:'realname',width:150,title: '收件人姓名'},
			{field:'phone',width:150,title: '联系电话'},
			{field:'address',width:600,title: '收货地址'},
			{ field: 'state',width:150, title: '状态', templet: ZhuangTai, align: 'center'},
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
	    		var url = '${base}/yxdj/api/uppstate';
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
	$('#add').click(function(){
		window.location.href = '${base}/yxdj/addshop?id='+typeId;
	});
	
});
</script>
</body>
</html>