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
		
		 $("#form-update").ajaxSubmit(options);
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
			
				</head>
				    <div>
		            <form id="form-update" class="form_border"  action="/Java1707Mall/product/updateProduct.action?id=${product.id}" enctype="multipart/form-data" method="post">
	                    
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
	                        <input type="text" id="name" name="name"  class="form-control" placeholder="产品名" value="${product.name}"/>
	                        <span id="nameInfo" > </span>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label>副标题</label>
	                        <input type="text" name="subtitle"  class="form-control" placeholder="副标题" value="${product.subtitle}"/>
	                    </div>
	                    <div  class="form-group">
						  	<label >产品主图</label>
						  	<img alt="" src="/pic/${product.main_image}" width="80" height="60" ">
				         </div> 
	                    <!-- <div class="form-group">
	                        <label>图片地址</label>
	                        <input type="text" name="sub_images"  class="form-control" placeholder="副标题">
	                    </div> -->
	            
	                    <div class="form-group">
	                        <label >价格</label>
	                        <input type="text" name="price" class="form-control" placeholder="请输入产品价格" value="${product.price}"/>
	                    </div>
	                    <div class="form-group">
	                        <label >数量</label>
	                        <input type="text" name="stock"  class="form-control" placeholder="请输入产品数量" value="${product.stock}"/>
	                    </div>
	                    <div class="form-group">
	                        <label >状态</label>
							  	   <select name="status" class="form-control" value="${product.status}"/>
							  	   <option value="">状态</option>
							  		<option value="1">1</option>
							  		<option value="2">2</option>
							  	</select>
				  </div>
	                    <!-- <div class="form-group">
	                        <label>创建时间</label>
	                        <input type="text" name="create_time" class="form-control" placeholder="创建时间">
	                    </div>
	                    <div class="form-group">
	                        <label>更新时间</label>
	                        <input type="text" name="update_time" class="form-control" placeholder="更新时间">
	                    </div> -->
	                    <input class="btn btn-success btn-lg" type="submit" value="修改"/>
                	</form>
		            <!-- 学生添加表单  end -->
	                    </div>
		            
		        </div>
				
				
				

</body>
</html>