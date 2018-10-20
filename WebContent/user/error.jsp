<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>错误提示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#msg{
			color:red;
		}
	</style>
	<script type="text/javascript">
  var time=10;
  var t = setInterval("f1()", 1000);
  var j=$("#j").val();
  function f1()
  {
   document.all("time").innerHTML="<br/>剩余"+time+"秒后自动返回上一页";
   time--;
   if(time==0)
   {
   	window.location.href = "javascript:history.back()";
   }
  }
 </script>
  </head>
  
  <body>
   
       <span id="msg">${msg}</span><span id="time"></span><br/>
       <a href = "javascript:history.back()">点击立即返回上一页</a>
       
       
  </body>
</html>
