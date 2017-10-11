<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.situ.mall.pojo.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/thirdlib/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
	function uploadPic() {
		//定义参数
		var options = {
			url : "${ctx}/upload/uploadPic.action",
			dataType : "json",
			type : "post",
			success : function(data) {
				$("#imgId").attr("src", "/pic/" + data.fileName);
				$("#mainImage").val(data.fileName);
			}
		};

		$("#form-add").ajaxSubmit(options);
	}
</script>
</head>
<body>
	<%@include file="../common/productHeader.jsp"%>
	<%@include file="../common/head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/category/findPageBeanList.action"
						class="list-group-item">产品管理</a> <a
						href="${pageContext.request.contextPath}/category/getAddPage.action"
						class="list-group-item active">添加产品</a>
				</div>
			</div>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li><a
						href="${pageContext.request.contextPath}/category/findPageBeanList.action">产品列表</a>
					</li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/category/getAddPage.action">添加产品</a>
					</li>
				</ul>

				<form
					action="${pageContext.request.contextPath}/categroy/AddCategoryService.action"
					method="post">
					<span class="form-group">分类</span> <select name="parentId"
						class="form-control">
						<option value="0">一级分类</option>
						<c:forEach items="${list}" var="category">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</select>

					<div class="form-group">
						<label>产品名</label> <input type="text" id="name" name="name"
							class="form-control" placeholder="产品名"> <span
							id="nameInfo"> </span>
					</div>

					<div class="form-group">
						<label>状态</label> <select name="status" class="form-control">
							<option value="1">上架</option>
							<option value="2">下架</option>
						</select>
					</div>
					<jsp:useBean id="now" class="java.util.Date"/>
                                                      产品添加时间：<input type = "text" name="createTime" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd HH:mm:ss'/>"  class="form-control"><br>
                                                      产品更新时间：<input type = "text" class="form-control" name="updateTime" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd HH:mm:ss'/>"><br>

					<input class="btn btn-success btn-lg" type="submit" value="添加" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>