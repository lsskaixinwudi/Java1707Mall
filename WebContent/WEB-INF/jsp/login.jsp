<%@page import="com.situ.mall.pojo.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="/Java1707Web/bootstrap-3.3.7-dist/jquery-1.11.1.js"></script>
<script src="/Java1707Web/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function refreshCode(){
		$("#codeImg").attr("src","${pageContext.request.contextPath}/checkImg?"+Math.random());
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="post">
	用戶名:&nbsp&nbsp<input type = "text" name = "name"/><br/><br/>
	密碼：&nbsp&nbsp&nbsp<input type = "text" name = "password"/><br/><br/>
	验证码:&nbsp&nbsp<input type = "text" name = "checkCode"/>
	<img id="codeImg" src="${pageContext.request.contextPath}/checkImg" onclick="refreshCode();">
	<input type="submit" value="登录"/>
	</form>
</body>
</html>