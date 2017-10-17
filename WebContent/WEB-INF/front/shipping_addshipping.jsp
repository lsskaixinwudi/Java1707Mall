<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.situ.mall.pojo.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=devi
	ce-width, initial-scale=1 , user-scalable=no">
<title></title>

<%@include file="../common/head.jsp"%>
<%@include file="../common/head_front.jsp"%>
<link rel="stylesheet"
	href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="/Java1707Mall/resources/thirdlib/jquery/jquery.form.js"></script>
<script type="text/javascript">
	function uploadPic(){
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
				</head>
				    <div>
		            <form id="form-add" class="form_border"  action="/Java1707Mall/shipping/AddShippingService.action" enctype="multipart/form-data" method="post">
	                用户id：<input class="form-control" type="text" name="userId" id="userId"/>
						  	     收货姓名：<input class="form-control" type="text" name="receiverName"/>
							      收货固定电话：<input class="form-control" type="text" name="receiverPhone"/>
							      收货移动电话：<input class="form-control" type="text" name="receiverMobile"/>
					       	       省份:<input id="status" name="receiverProvince"  class="form-control">
							      城市：<input class="form-control" type="text" name="receiverCity"/>
							      区/县：<input class="form-control" type="text" name="receiverDistrict"/>
							      详细地址：<input class="form-control" type="text" name="receiverAddress"/>
							      邮编：<input class="form-control" type="text" name="receiverZip"/>
						       <p><button class="btn btn-primary" type="submit">添加</button></p>
						        </form>
		            <!-- 学生添加表单  end -->
		            
		        </div>
				
				
				

</body>
</html>