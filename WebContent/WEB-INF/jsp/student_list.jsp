<%@page import="com.situ.mall.pojo.Student"%>
<%@page import="com.situ.mall.vo.PageBean"%>
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
<script type="text/javascript" >
function goPage(pageIndex) {
	$('#pageIndex').val(pageIndex);
	$('#searchForm').submit();
}

$(function() {
	$("#gender option[value='${searchCondition.gender}']").prop("selected", true);
});

function selectAll() {
    $("input[name=selectIds]").prop("checked", $("#selectAlls").is(":checked"));
}
function deleteAll(){
    var isDel = confirm("您确认要删除吗？");
    if (isDel) {
       //要删除
       $("#mainForm").attr("action", "${pageContext.request.contextPath}/student?method=deleteAll");
       $("#mainForm").submit();
    }
}


</script>
	</head>
<body>

	<%@include file="common/header.jsp"%>
		<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/student/findPageBeanList.action" class="list-group-item active">学生管理</a>
		                <a href="${pageContext.request.contextPath}/student/getSearchPage.action" class="list-group-item">学生搜索</a>
		                <a href="${pageContext.request.contextPath}/student/getAddPage.action" class="list-group-item">添加学生</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/student/findPageBeanList.action">学生列表</a>
		                </li>
		                <li>
		                    <a href="${pageContext.request.contextPath}/student/getSearchPage.action">学生搜索</a>
		                </li>
		                <li>
		                	<a href="${pageContext.request.contextPath}/student/getAddPage.action">添加学生</a>
		                </li>
		            </ul>
		           
  <form id="mainForm" action="${pageContext.request.contextPath}/student?method=deleteAll" method="post">          
	<table class="table table-hover table-bordered">
		<input type="button" value="批量删除" class="btn btn-danger" onclick="deleteAll();">
		<tr>
			<td><input type="checkbox" id="selectAlls" onClick="selectAll();"/></td>
			<td>编号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>性别</td>
			<td>地址</td>
			<td>班级编号</td>
			<td>班级名</td>
			<td colspan="2">操作选择</td>
		</tr>
		
		<c:forEach items="${pageBean.list}" var="student">
			
	
		<tr>
			<td><input type="checkbox" name="selectIds" value="${student.id}"/></td>
			<td>${student.id}<br/></td>
			<td>${student.name}<br/></td>
			<td>${student.age}<br/></td>
			<td>${student.gender}<br/></td>
			<td>${student.address}<br/></td>
			<td>${student.banji.id}<br/></td>
			<td>${student.banji.name}<br/></td>
			<td><a
				href="${pageContext.request.contextPath}/student/deletById.action?id=${student.id}"><input
					type="button" value="删除" class="btn btn-danger"></a></td>
			<td><a
				href="${pageContext.request.contextPath}/student/toUpdateStudentServlet.action?id=${student.id}"><input
					type="button" value="修改" class="btn btn-info"></a></td>
		</tr>
		</c:forEach>
	</table>
</form>
	<nav aria-label="Page navigation" class="pull-right">
				  <ul class="pagination">
				  	<!-- 上一页 开始-->
				  	<c:if test="${pageBean.pageIndex==1}">
				  		<li class="disabled">
					      <a href="javascript:void(0);" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				  	<c:if test="${pageBean.pageIndex!=1}">
				  		<li>
					      <a href="${pageContext.request.contextPath}/student/findPageBeanList.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				    
				  	<!-- 上一页 结束-->
				  
				  	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				  		<c:if test="${pageBean.pageIndex!=page}">
					        <li><a href="${pageContext.request.contextPath}/student/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
				  		<c:if test="${pageBean.pageIndex==page}">
					        <li class="active"><a href="${pageContext.request.contextPath}/student/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  	</c:forEach>
				  
				   <c:if test="${pageBean.pageIndex==pageBean.totalPage}">
				  		<li class="disabled">
					      <a href="javascript:void(0);" aria-label="Previous">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				  	<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
				  		<li>
					      <a href="${pageContext.request.contextPath}/student/findPageBeanList.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Previous">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
				    	</li>
				  	</c:if>
		 		  </ul>
				</nav>
				<!-- 分页结束 -->
		        </div>
		    </div>
		</div>
		
		
		<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-3.3.7-dist/css/bootstrap.css" ></script>
	</body>


</html>