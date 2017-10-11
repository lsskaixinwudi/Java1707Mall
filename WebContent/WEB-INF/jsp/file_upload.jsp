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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="/Java1707Web/bootstrap-3.3.7-dist/jquery-1.11.1.js"></script>
<script src="/Java1707Web/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/fileUpload" enctype="multipart/form-data" method="post" >
		用户名：<input type="text" name="name"/><br/>
		年龄：<input type="text" name="age"/><br/>
		上传文件：<input type="file" name="fileUpload"/><br/>
		<input type="submit" name="提交"/><br/>
	</form>
</body>
</html>