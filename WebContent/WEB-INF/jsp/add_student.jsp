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
		                <a href="${pageContext.request.contextPath}/student/findPageBeanList.action" class="list-group-item">学生管理</a>
		                <a href="${pageContext.request.contextPath}/student?method=getSearchPage" class="list-group-item">学生搜索</a>
		                <a href="${pageContext.request.contextPath}/student?method=getAddPage" class="list-group-item  active">添加学生</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${pageContext.request.contextPath}/student/findPageBeanList.action">学生列表</a>
		                </li>
		                <li>
		                    <a href="${pageContext.request.contextPath}/student/getSearchPage.action">学生搜索</a>
		                </li>
		                <li  class="active">
		                	<a href="${pageContext.request.contextPath}/student/getAddPage.action">添加学生</a>
		                </li>
		            </ul>
		            
		            <!-- 学生添加表单  begin -->
		            <form id="form-add" action="${pageContext.request.contextPath}/student/addStudentServlet.action" enctype="multipart/form-data" method="post">
	                    <div class="form-group">
	                        <label for="addname">用户名</label>
	                        <input type="text" name="name" id="addname" class="form-control" placeholder="用户名">
	                    </div>
	                    <div class="form-group">
	                        <label for="addpassword">用户年龄</label>
	                        <input type="text" name="age" id="addage" class="form-control" placeholder="请输入用户年龄">
	                    </div>
	                   <div class="form-group">
	                        <label for="addpassword">用户性别</label>
	                        <input type="text" name="gender" id="addgender" class="form-control" placeholder="请输入用户性别">
	                    </div>
	                    <div class="form-group">
	                        <label for="addpassword">用户地址</label>
	                        <input type="text" name="address" id="addaddress" class="form-control" placeholder="请输入用户地址">
	                    </div>
	                    <div class="form-group">
	                        <label for="id">班级</label>
	                        <select name="id" id="id" class="form-control" placeholder="班级">
	                        	<c:forEach items="${list}" var="banji">
		                            <option value="${banji.id}">${banji.name}</option>
	                        	</c:forEach>
	                        </select>
	                    </div>
	                    <div  class="form-group">
					  		<label >上传头像</label>
					  		<img alt="" id="imgId" src="" width="100" height="100">
					  		<input type="file" name="pictureFile" onchange="uploadPic();"/>
					  	</div>
					  
					  	<button type="submit" class="btn btn-default">Submit</button>
					</form>
		            <!-- 学生添加表单  end -->
		            
		        </div>
		    </div>
		</div>
		
		
	</body>

</html>