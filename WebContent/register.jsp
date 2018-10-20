<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<head>
<meta charset="utf-8">
<title>乐豆注册页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->

<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/loader-style.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/signin.css">

<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<!-- MAIN EFFECT -->

<link rel="shortcut icon" href="assets/ico/minus.png">

<script src="jquery-1.7.2.min.js"></script>
<style type="text/css">
#zhong {
	margin-top: 200px;
}

#yzmsj {
	display: none;
}

#1 {
	color: green;
}
</style>

<script type="text/javascript">

 
 
 $(function(){
		$("#FunctionButtonInput").live("click",function(){
			var ajax_option={
				type:"post",
				url:"${pageContext.request.contextPath}/user/regist.action",
				//data:$("form").serialize(),
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				success:function(obj){
					if(obj=='0'){	
						alert("注册成功！");
						location.href = 'login.jsp';
					}else if(obj=='1'){
						alert("用户名重复注册失败！");
					}
				}
			}
			var account = document.getElementById("account").value;
			var inputPassword = document.getElementById("inputPassword").value;
			var inputPasswordconfirm = document.getElementById("inputPasswordconfirm").value;
			var phonenum = document.getElementById("phonenum").value;
			if(inputPassword == null || inputPassword == "" || account == null || account == "" || inputPasswordconfirm == null || inputPasswordconfirm == ""){
				alert("用户名密码不能为空！");
			}else if(inputPassword != inputPasswordconfirm) {
				alert("两次输入的密码不相同！");
			}else if(phonenum.length != 11 || isNaN(phonenum)){
				alert("手机号码必须为11位数字！");
			}else{
				//alert("注册");
			$('#form').ajaxSubmit(ajax_option);
			}
		});
	});


	
	
</script>
</head>

<body>
	<div id="preloader"></div>
	<div class="container">
		<div id="zhong">
			<div class="" id="login-wrapper">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div id="logo-login">
							<h1>乐豆注册页面</h1>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="account-box">
							<form action=""
								method="post" id="form">

								<div class="row">
									<div class="col-sm-9">
										<label for="inputUsername">用户账号</label>
										<div class="row">
											<div class="col-xs-8 col-sm-12">
												<input type="text" id="account" name="account"
													required="required" class="form-control">
											</div>
											<div class="col-xs-3 col-sm-5">
												<span id="1"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-9">
										<label for="pwd">密码</label> <input type="password"
											required="required" name="password" id="inputPassword"
											class="form-control">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-9">
										<label for="pwd">再次确认密码</label> <input type="password"
											required="required" name="pwdconfirm" id="inputPasswordconfirm"
											class="form-control">
									</div>
								</div>
					
								
								
								<div class="row">
									<div class="col-sm-9">
										<label for="inputUsername">姓名</label>
										<div class="row">
											<div class="col-xs-8 col-sm-12">
												<input type="text" id="name" name="name"
													required="required" class="form-control">
											</div>
											<div class="col-xs-3 col-sm-5">
												<span id="1"></span>
											</div>
										</div>
									</div>
								</div>
								
								
								
								<div class="row">
									<div class="col-sm-9">
										<label for="inputUsername">手机号码</label>
										<div class="row">
											<div class="col-xs-8 col-sm-12">
												<input type="text" id="phonenum" name="phonenumber"
													required="required" class="form-control">
											</div>
											<div class="col-xs-3 col-sm-5">
												<span id="1"></span>
											</div>
										</div>
									</div>
								</div>
								
								
								<%--<button id="start" class="btn btn btn-primary " disabled="disabled" type="submit">登 录
								</button>
								--%><input type= "button" value="注&nbsp;册" class="btn btn btn-primary " id="FunctionButtonInput"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/login.jsp" class="btn btn btn-primary">登&nbsp;录</a>
							</form>
							<a class="forgotLnk" href="index.jsp"></a>
							<div class="row-block">
								<div class="row"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
