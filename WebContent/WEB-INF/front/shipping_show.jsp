<%@page import="com.situ.mall.pojo.*"%>
<%@page import="java.util.*"%>
<%@page import="com.situ.mall.vo.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<%@include file="../common/head.jsp" %>
	<link rel="stylesheet"
	href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" />
<title>Insert title here</title>
     <script type="text/javascript">
	function goPage(pageIndex) {
		$('#pageIndex').val(pageIndex);
		$('#searchForm').submit();
	}
	$(function(){
	       $("#status option[value='${searchCondition.status}']").prop("selected", true);
	    });
	function delshipping(id) {
		var idDel = confirm("您确认要删除吗?");
		location.href="${pageContext.request.contextPath}/shipping/deletById.action?id="+id;
		}
	function selectAlls() {
		$("input[name=ids]").prop("checked", $("#selectAll").is(":checked"));
	}
	function deleteAll(){
		var isDel = confirm("您确认要删除吗？");
		if (isDel) {
			//要删除
			$("#mainForm").attr("action", "${pageContext.request.contextPath}/category/deleteAll.action");
			$("#mainForm").submit();
		}
	}
	</script>
</head>
<body>
	<%@include file="../common/head_front.jsp"%>
	<div class="container">
	<div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/shipping/findPageBeanList.action" class="list-group-item active">收货地址管理</a>
		                <a href="${pageContext.request.contextPath}/shipping/getAddPage.action" class="list-group-item">添加收货地址</a>
		                 
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/shipping/findPageBeanList.action">收货地址管理</a>
		                </li>
		                <li>
		                	<a href="${pageContext.request.contextPath}/shipping/getAddPage.action">添加收货地址</a>
		                </li>
		            </ul>
		             <% 
						PageBean pageBean = (PageBean)request.getAttribute("pageBean");
						List<Category> list = pageBean.getList();
					%>
		            		   
		   <form id="mainForm" action="" method="post">
		    <table class="table align-center table table-striped table-bordered table-hover table-condensed " >
		    <tr>
		    <td>
		    <input type="checkbox" id="selectAll" onClick="selectAlls();" ></input>
		    </td>
			<td class="active">用户id</td>
			<td>收货人姓名</td>
			<td class="success" >收货固定电话</td>
			<td class="warning">收货移动电话</td>
			
			<td class="success">省份/城市/县</td>
			<td class="warning">详细地址</td>
			 <td>邮编</td>
			
			<td>创建时间</td>
			<td>修改时间</td>
			<td class="active">删除</td>
			
		</tr>
        <c:forEach items="${pageBean.list}" var="shipping">
				<tr class="warning">
				  <%-- 	<td><input type="checkbox" name="selectIds" value="${category.id }"/></td> --%>
					<td>${shipping.id}</td>
					<td>${shipping.userId }</td>
					<td>${shipping.receiverName }</td>
					<td>${shipping.receiverPhone}</td>
					<td>${shipping.receiverMobile}</td>
					<td>${shipping.receiverProvince}/${shipping.receiverCity}/${shipping.receiverDistrict}</td>
					<td>${shipping.receiverAddress}</td>
					<td>${shipping.receiverZip}</td>
					<td>
					<fmt:formatDate value="${shipping.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
					<fmt:formatDate value="${shipping.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td><a href="javascript:delshipping('${shipping.id }')"><input
							type="button" value="删除" class="btn btn-danger" /></a></td>
				</tr>
		</c:forEach>
	</table>
	</form>
	    <!-- 分页开始 -->
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
					      <a href="${pageContext.request.contextPath}/category/findPageBeanList.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				    
				  	<!-- 上一页 结束-->
				  
				  	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				  		<c:if test="${pageBean.pageIndex!=page}">
					        <li><a href="${pageContext.request.contextPath}/shipping/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
				  		<c:if test="${pageBean.pageIndex==page}">
					        <li class="active"><a href="${pageContext.request.contextPath}/shipping/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  	</c:forEach>
				  	<c:if test="${pageBean.pageIndex==pageBean.totalPage}">
				  		<li class="disabled">
					      <a href="javascript:void(0);" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				  	<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
				  		<li>
					      <a href="${pageContext.request.contextPath}/shipping/findPageBeanList.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
				    	</li>
				  	</c:if>
		 		  </ul>
				</nav>
				<!-- 分页结束 --> 
			<%-- 	        <!-- 分页开始 -->
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
			        	<a href="javascript:goPage('${page}')">${page}</a>
			        </li>
		  		</c:if>
		  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
		  		<c:if test="${pageBean.pageIndex==page}">
			        <li class="active"><a href="javascript:goPage('${page}')">${page}</a></li>
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
 		  </ul>
		</nav>
		<!-- 分页结束 --> --%>
</div>
</div>
</div>

</body>
</html>