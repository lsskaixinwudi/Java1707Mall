<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<c:set value="18" var="age"></c:set>
	<c:if test="${age==18}">
		今年18岁
	</c:if>
	<hr/>
	<c:set value="70" var="score"></c:set>
	<c:choose>
		<c:when test="${score>=90&&score<=100 }">
			优秀
		</c:when>
		<c:when test="${score>=80&&score<=89 }">
			良好
		</c:when>
		<c:when test="${score>=70&&score<=79 }">
			一般
		</c:when>
		<c:when test="${score>=60&&score<=69 }">
			及格
		</c:when>
		<c:otherwise>
			不及格
		</c:otherwise>
	</c:choose>
</body>
</html>