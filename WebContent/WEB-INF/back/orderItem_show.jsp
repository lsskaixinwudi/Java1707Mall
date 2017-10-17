<%@page import="com.situ.mall.pojo.*"%>
<%@page import="java.util.*"%>
<%@page import="com.situ.mall.vo.PageBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<%@include file="../common/head.jsp" %>
	<link rel="stylesheet"
	href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" />
	<title>Insert title here</title>
    <script type="text/javascript">

     function moreAc(orderNo){
        location.href="${pageContext.request.contextPath}/orderBack/findOrderItem.action?orderNo="+orderNo;

 
     	
     }	
     function delorders(id) {
 		var idDel = confirm("您确认要删除吗?");

 			location.href="${pageContext.request.contextPath}/orderBack/deletById.action?id="+id;

 		}
     </script>	
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="container">
	<div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action" class="list-group-item active">订单管理</a>
		             
		                 
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action">订单管理</a>
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
			<td class="active">订单号</td>
			<td>用户id</td>
			<td class="success" >实际付款金额</td>
			<td class="warning">支付类型</td>
			
			<td class="success">运费</td>
			<td class="warning">订单状态</td>
			 <td>支付时间</td>
			 <th>发货时间</th>
			<th>交易完成时间</th>
			<th>交易关闭时间</th>
			
			<td>创建时间</td>
			<td>修改时间</td>
			<td class="active">删除</td>
			<td class="success">详情</td>
			
		</tr>
        <c:forEach items="${pageBean.list}" var="orders">
				<tr class="warning">
				  <td>${orders.id}</td>
										<td>${orders.orderNo }</td>
										<td>${orders.userId }</td>
										<%-- <td>${orders.shippingId}</td> --%>
										<td>${orders.payment}</td>
										<td>${orders.paymentType}</td>
										<td>${orders.postage}</td>
										<td>${orders.status}</td>
										<td>
										<fmt:formatDate value="${orders.paymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orders.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orders.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orders.closeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orders.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td><a href="javascript:delorders('${orders.id }')"><input
							type="button" value="删除" class="btn btn-danger" /></a></td>
										<td><a onclick="moreAc(${orders.orderNo})">详细信息</a></td>										
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
					      <a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
				    	</li>
				  	</c:if>
				    
				  	<!-- 上一页 结束-->
				  
				  	<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				  		<c:if test="${pageBean.pageIndex!=page}">
					        <li><a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
				  		</c:if>
				  		<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
				  		<c:if test="${pageBean.pageIndex==page}">
					        <li class="active"><a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action?pageIndex=${page}">${page}</a></li>
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
					      <a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Next">
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