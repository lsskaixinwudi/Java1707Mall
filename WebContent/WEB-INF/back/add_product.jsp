<%@page import="com.situ.mall.pojo.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/thirdlib/bootstrap/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/jquery/jquery-1.11.1.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<link href="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/thirdlib/bootstrap/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function uploadPic(){
		//定义参数
		var options = {
				url : "${pageContext.request.contextPath}/upload/uploadPic.action",
				dataType : "json",
				type : "post",
				success : function(data) {
					$("#imgId").attr("src", "/pic/" + data.fileName);
					$("#main_image").val(data.fileName);
				}
		};
		
		 $("#form-add").ajaxSubmit(options);
	}
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/category/parenCategoryList.action",
			dataType:"json",
			success:function (data,textStatus,ajax) {
			
				var html = "<option>-- 请选择 --</option>"
				for (var i = 0; i < data.length; i++) {
					
					html += "<option value='"+data[i].id+"'>" + data[i].name + "</option>";
				}
				$("#ParentCategory").html(html);
			}
		});
	});
	
	function selectCategory (Obj) {
		var parent_id = $(Obj).val();
		$("#Category option:gt(0)").remove();
		$.ajax({
			url:"${pageContext.request.contextPath}/category/categoryList.action",
			dataTypr:"json",
			data:"parent_id="+parent_id,
			success:function (data,textStatus,ajax) {
				var html = "<option>-- 请选择 --</option>";
				for (var i =0; i < data.length; i++) {
					html += "<option value='"+data[i].id+"'>" + data[i].name + "</option>";
				}
				$("#Category").html(html);
			}
		});
	}
</script>
</head>
<body>
	
	
	<div class="container">
		<div class="row">
		       <div class="col-md-12">
				</head>
				    <div>
		            <form id="form-add" class="form_border"  action="/Java1707Mall/product/addProductService.action" enctype="multipart/form-data" method="post">
	                    
	                    <div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">分类</span>
 						 <select  class="form-control" id="ParentCategory" onchange="selectCategory(this)">
 						 	<option value="">-- 请选择 --</option>
 						 </select>
 						 <select  class="form-control" id="Category" name="category_id">
 						 	<option value="">-- 请选择 --</option>
 						 </select>
					    </div>
	                    
	                    <div class="form-group">
	                        <label>产品名</label>
	                        <input type="text" id="name" name="name"  class="form-control" placeholder="产品名">
	                        <span id="nameInfo" > </span>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label>副标题</label>
	                        <input type="text" name="subtitle"  class="form-control" placeholder="副标题">
	                    </div>
	                    <div class="form-group">
	                        <label >价格</label>
	                        <input type="text" name="price" class="form-control" placeholder="请输入产品价格">
	                    </div>
	                    <div class="form-group">
	                        <label >数量</label>
	                        <input type="text" name="stock"  class="form-control" placeholder="请输入产品数量">
	                    </div>
	                    <div class="form-group">
	                        <label >状态</label>
							  	   <select name="status" class="form-control">
							  	   <option value="">状态</option>
							  		<option value="1">上架</option>
							  		<option value="2">下架</option>
							  	</select>
				  </div>
	                    </div>
	                    <div class="form-group">
	                        <label>创建时间</label>
	                        <input type="text" name="createTime" class="form-control" placeholder="创建时间">
	                    </div>
	                    <div class="form-group">
	                        <label>更新时间</label>
	                        <input type="text" name="updateTime" class="form-control" placeholder="更新时间">
	                    </div>
	                     <div  class="form-group">
					  		<label >产品主图</label>
						  	<img alt="" id="imgId" src="" width="100" height="100">
						  	<input type="hidden" id="main_image" name="main_image"/>
						  	<input type="file" name="pictureFile" onchange="uploadPic();"/>
				         </div>
				         <div class="form-group">
						  	<label>商品图片</label>
						  	<a href="javascript:void(0)" class="picFileUpload" id="picFileUpload">上传图片</a>
			                <input type="hidden" name="sub_images" id="sub_images"/>
			                <div id="J_imageView"></div>
						 </div>
						 <div class="form-group">
						  	<label>商品描述</label>
						  	<textarea style="width:900px;height:300px;visibility:hidden;" name="detail"></textarea>
						 </div>
						 <button type="submit" class="btn btn-default">Submit</button>
                	</form>
		            <!-- 学生添加表单  end -->
	                    </div>
		        </div>
				
				
				

</body>
</html>
<script type="text/javascript">
var myKindEditor ;
KindEditor.ready(function(K) {
	var kingEditorParams = {
			//指定上传文件参数名称
			filePostName  : "pictureFile",
			//指定上传文件请求的url。
			uploadJson : "${pageContext.request.contextPath}/upload/pic.action",
			//上传类型，分别为image、flash、media、file
			dir : "image",
			afterBlur: function () { this.sync(); }
	}
	var editor = K.editor(kingEditorParams);
	//多图片上传
	K('#picFileUpload').click(function() {
		editor.loadPlugin('multiimage', function() {
			editor.plugin.multiImageDialog({
				clickFn : function(urlList) {
					console.log(urlList);
					var div = K('#J_imageView');
					var imgArray = [];
					div.html('');
					K.each(urlList, function(i, data) {
						imgArray.push(data.url);
						div.append('<img src="' + data.url + '" width="80" height="50">');
					});
					$("#sub_images").val(imgArray.join(","));
					editor.hideDialog();
				}
			});
		});
	});
	//富文本编辑器
	myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);
});
</script>