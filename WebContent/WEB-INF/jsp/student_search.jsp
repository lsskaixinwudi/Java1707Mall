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
<script type="text/javascript" >
function goPage(pageIndex) {
	$('#pageIndex').val(pageIndex);
	$('#searchForm').submit();
}

$(function() {
	$("#gender option[value='${searchCondition.gender}']").prop("selected", true);
});

</script>
</head>
<body>
		<%@include file="common/header.jsp"%>
		<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/student/findPageBeanList.action" class="list-group-item">学生管理</a>
		                <a href="${pageContext.request.contextPath}/student?method=getSearchPage" class="list-group-item  active">学生搜索</a>
		                <a href="${pageContext.request.contextPath}/student?method=getAddPage" class="list-group-item">添加学生</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${pageContext.request.contextPath}/student/findPageBeanList.action">学生列表</a>
		                </li>
		                <li  class="active">
		                    <a href="${pageContext.request.contextPath}/student/getSearchPage.action">学生搜索</a>
		                </li>
		                <li>
		                	<a href="${pageContext.request.contextPath}/student/getAddPage.action">添加学生</a>
		                </li>
		            </ul>
		            <form id="searchForm" action="${pageContext.request.contextPath}/student/searchByCondition.action" method="post" class="form_border">
		                <input type="hidden" name="pageIndex" id="pageIndex"/>
		                <div class="alert alert-info" role="alert">
		                    <strong>技巧提示：</strong>
		                    	支持模糊搜索和匹配搜索，匹配搜索使用*代替！
		                </div>
		                <div class="form-group">
		                    <label for="name">用户名</label>
		                    <input type="texte" id="name" name="name" class="form-control" placeholder="请输入用户名">
		                </div>
		                <div class="form-group">
		                    <label for="age">用户年龄</label>
		                    <input type="text" id="age" name="age" class="form-control" placeholder="输入用户年龄">
		                </div>
		                <div class="form-group">
		                    <label for="gender">用户性别</label>
		                    <input type="text" id="gender" name="gender" class="form-control" placeholder="输入用户性别">
		                </div>
		                <div class="form-group">
	                        <label for="id">班级</label>
	                        <select name="banji.id" id="banji.id" class="form-control" placeholder="班级">
	                        	<c:forEach items="${banji}" var="banji">
		                            <option value="${banji.id}">${banji.name}</option>
	                        	</c:forEach>
	                           
	                        </select>
	                    </div>
                		<button type="submit" class="btn btn-default">提交</button>
            		</form>
            		
            		<!-- 遍历输出搜索结果 begin -->
            		<table class="table">
		                <thead>
		                    <tr>
		                        <th>id</th>
								<th>姓名</th>
								<th>年龄</th>
								<th>性别</th>
								<th>地址</th>
								<th>班级编号</th>
								<th>班级名</th>
								<!-- <th>删除</th>
								<th>修改</th> -->
		                    </tr>
		                </thead>
		                <tbody>
		<c:forEach items="${list}" var="student">
			
	
			<tr>
				
				<td>${student.id}<br/></td>
				<td>${student.name}<br/></td>
				<td>${student.age}<br/></td>
				<td>${student.gender}<br/></td>
				<td>${student.address}<br/></td>
				<td>${student.banji.id}<br/></td>
				<td>${student.banji.name}<br/></td>
			</tr>
		</c:forEach>
						</tbody>
					</table>
            		<!-- 遍历输出搜索结果 end -->
            		
		        </div>
		    </div>
		</div>
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
			      <a href="javascript:goPage('${pageBean.pageIndex-1}')" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
		    	</li>
		  	</c:if>
		  	<!-- 上一页 结束-->
		  
		  	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
		  		<c:if test="${pageBean.pageIndex!=page}">
			        <li>
			        	<%-- <a href="${pageContext.request.contextPath}/student?method=pageList&pageIndex=${page}">${page}</a> --%>
			        	<a href="javascript:goPage(${page})">${page}</a>
			        </li>
		  		</c:if>
		  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
		  		<c:if test="${pageBean.pageIndex==page}">
			        <li class="active"><a href="javascript:goPage(${page})">${page}</a></li>
		  		</c:if>
		  	</c:forEach>
		  
		    <!-- 下一页 开始-->
		  	<c:if test="${pageBean.pageIndex==pageBean.totalPage}">
		  		<li class="disabled">
			      <a href="javascript:void(0);" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
		    	</li>
		  	</c:if>
		  	<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
		  		<li>
			      <a href="javascript:goPage('${pageBean.pageIndex+1}')" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
		    	</li>
		  	</c:if>
		  	<!-- 下一页 结束-->
 	
		<!-- 分页结束 -->
 		  </ul>
		</nav>
		
		
		<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript" src="lib/bootstrap/js/bootstrap.js" ></script>
	</body>
</html>
