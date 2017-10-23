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
	href="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
<link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/back/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/back/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet">
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
       $("#mainForm").attr("action", "${pageContext.request.contextPath}/product?method=deleteAll");
       $("#mainForm").submit();
    }
}


</script>
	</head>
<body>

	<%@include file="../common/head.jsp" %>
		<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/product/findPageBeanList.action" class="list-group-item active">学生管理</a>
		                <a href="${pageContext.request.contextPath}/product/getSearchPage.action" class="list-group-item">学生搜索</a>
		                <a href="${pageContext.request.contextPath}/product/getAddPage.action" class="list-group-item">添加学生</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/product/findPageBeanList.action">学生列表</a>
		                </li>
		                <li>
		                    <a href="${pageContext.request.contextPath}/product/getSearchPage.action">学生搜索</a>
		                </li>
		                <li>
		                	<a href="${pageContext.request.contextPath}/product/getAddPage.action">添加学生</a>
		                </li>
		            </ul>
		           
  <form id="mainForm" action="${pageContext.request.contextPath}/product?method=deleteAll" method="post">          
	<table class="table table-hover table-bordered">
		<input type="button" value="批量删除" class="btn btn-danger" onclick="deleteAll();">
		<tr>
			<td><input type="checkbox" id="selectAlls" onClick="selectAll();"/></td>
			<td>编号</td>
			<td>分类</td>
			<td>分类名称</td>
			<td>商品名</td>
			<td>商品副标题</td>
			<td>产品主图</td>
			<td>商品价格</td>
			<td>库存数量</td>
			<td>商品状态</td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
			<td>创建时间</td>
			<td>更新时间</td>
			<td colspan="2">操作选择</td>
		</tr>
		
		<c:forEach items="${pageBean.list}" var="product">
			
	
		<tr>
			<td><input type="checkbox" name="selectIds" value="${product.id}"/></td>
			<td>${product.id}<br/></td>
			<td>${product.category_id}<br/></td>
			<td>${category.name}<br/></td>
			<td>${product.name}<br/></td>
			<td>${product.subtitle}<br/></td>
			<td><img alt="" src="/pic/${product.main_image}" width="80" height="60" "></td>
			<td>${product.price}<br/></td>
			<td>${product.stock}<br/></td>
			<td>${product.status}<br/></td>
			<td>${product.create_time}<br/></td>
			<td>${product.update_time}<br/></td>
			<td><a
				href="${pageContext.request.contextPath}/product/deletById.action?id=${product.id}"><input
					type="button" value="删除" class="btn btn-danger"></a></td>
			<td><a
				href="${pageContext.request.contextPath}/product/update.action?id=${product.id}"><input
					type="button" value="修改" class="btn btn-info"></a></td>
			<td><a
				href="${pageContext.request.contextPath}/product/show.action?id=${product.id}"><input
					type="button" value="上架" class="btn btn-info"></a></td>
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
					      <a href="${pageContext.request.contextPath}/product/findPageBeanList.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				    
				  	<!-- 上一页 结束-->
				  
				  	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				  		<c:if test="${pageBean.pageIndex!=page}">
					        <li><a href="${pageContext.request.contextPath}/product/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
				  		<c:if test="${pageBean.pageIndex==page}">
					        <li class="active"><a href="${pageContext.request.contextPath}/product/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
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
					      <a href="${pageContext.request.contextPath}/product/findPageBeanList.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Previous">
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.css" ></script>
	</body>


</html>