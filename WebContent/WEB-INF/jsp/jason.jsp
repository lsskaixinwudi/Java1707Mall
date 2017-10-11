<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Java1707Web/bootstrap-3.3.7-dist/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(function(){
    var student = {
        "id" : 12,
        "name" : "李四",
        "age"  :   30,
        "gender" : "男"
    };
    alert(student.name);
    
    var list = [
       {
           "id" : 12,
           "name" : "高山流水",
           "age" : 30,
           "gender" : "男"
       },
       {
           "id" : 13,
           "name" : "难觅知音",
           "age" : 30,
           "gender" : "男"
       },
       {
           "id" : 14,
           "name" : "雪中",
           "age" : 20,
           "gender" : "男"
       },
   ];
   alert(list[1].name);
   
   var student2 = {
        "id" : 12,
        "name" : "悍刀",
        "age"  :   30,
        "gender" : "男",
        "interest" : ["篮球", "爬山", "旅游"]
    };
    alert(student2.interest[2]);
    
    
    var student3 = {
        "id" : 12,
        "name" : "行",
        "age"  :   30,
        "gender" : "男",
        "interest" : [
               {"name":"篮球", "time":"2年",},
               {"name":"爬山", "time":"5年"},
               {"name":"旅游", "time":"3年"}
         ]
    };
    alert(student3.interest[2].time);
});

</script>
</head>
<body>
	
	
</body>
</html>