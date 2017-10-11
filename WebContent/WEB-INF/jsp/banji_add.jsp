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
	href="${pageContext.request.contextPath}/lib/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-1.11.1.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    function uploadPic() {
       //定义参数
       var options = {
           url:"${pageContext.request.contextPath}/upload/uploadPic.action",
           dataType:"json",
           type:"post",
           success: function(data) {
               $("#imgId").attr("src","/pic/" + data.fileName);
               $("#mainImage").val(data.fileName);
           }
       };
        $("#form-add").ajaxSubmit(options);
    }
</script>

	</head>
<body>
		<%@include file="common/header.jsp"%>
		<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/category/findPageBeanList.action" class="list-group-item">分类管理</a>
		                <a href="${pageContext.request.contextPath}/student?method=getSearchPage" class="list-group-item">学生搜索</a>
		                <a href="${pageContext.request.contextPath}/student?method=getAddPage" class="list-group-item  active">添加分类</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${pageContext.request.contextPath}/category/findPageBeanList.action">分类列表</a>
		                </li>
		                <li>
		                    <a href="${pageContext.request.contextPath}/student/getSearchPage.action">学生搜索</a>
		                </li>
		                <li  class="active">
		                	<a href="${pageContext.request.contextPath}/student/getAddPage.action">添加分类</a>
		                </li>
		            </ul>
		            
		            <!-- 学生添加表单  begin -->
		            <form class="form_b" action="${pageContext.request.contextPath}/category/addParentCategory.action" method="post"> 
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">添加一级分类</span>
  						<input type="text" id="name" name="name" class="form-control" placeholder="分类名称" aria-describedby="sizing-addon3">
					</div>
					<input class="btn btn-primary" type="submit" value="添加">
				</form>
				<form class="form_b" action="${pageContext.request.contextPath}/category/addSunCategory.action" method="post"> 
					<div class="input-group input-group-sm">
						<select class="form-control input-group-addon" id="parentCategory" name="parentId">
							<option>-- 请选择 --</option>
						</select>
 						 <span class="input-group-addon" id="sizing-addon3">添加二级分类</span>
  						<input type="text" id="name" name="name" class="form-control" placeholder="分类名称" aria-describedby="sizing-addon3">
					</div>
					<input class="btn btn-primary" type="submit" value="添加">
				</form>
		            <!-- 学生添加表单  end -->
		            
		        </div>
		    </div>
		</div>
		
		
	</body>

</html>