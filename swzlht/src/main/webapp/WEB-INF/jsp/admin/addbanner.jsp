<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加广告</title>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</head>
<body>
    <form class="layui-form" action="" id="addGoodsForm">
           
       <div class="layui-form-item" style="margin-top: 20px;margin-right: 800px;">
            <label class="layui-form-label">广告名称</label>
            <div class="layui-input-block">
              <input type="text" placeholder="请输入广告名称" name="name" id="name"  class="layui-input">
            </div>
        </div>


        <div class="layui-form-item layui-form-text">
		   <label class="layui-form-label">广告内容</label>
		   <div class="layui-input-block" style="margin-right: 800px;">
		     <textarea  id="content" name="content" placeholder="请输入广告内容" class="layui-textarea" style="margin-right: 1200px;"></textarea>
		   </div>
		</div>
        
        <div class="layui-form-item" style="margin-top: 20px;margin-left: 50px;">
		    <button type="button" class="layui-btn" id="test2">广告图片</button>
		    <div style="width: 120px;height: 120px" class="layui-upload-list" id="demo2"></div>
       </div>

       <button class="layui-btn layui-btn-normal" type="button" style="width:200px;margin-left: 60px;margin-top: 20px;" id="btn">添加</button>
   </form>
   
   <script charset="utf-8" type="text/javascript">
       layui.use(['laydate','form'], function(){
           var form = layui.form
               , laydate = layui.laydate
               ,$ = layui.jquery;
           //执行一个laydate实例
           laydate.render({
               elem: '#time' //指定元素
               ,type: 'time'
           });
           form.on('select', function(data){
               $("#type").val(data.value)
           });
           form.render();
       });
   
var pic;

layui.use('upload', function () {
    var $ = layui.jquery
  , upload = layui.upload;  //特别注意  这里的两个参数必须要  不然的话  js会报错  一开始没注意 找了好久
    upload.render({
   elem: '#test2'
   , accept:"file"
   , url: '${base}/swzl/file/upload'
   , multiple: true
   , before: function (obj) {
       //预读本地文件示例，不支持ie8
       obj.preview(function (index, file, result) {
           $('#demo2').append('<img src="' + result + '" width="100px" height="100px" alt="' + file.name + '" class="layui-upload-img">')
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
$(document).ready(function(){
	$('#btn').click(function(){
		var title = $('#name').val();
		var content = $('#content').val();
		if (!title) {
			layer.alert('广告名称不能为空');
			return;
		}
		if (!content) {
			layer.alert('广告内容不能为空');
			return;
		}
		if (!pic) {
			layer.alert('广告图片不能为空');
			return;
		}
		var data = {
			title:title,
            content:content,
            pic :pic,
		};
		var url = '${base}/swzl/admin/addbanner';
		var index = layer.load(1);
		$.post(url, data, function(result) {
			if (result.code == 0) {
				layer.alert('添加成功');
				setTimeout('window.location.reload()',0);
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