<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.situ.mall.pojo.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1 , user-scalable=no">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function delProduct(id) {
		var isDel = confirm("您确认要删除吗？");
		if (isDel) {
			//要删除
			location.href = "${pageContext.request.contextPath}/product/deleteProductServlet.action?id="
					+ id;
		}
	}
	function selectAlls(){
		$("input[name=selectIds]").prop("checked",$("#selectAll").is(":checked"));
	};
	function deleteAll(){
		var isDel = confirm("您确认要删除吗");
		if(isDel){
			$("#mainForm").attr("action","${pageContext.request.contextPath}/product/deleteAll.action");
			$("#mainForm").submit();
		}
	}
</script>
</head>
<body>
    <%@include file="../common/categoryHeader.jsp" %>
    <%@include file="../common/head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/category/findPageBeanList.action"
						class="list-group-item active">分类管理</a> <a
						href="${pageContext.request.contextPath}/category/getAddPage.action"
						class="list-group-item">添加分类</a>
				</div>
			</div>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${pageContext.request.contextPath}/category/findPageBeanList.action">分类管理</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/category/getAddPage.action">添加分类</a>
					</li>
				</ul>

            <form action="" id="mainForm" method="post">
				<table class="table">
					<thead>
						<tr>
						    <td class="success"><input type="checkbox" id="selectAll" onClick="selectAlls();" /></td>
							<td class="active">id</td>
							<td class="danger">产品id</td>
							<td class="success">分类名称</td>
							<td class="warning">状态</td>
							<td class="danger">创建时间</td>
							<td class="info">更新时间</td>
							<td class="warning">删除</td>
							<td class="success">修改</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.list}" var="category">
							<tr>
							    <td><input type="checkbox" name="selectIds" value="${category.id }" /></td>
								<td>${category.id}</td>
								<td>${category.parentId}</td>
								<td>${category.name}</td>
								<td>
									<c:if test="${category.status == 1}">上架</c:if>
									<c:if test="${category.status == 0}">下架</c:if>
								</td>
								<td><fmt:formatDate value="${category.createTime}" pattern="yyyy-MM--dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${category.updateTime}" pattern="yyyy-MM--dd HH:mm:ss"/></td>
								<td><a href="javascript:delProduct('${category.id }');">删除</a></td>
								<td><a
									href="${pageContext.request.contextPath}/category/update.action?id=${category.id}">修改</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
				<a href="javascript:deleteAll();">批量删除</a>
				
				<!-- 分页开始 -->

				<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${pageBean.pageIndex==1}">
						<li class="disabled"><a href="javascript:void(0);"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${pageBean.pageIndex!=1}">
						<li><a href="${pageContext.request.contextPath}/category/findPageBeanList.action?pageIndexStr=${pageBean.pageIndex-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${pageBean.pageIndex!=page}">
							<li><a href="${pageContext.request.contextPath}/category/findPageBeanList.action?pageIndexStr=${page}">${page}</a></li>
						</c:if>
						<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
						<c:if test="${pageBean.pageIndex==page}">
							<li class="active"><a href="${pageContext.request.contextPath}/category/findPageBeanList.action?pageIndexStr=${page}">${page}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pageBean.pageIndex==pageBean.totalPage}">
						<li class="disabled"><a href="javascript:void(0);"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
						<li><a href="${pageContext.request.contextPath}/category/findPageBeanList.action?pageIndexStr=${pageBean.pageIndex+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
				</nav>
				<!-- 分页结束 -->
			</div>
		</div>
	</div>
</body>
</html>