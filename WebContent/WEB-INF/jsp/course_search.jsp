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
		                <a href="${pageContext.request.contextPath}/course?method=pageList" class="list-group-item">课程管理</a>
		                <a href="${pageContext.request.contextPath}/course?method=getSearchPage" class="list-group-item active">课程搜索</a>
		                <a href="${pageContext.request.contextPath}/course?method=getAddPage" class="list-group-item">添加课程</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${pageContext.request.contextPath}/course?method=pageList">课程管理</a>
		                </li>
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/course?method=getSearchPage">课程搜索</a>
		                </li>
		                <li>
		                	<a href="${pageContext.request.contextPath}/course?method=getAddPage">添加课程</a>
		                </li>
		            </ul>
		      <form id="searchForm" action="${pageContext.request.contextPath}/course?method=searchByCondition" method="post" class="form_border">
		                <input type="hidden" name="pageIndex" id="pageIndex"/>
		                <div class="alert alert-info" role="alert">
		                    <strong>技巧提示：</strong>
		                    	支持模糊搜索和匹配搜索，匹配搜索使用*代替！
		                </div>
		                <div class="form-group">
		                    <label for="name">课程名</label>
		                    <input type="texte" id="name" name="name" class="form-control" placeholder="请输入课程名">
		                </div>
		                <div class="form-group">
		                    <label for="credit">课程学分</label>
		                    <input type="text" id="credit" name="credit" class="form-control" placeholder="输入课程学分">
		                </div>
                		<button type="submit" class="btn btn-default">提交</button>
            		</form>
            		
            		<!-- 遍历输出搜索结果 begin -->
            		<table class="table">
		                <thead>
		                    <tr>
		                        <th>id</th>
								<th>课程名</th>
								<th>课程学分</th>
								<!-- <th>删除</th>
								<th>修改</th> -->
		                    </tr>
		                </thead>
		                <tbody>
						<c:forEach items="${pageBean.list}" var="course">
							<tr>
								<td>${course.id}</td>
								<td>${course.name}</td>
								<td>${course.credit}</td>
								<%-- <td><a href="${pageContext.request.contextPath}/student?method=deletById&id=${student.id}">删除</a></td>
								<td><a href="${pageContext.request.contextPath}/student?toUpdateStudent&id=${student.id}">修改</a></td> --%>
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