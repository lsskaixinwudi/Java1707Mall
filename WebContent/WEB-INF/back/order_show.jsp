<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<%@include file="../common/head.jsp" %>
		<%@include file="../common/head_front.jsp"%>
	<link rel="stylesheet"
	href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" />
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action" class="list-group-item active">详细信息</a>
		             
		                 
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/orderBack/findPageBeanList.action">详细信息</a>
		                </li>
		            </ul>
		   <form id="mainForm" action="" method="post">
		    <table class="table align-center table table-striped table-bordered table-hover table-condensed " >
		    <tr>
					<th>id</th>
					<th>用户id</th>
					<th>订单号</th>
					<th>商品id</th>
					<th>商品名称</th>
					<th>商品图片</th>
					<th>商品单价</th>
					<th>商品数量</th>
					<th>商品总价</th>
					<th>创建时间</th>
					<th>修改时间</th>
              </tr>
        <c:forEach items="${list}" var="orderItem">
				<tr class="warning">
				  <td>${orderItem.id}</td>
					<td>${orderItem.userId }</td>
					<td>${orderItem.orderNo }</td>
					<td>${orderItem.productId}</td>
					<td>${orderItem.productName}</td>
					<td>
						<img alt="" src="/pic/${orderItem.productImage}" width="100" height="100">
					</td>
					<td>${orderItem.currentUnitPrice}</td>
					<td>${orderItem.quantity}</td>
					<td>${orderItem.totalPrice}</td>
					<td>
					<fmt:formatDate value="${orderItem.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
					<fmt:formatDate value="${orderItem.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
		</c:forEach>
	</table>
	</form>
	</div>
	</div>
	</div>
</body>
</html>