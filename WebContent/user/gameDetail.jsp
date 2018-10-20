<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>乐豆游戏详情</title>
<link rel="stylesheet" href="../user/css/bootstrap.min.css">
    <link rel="stylesheet" href="../user/css/index.css"/>
<script src="../user/js/jquery.js"></script>
<script src="../user/js/bootstrap.min.js"></script>
<script type="text/javascript">
function goshop(){
	var gameState=document.getElementById("gameState").value;
	if (gameState=="2") {
		alert("该游戏已经下线，不能下载！");
	} else {

		if(confirm("确认购买并下载吗？")){
  			var userId=document.getElementById("userId").value;
  			var gameName=document.getElementById("gameName").value;
  			var expOprations=document.getElementById("expOprations").value;
  			var callPrice=document.getElementById("callPrice").value;
  			var beanPrice=document.getElementById("beanPrice").value;
  			var costPrice;
  			if(expOprations=="1"){
  				costPrice = callPrice;
  			}else{
  				costPrice = beanPrice;
  			}
  			if(userId==(0)){
  				alert("账号未登录，请先登录账户");
  				if (confirm("确认登录吗？")) {
					window.location.href = "${pageContext.request.contextPath}/login.jsp";
				}
  			}else{
				window.location.href = "${pageContext.request.contextPath}/buyingRecord/userDownGame.action?userId="+userId+"&gameName="+gameName+"&expOprations="+expOprations+"&costPrice="+costPrice;
  			}
  		}
	}
	}

	
</script>

</head>
<body>
	<jsp:include page="portalTop.jsp"></jsp:include>
	<div class="row" style="background-color:#CCC; 
	overflow:hidden;" onLoad="init()">
		<div class="col-md-12">
			<ul class="nav nav-pills col-md-offset-3" >
			<li class=><a href="../user/portal.jsp" class="btn btn-primary">首页</a></li>
	  <c:forEach items="${gameTypeList2}" var="gameType2">
      <li><a href="${pageContext.request.contextPath}/buyingRecord/GameByTypeId.action?typeId=${gameType2.id}" class="btn btn-primary">${gameType2.gametype}</a></li></c:forEach>
      	
				
    </ul>
		</div>
    </div>
    
   
	<div class="row">&nbsp;</div>
	<div class="container">
	<form action="${pageContext.request.contextPath}/userDownGame.do" method="post">
		<div class="row">
			<div class="col-md-4 col-sm-4">
				<img
					src="${pageContext.request.contextPath}/upload/${game.gamepic_address}"
					width="450px;" alt="" />
			</div>
			<div class="col-md-6 col-md-offset-1">
				<p>
					<c:choose>
						<c:when test="${loginUser==null}">
							<input type="hidden" name="userId" id="userId" value="0"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="userId" id="userId" value="${loginUser.id}"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="gameName" id="gameName" value="${game.game_name}"/>
					<input type="hidden" name="callPrice" id="callPrice" value="${game.game_call_price}"/>
					<input type="hidden" name="beanPrice" id="beanPrice" value="${game.game_bean_price}"/>
					<input type="hidden" name="gameState" id="gameState" value="${game.game_state}">
					<strong>游戏名称:</strong>${game.game_name}
				</p>
				<p>
					<strong>游戏类型:</strong>${game.gameType.gametype}
				</p>
				<p>
					<strong>话费价格:</strong>${game.game_call_price}元
				</p>
				<p>
					<strong>乐豆价格:</strong>${game.game_bean_price}(单位:乐豆)
				</p>
				
				<p>
					<strong>游戏简介:</strong>${game.game_intro}
				</p>
				<p>
					<strong>游戏状态:</strong>
					<c:choose>
						<c:when test="${game.game_state==1}">
				商用
				</c:when>
						<c:otherwise>
				下线
				</c:otherwise>
					</c:choose>
				</p>
				<p>
					<strong>最新发布时间:</strong>
					<fmt:formatDate value="${game.updatetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
				</p>
				<p>
					<strong>支付方式:</strong><select id="expOprations" name="expOprations">
						<option value="1" selected="selected">话费支付</option>
						<option value="2">乐豆支付</option>
					</select>
				</p>
				<p>
					<input  type="button" onclick="goshop();" class="btn btn-success" value="确认购买">
					<a class="btn btn-warning" href="../user/portal.jsp">返回首页</a>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">游戏简介</h3>
					</div>
					<div class="panel-body">${game.game_intro}</div>
				</div>
			</div>

		</div>
		<div class="row col-md-12">
				
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/index.js"></script>
<script>
 
   var setting = {
        width:500,
        height:270,
        postWidth:658,
        postHeight:270,
        scale:0.8,
        verticalAlign:"center",
        speed:500
    };  
    $(".carousel").attr("data-setting",'{ "width":900,"height":411,"postWidth":658}');
    Carousel.init($(".carousel"));
</script>
		</div>
</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
