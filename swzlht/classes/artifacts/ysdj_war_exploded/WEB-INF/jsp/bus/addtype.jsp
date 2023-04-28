<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品类型信息</title>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</head>
<body>
    <form class="layui-form" action="">
        <div class="layui-form-item" style="margin-top: 20px;width: 800px;">
            <label class="layui-form-label">商品类型</label>
            <div class="layui-input-block">
              <input type="text" placeholder="请输入商品类型名称" name="name" id="name"  class="layui-input">
            </div>
        </div>
       
       <button class="layui-btn layui-btn-normal" type="button" style="width:200px;margin-left: 60px;margin-top: 20px;" id="btn">添加</button>
   </form>
   
   <script charset="utf-8" type="text/javascript">
   var id = window.parent.id;
   layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  var form = layui.form;
	  form.render();
	  //执行一个laydate实例
	  laydate.render({
		  elem: '#time' //指定元素
	  });
	});

$(document).ready(function(){
	$('#btn').click(function(){
		var name = $('#name').val();
		if (!name) {
			layer.alert('商品类型名称不能为空');
			return;
		}
		var data = {
			name:name,
			userId:id,
		};
		var url = '${base}/yxdj/bus/addtype';
		var index = layer.load(1);
		$.post(url, data, function(result) {
			if (result.code == 0) {
				layer.alert('添加成功');
  				layer.close(index);
  				document.getElementById('name').value='';
			} else {
				layer.alert(result.msg);
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