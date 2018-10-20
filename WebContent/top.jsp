<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>

<script src="js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function($) {
		$("#out").click(function() {
			if (confirm("确定退出吗?")) {

			}
		});
	});
</script>

<style type="text/css">
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">乐豆后台管理系统</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse ">
				<ul class="nav navbar-nav ">
					<li><a>${userManagerName}管理员登录</a>
					</li>
					<li ><a id="time">
							<script>
        document.getElementById('time').innerHTML = new Date().toLocaleString()
                + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
        setInterval(
                "document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
                1000);
    </script>
					</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="returnLogin.jsp" target="_self">退出</a></li>
				</ul>
			</div>
		</div>
		
	</nav>
		
		
</body>
</html>
