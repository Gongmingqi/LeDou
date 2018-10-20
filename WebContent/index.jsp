<!DOCTYPE html>
<%@page import="com.wangbo.joybeans.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<%
	User user = (User)session.getAttribute("loginUser1");
	if(user==null || !user.getUsertype().equals("0")){
		response.sendRedirect("login.jsp");
	}
%>
<head>
    <meta charset="utf-8">
    <title>乐豆后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <script src="js/ie-emulation-modes-warning.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
  </head>
   <frameset rows="5%,*">
		<frame src="top.jsp" noresize="no"></frame>
		<frameset cols="10%,*">
			<frame src="left.jsp" noresize="no"></frame>
			<frame src="${pageContext.request.contextPath}/user/queryAllUserBySize.action" name="right"></frame>
		</frameset>	
   </frameset>
</html>
