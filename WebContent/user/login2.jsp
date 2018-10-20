<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>游币门户网站</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="../css/reset.css">
        <link rel="stylesheet" href="../css/supersized.css">
        <link rel="stylesheet" href="../css/style.css">
	<style type="text/css">
		#login{
			margin-top:200px;
		}
	</style>

    </head>

    <body oncontextmenu="return false">

        <div id="login" class="page-container">
            <h1>游币门户登录页面</h1>
            <form action="${pageContext.request.contextPath}/loginUser.do" method="post">
				<div>
					<input type="text" name="userName" class="userName" placeholder="请输入用户名" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="userPwd" class="userPwd" placeholder="请输入密码" oncontextmenu="return false" />
                </div>
                <button id="submit" type="submit">确认登录</button>
                <a href="register.jsp"><button type="button" >注册用户</button></a>
            </form>
            <div class="connect">
                <p>游币门户是一个可供用户下载游戏的网站</p>
				<p style="margin-top:20px;">${msg3}</p>
            </div>
        </div>
		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div>

        <!-- Javascript -->
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="../js/supersized.3.2.7.min.js"></script>
        <script src="../js/supersized-init.js"></script>
		<script>
		$(".btn").click(function(){
			is_hide();
		});
		var u = $("input[name=userName]");
		var p = $("input[name=userPwd]");
		$("#submit").live('click',function(){
			if(u.val() == '' || p.val() =='')
			{
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			}
			else{
				var reg = /^[0-9A-Za-z]+$/;
				if(!reg.exec(u.val()))
				{
					$("#ts").html("用户名错误");
					is_show();
					return false;
				}
			}
		});
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		};
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300); };
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300); };
		</script>
    </body>

</html>

