<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="/Java1707Web/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/Java1707Web/bootstrap-3.3.7-dist/js/bootstrap.min.js"	charset="utf-8"></script>
<script	type="text/javascript" src="/Java1707Web/bootstrap-3.3.7-dist/js/bootstrap.js" charset="utf-8"></script>
</head>
<body>
	<table style="width: 700px;" class="align-center table table-striped table-bordered table-hover table-condensed">
			<tr>  
				<td>id</td>
				<td>姓名</td>
				<td>密码</td>
			</tr>
			<c:forEach items="${OnLineAdminList}" var="adm">
				<tr>
					<td>${adm.id}</td>
					<td>${adm.name}</td>
					<td>${adm.password}</td>
				</tr>
			</c:forEach>
			
		</table>
</body>
</html>
