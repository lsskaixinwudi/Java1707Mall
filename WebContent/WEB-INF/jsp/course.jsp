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
	href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
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
       $("#mainForm").attr("action", "${pageContext.request.contextPath}/course?method=deleteAll");
       $("#mainForm").submit();
    }
}
</script>
</head>
<body>
	<%@include file="common/header2.jsp"%>
		<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/course?method=pageList" class="list-group-item active">课程管理</a>
		                <a href="${pageContext.request.contextPath}/course?method=getSearchPage" class="list-group-item">课程搜索</a>
		                <a href="${pageContext.request.contextPath}/course?method=getAddPage" class="list-group-item">添加课程</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/course?method=pageList">课程管理</a>
		                </li>
		                <li>
		                    <a href="${pageContext.request.contextPath}/course?method=getSearchPage">课程搜索</a>
		                </li>
		                <li>
		                	<a href="${pageContext.request.contextPath}/course?method=getAddPage">添加课程</a>
		                </li>
		            </ul>
		           
  <form id="mainForm" action="${pageContext.request.contextPath}/course?method=deleteAll" method="post">          
	<table class="table table-hover table-bordered">
		<input type="button" value="批量删除" class="btn btn-danger" onclick="deleteAll();">
		<tr>
			
			<td><input type="checkbox" id="selectAlls" onClick="selectAll();"/></td>
			<td>课程编号</td>
			<td>课程名</td>
			<td>学分</td>
			<td colspan="2">操作选择</td>
		</tr>
		<c:forEach items="${pageBean.list}" var="course">
			
	
		<tr>
			<td><input type="checkbox" name="selectIds" value="${course.id}""/></td>
			<td>${course.id}<br/></td>
			<td>${course.name}<br/></td>
			<td>${course.credit}<br/></td>
			<td><a
				href="${pageContext.request.contextPath}/course?method=deleteCourseServlet&id=${course.id}"><input
					type="button" value="删除" class="btn btn-danger"></a></td>
			<td><a
				href="${pageContext.request.contextPath}/course?method=toUpdateCourseServlet&id=${course.id}"><input
					type="button" value="修改" class="btn btn-info"></a></td>
		</tr>
		</c:forEach>
		<c:forEach items="${list}" var="course">
			
	
		<tr>
			<td><input type="checkbox" name="selectIds" value="${course.id}"/></td>
			<td>${course.id}<br/></td>
			<td>${course.name}<br/></td>
			<td>${course.credit}<br/></td>
			<td><a
				href="${pageContext.request.contextPath}/course?method=deleteCourseServlet&id=${course.id}"><input
					type="button" value="删除" class="btn btn-danger"></a></td>
			<td><a
				href="${pageContext.request.contextPath}/course?method=toUpdateCourseServlet&id=${course.id}"><input
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
					      <a href="${pageContext.request.contextPath}/course?method=pageList&pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				    
				  	<!-- 上一页 结束-->
				  
				  	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				  		<c:if test="${pageBean.pageIndex!=page}">
					        <li><a href="${pageContext.request.contextPath}/course?method=pageList&pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
				  		<c:if test="${pageBean.pageIndex==page}">
					        <li class="active"><a href="${pageContext.request.contextPath}/course?method=pageList&pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  	</c:forEach>
				  
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
		 		  </ul>
				</nav>
				<!-- 分页结束 -->
		        </div>
		    </div>
		</div>
		
		
		<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
	</body>


</html>