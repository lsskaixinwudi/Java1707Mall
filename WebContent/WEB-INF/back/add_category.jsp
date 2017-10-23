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
	href="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.css" />
<script type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/bootstrap-3.3.7-dist/js/bootstrap.js"	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    function uploadPic() {
       //定义参数
       var options = {
           url:"${pageContext.request.contextPath}/upload/uploadPic.action",
           dataType:"json",
           type:"post",
           success: function(data) {
               $("#imgId").attr("src","/pic/" + data.fileName);
               $("#mainImage").val(data.fileName);
           }
       };
        $("#form-add").ajaxSubmit(options);
    }
</script>

	</head>
<body>
		<%@include file="../common/head.jsp" %>
		<div class="container">
		    <div class="row">
		        <div class="col-md-12">
		            
		            <!-- 学生添加表单  begin -->
		            <form id="form-add" action="${pageContext.request.contextPath}/category/addCategoryServlet.action" enctype="multipart/form-data" method="post">
	                    <div class="form-group">
	                        <label for="addname">父类编号</label>
	                        <select name="parent_id" id="addparent_id" class="form-control" placeholder="父类编号">
	                        	<c:forEach items="${list}" var="category">
		                            <option value=<c:if test="${category.parent_id}==0"></c:if>>${category.name}</option>
	                        	</c:forEach>
	                        </select>
	                    </div>
	                    <div class="form-group">
	                        <label for="addpassword">分类名</label>
	                        <input type="text" name="name" id="addname" class="form-control" placeholder="请输入分类名">
	                    </div>
	                   <div class="form-group">
	                        <label for="addpassword">状态</label>
	                        <input type="text" name="status" id="addstatus" class="form-control" placeholder="请输入状态">
	                    </div>
	                    <div class="form-group">
	                        <label for="addpassword">创建时间</label>
	                        <input type="text" name="create_time" id="addcreate_time" class="form-control" placeholder="请输入创建时间">
	                    </div>
	                    <div class="form-group">
	                        <label for="addpassword">修改时间</label>
	                        <input type="text" name="update_time" id="addupdate_time" class="form-control" placeholder="请输入修改时间">
	                    </div>
	                    
					  
					  	<input class="btn btn-success btn-lg" type="submit" value="添加"/>
					</form>
		            <!-- 学生添加表单  end -->
		            
		        </div>
		    </div>
		</div>
		
		
	</body>

</html>