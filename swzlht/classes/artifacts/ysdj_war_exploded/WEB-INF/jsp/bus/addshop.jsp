<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品信息</title>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</head>
<body>
	<form class="layui-form" action="">
		<div class="layui-form-item" style="margin-top: 20px; width: 800px;">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-block">
				<input type="text" placeholder="请输入商品名称" name="name" id="name"
					class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item" style="margin-top: 20px; width: 800px;">
			<label class="layui-form-label">商品价格</label>
			<div class="layui-input-block">
				<input type="text" placeholder="请输入商品价格" name="price" id="price"
					class="layui-input">
			</div>
		</div>

		<div class="layui-form-item layui-form-text"
			style="margin-top: 20px; margin-right: 920px">
			<label class="layui-form-label">商品描述</label>
			<div class="layui-input-block">
				<textarea style="height: 200px" placeholder="请输入商品描述" name="content" id="content"
					class="layui-textarea"></textarea>
			</div>
		</div>

		<div class="layui-form-item"
			style="margin-top: 20px; margin-left:80px;margin-right: 50px;">
			<button type="button" class="layui-btn" id="test3">商品图片</button>
			<div class="layui-upload-list" id="demo3"></div>
		</div>

		<button class="layui-btn layui-btn-normal" type="button"
			style="width: 200px; margin-left: 60px; margin-top: 20px;" id="btn">添加</button>
	</form>

	<script charset="utf-8" type="text/javascript">
		var id = window.parent.id;
		var typeId;
		var url = location.search; //获取url中"?"符后的字串 ('?modFlag=business&role=1')
		var theRequest = new Object();
		if ( url.indexOf( "?" ) != -1 ) {
		  var str = url.substr( 1 ); //substr()方法返回从参数值开始到结束的字符串；
		  var strs = str.split( "&" );
		  for ( var i = 0; i < strs.length; i++ ) {
		    theRequest[ strs[ i ].split( "=" )[ 0 ] ] = ( strs[ i ].split( "=" )[ 1 ] );
		  }
		  typeId = theRequest.id;
		};
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			var form = layui.form;
			form.render();
			//执行一个laydate实例
			laydate.render({
				elem : '#time' //指定元素
			});
		});
		
		layui.use('upload', function () {
		    var $ = layui.jquery
		  , upload = layui.upload;  //特别注意  这里的两个参数必须要  不然的话  js会报错  一开始没注意 找了好久
		    upload.render({
		   elem: '#test3'
		   , accept:"file"
		   , url: '${base}/img/upload'
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

		$(document).ready(function() {
			$('#btn').click(function() {
				var name = $('#name').val();
				var content = $('#content').val();
				var price = $('#price').val();
				if (!name) {
					layer.alert('商品名称不能为空');
					return;
				}
				if (!content) {
					layer.alert('商品描述不能为空');
					return;
				}
				if (!price) {
					layer.alert('商品价格不能为空');
					return;
				}
				if (!pic) {
					layer.alert('商品图片不能为空');
					return;
				}
				var data = {
					name : name,
					userId : id,
					content :content,
					typeId:typeId,
					pic:pic,
					price:price,
				};
				var url = '${base}/bus/addshop';
				var index = layer.load(1);
				$.post(url, data, function(result) {
					if (result.code == 0) {
						layer.alert('添加成功');
						window.location.href = '${base}/yxdj/shop_list?id='+typeId;
					} else {
						layer.alert(result.msg);
					}
				}, 'json').always(function() {
					//关闭弹层
					layer.close(index);
				});
			})
		});
	</script>
</body>
</html>