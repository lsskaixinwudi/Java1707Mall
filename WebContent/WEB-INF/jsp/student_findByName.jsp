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
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.css" />
<script src="js/jquery-3.2.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body>

	<form class="form-horizontal" action="/Java1707Web/student?method=findAll" method="post">
		<c:forEach items="${list}" var="student">
		
		</c:forEach>
		<div class="form-group">
			<label class="col-sm-2 control-label">id</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" value="${student.id}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">姓名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"
					value="${student.name}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">年龄</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"
					value="${student.age}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">性别</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"
					value="${student.gender}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">地址</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"
					value="${student.address}">
			</div>
		</div>
	
		<input type="submit" value="返回学生列表主页">

	</form>



	<%-- 

	<%
		List<Student> list = (List<Student>) request.getAttribute("student_Name");
	%>
	<form action="/Java1707Web/findall.do" method="post">
		<%
			for (Student student : list) {
		%>
		id<input type="text" value="<%=student.getId()%>"><br>
		姓名<input type="text" value="<%=student.getAge()%>"><br>
		年龄<input type="text" value="<%=student.getAge()%>" ><br>
		性别<input type="text" value="<%=student.getGender()%>" ><br>
		地址<input type="text" value="<%=student.getAddress()%>" ><br>
		生日<input type="text" value="<%=student.getBirthday()%>"><br>
		<%
			}
		%>
		<input type="submit" value="返回学生列表主页">
	</form> --%>
</body>
</html>
