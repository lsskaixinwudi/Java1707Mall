<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.situ.mall.pojo.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/head.jsp" %>
<link href="${ctx}/resources/thirdlib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
	function uploadPic(){
		//定义参数
		var options = {
				url : "${ctx}/upload/uploadPic.action",
				dataType : "json",
				type : "post",
				success : function(data) {
					$("#imgId").attr("src", data.filePath);
					$("#mainImage").val(data.fileName);
				}
		};
		
		 $("#form-add").ajaxSubmit(options);
	}
</script>
</head>
<body>
	<!-- 顶部导航条 begin -->
	<nav class="navbar navbar-default">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">教务管理系统</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;学生管理 </a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;班级管理</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;课程管理</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;教务管理</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="/ShiXun09/login?method=logout"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<!-- 顶部导航条 end -->
	
	<!-- 中间内容部分 begin -->
	<div class="container">
		<div class="row">
			<!--左边列表占12份中的2份-->
			<div class="col-md-2">
				<div class="list-group">
				   <a href="/ShiXun09/student?method=findAll" class="list-group-item">学生管理</a>
				  <a href="student_search.jsp" class="list-group-item">学生搜索</a>
				  <a href="/ShiXun09/student?method=getAddPage" class="list-group-item  active">添加学生</a>
				</div>
			</div>
			<!--左边列表占12份中的10份-->
			<div class="col-md-10">
				<ul class="nav nav-tabs">
				  <li role="presentation" ><a href="/ShiXun09/student?method=findAll">学生管理</a></li>
				  <li role="presentation"><a href="student_search.jsp">学生搜索</a></li>
				  <li role="presentation" class="active"><a href="/ShiXun09/student?method=getAddPage">添加学生</a></li>
				</ul>
				
				<form id="form-add" action="${ctx}/product/add.action" enctype="multipart/form-data" method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1">分类</label>
				    <input name="categoryId"  class="form-control" id="exampleInputEmail1">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">商品名称</label>
				    <input name="name" class="form-control" id="exampleInputEmail1">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">商品副标题</label>
				    <input name="subtitle" class="form-control" id="exampleInputEmail1">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">价格</label>
				    <input name="price"  class="form-control" id="exampleInputEmail1">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">库存数量</label>
				    <input name="stock"  class="form-control" id="exampleInputEmail1">
				  </div>
				  <div  class="form-group">
				  	<label >商品状态</label>
				  	<select name="status" class="form-control">
				  		<option value="1">上架</option>
				  		<option value="2">下架</option>
				  		<!-- <option value="3">删除</option> -->
				  	</select>
				  </div>
				  <div  class="form-group">
				  	<label >产品主图</label>
				  	<img alt="" id="imgId" src="" width="100" height="100">
				  	<input type="hidden" id="mainImage" name="mainImage"/>
				  	<input type="file" name="pictureFile" onchange="uploadPic();"/>
				  </div>
				  <div class="form-group">
				  	<label>商品图片</label>
				  	 <a href="javascript:void(0)" class="picFileUpload" id="picFileUpload">上传图片</a>
	                 <input type="hidden" name="subImages" id="subImages"/>
	                 <div id="J_imageView"></div>
				  </div>
				  <div class="form-group">
				  	<label>商品描述</label>
				  	 <textarea style="width:900px;height:300px;visibility:hidden;" name="detail"></textarea>
				  </div>
				  <button type="submit" class="btn btn-default">Submit</button>
				</form>
				
			</div>
		</div>
	</div>
	<!-- 中间内容部分 end -->
	
</body>
</html>
<script type="text/javascript">
var myKindEditor ;
KindEditor.ready(function(K) {
	var kingEditorParams = {
			//指定上传文件参数名称
			filePostName  : "pictureFile",
			//指定上传文件请求的url。
			uploadJson : ctx+'/upload/pic.action',
			//上传类型，分别为image、flash、media、file
			dir : "image"
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
					$("#subImages").val(imgArray.join(","));
					editor.hideDialog();
				}
			});
		});
	});
	//富文本编辑器
	myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);

});
</script>