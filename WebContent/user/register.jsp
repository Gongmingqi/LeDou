<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<title>游币门户注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/supersized.css">
<link rel="stylesheet" href="../css/style.css">
<script src="../js/jquery-1.7.2.min.js"></script>
<style type="text/css">
#login {
	margin-top: 200px;
}
</style>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function($) {
		$("#userPhone").blur(
						function() {
							$("#msg").html('');
							$.ajax({
										type : "post",
										url : "${pageContext.request.contextPath}/queryPhoneNumber.do",
										data : {
											userPhone : $("#userPhone").val()
										},
										dataType : "json",
										success : function(flag) {
											if (flag == true) {
												$("#msg").html("该手机号码可用");
												$("#msg").css("color","green");
											} else {
												$("#msg").html("该号码非移动号码或已被注册，无法使用该号码");
												$("#msg").css("color", "red");
											}
										}
									});
						});
	});
	$(function($) {
		$("#userName").blur(
						function() {
							$("#msg2").html('');
							$.ajax({
										type : "post",
										url : "${pageContext.request.contextPath}/queryUserName.do",
										data : {
											userName : $("#userName").val()
										},
										dataType : "json",
										success : function(flag) {
											if (flag == true) {
												$("#msg2").html("该用户名可用");
												$("#msg2").css("color","green");
											} else {
												$("#msg2").html("用户名已存在或格式不合法，无法注册");
												$("#msg2").css("color", "red");
											}
										}
									});
						});
	});
	function checkPhone() {  
    var check = false;  
    var ts = document.getElementById("msg").innerHTML;  
    if (ts=="该手机号码可用") {  
        check =true;  
    } else {  
        check = false;  
    }  
    return check;  
	} 
	function checkUserName() {  
    var check = false;  
    var ts = document.getElementById("msg2").innerHTML;  
    if (ts=="该用户名可用") {  
        check =true;  
    } else {  
        check = false;  
    }  
    return check;  
	} 
function check() {  
    var check = checkPhone(); 
    var check2=checkUserName();
    if(check==true&&check2==true){
    	return true;  
    }else{
    	return false;
    }
} 
</script>
</head>

<body oncontextmenu="return false">

	<div id="login" class="page-container">
		<h1>游币门户注册页面</h1>
		<form action="${pageContext.request.contextPath}/registerUser.do" onsubmit="return check()"
			method="post">
			<div>
				<input type="text" name="userName" id="userName" onchange="checkUserName()"  pattern="^[a-zA-Z_][a-zA-Z0-9_]{2,16}$" class="userName" required
					placeholder="请输入用户名(2-16位)" />
			</div>
			<div><span id="msg2"></span></div>
			<div>
				<input type="password" name="userPwd" pattern="^[a-zA-Z0-9]{6,12}$" class="userPwd" required
					placeholder="请输入密码6-12位)" />
			</div>
			<div>
				<input type="text" name="userPhone" onchange="checkPhone()" id="userPhone"  pattern="^1[3|5|7|8][0-9]{9}$" placeholder="请输入手机号码(11位)" required />
			</div>
			<div><span id="msg"></span></div>
			<div>
				<input type="radio" checked name="userSex" value="男" />男 <input type="radio"
					name="userSex" value="女" />女
			</div>
			<div >
				<input type="text" name="userBirthday" id="userBirthday" required readonly="readonly"  placeholder="请选择用户生日" /> <img
					onclick="WdatePicker({el:$dp.$('userBirthday')})"
					src="js/My97DatePicker/skin/datePicker.gif" width="16" height="22" />
			</div>
			<button id="submit" type="submit">确认注册</button>
            <a href="login.jsp"><button type="button" >返回登录</button></a>
		</form>
	</div>
	<div class="alert" style="display:none">
		<h2>消息</h2>
		<div class="alert_con">
			<p id="ts"></p>
			<p style="line-height:70px">
				<a class="btn">确定</a>
			</p>
		</div>
	</div>

	<!-- Javascript -->
	<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"
		type="text/javascript"></script>
	<script src="../js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init2.js"></script>
	
</body>

</html>

