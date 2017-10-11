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
<script src="${pageContext.request.contextPath}/lib/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>

	</head>
<body>

		<form action="${pageContext.request.contextPath}/student/updateStudentServlet.action?id=${student.id}" method="post">
    
      		姓名：<input type="text" name="name" value="${student.name }"/></br>
      		年龄：<input type="text" name="age" value="${student.age}"/></br>
     		性别：<input type="text" name="gender" value="${student.gender }"/></br>
     		地址：<input type="text" name="address" value="${student.address }"/></br>
     		班级名：<input type="text" name="banji.id" value="${student.banji.id}"/></br>
      		<input type="submit" value="修改"/>
    	</form>
		
		
		<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-3.3.7-dist/css/bootstrap.css" ></script>
	</body>


</html>