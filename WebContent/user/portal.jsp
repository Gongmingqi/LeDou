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

<title>游币门户网站</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>
<style type="text/css">
*{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
.content{width:260px;margin:100px auto;}
.filterinput{
	background-color:rgba(249, 244, 244, 0);
	border-radius:15px;
	width:90%;
	height:30px;
	border:thin solid #FFF;
	text-indent:0.5em;
	font-weight:bold;
	color:#FFF;
}
#demo-list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
}
</style>
<style type="text/css">

* {
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
}

.out {
	width: 350px;
	height: 245px;
	margin: 25px auto;
	position: relative;
}

.img li {
	position: absolute;
	top: 0px;
	left: 0px;
	display: none
}

.out .num {
	position: absolute;
	bottom: 0px;
	left: 0px;
	font-size: 0px;
	text-align: center;
	width: 100%;
}

.num li {
	width: 20px;
	height: 20px;
	background: #666666;
	color: #FFFFFF;
	text-align: center;
	line-height: 20px;
	display: inline-block;
	font-size: 16px;
	border-radius: 50%;
	margin-right: 10px;
	cursor: pointer;
}

.out .btn {
	position: absolute;
	top: 52%;
	margin-top: -30px;
	width: 45px;
	height: 60px;
	background: rgba(0, 0, 0, 0.5);
	color: #FFFFFF;
	text-align: center;
	line-height: 60px;
	font-size: 40px;
	display: none;
	cursor: pointer;
}

.out .num li.active-1 {
	background: #AA0000;
	margin-left:150px;
}

.out:hover .btn {
	display: block
}

.out .left {
	left: 0px;
}

.out .right {
	right: -150px;
}
#leftNav{
	margin-left:87px;
}
</style>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/jquery-accordion-menu.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function () {
	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
});

$(function(){	
	//顶部导航切换
	$("#demo-list li").click(function(){
		$("#demo-list li.active").removeClass("active");
		$(this).addClass("active");
	});	
})	;
$(".classname img").addClass("carousel-inner img-responsive img-rounded");


</script>
</head>
<body>
	<jsp:include page="portalTop.jsp"></jsp:include>
	<div class="row" style="background-color:#CCC; 
	overflow:hidden;" onLoad="init()">
		<div class="col-md-12">
			<ul class="nav nav-pills col-md-offset-3" >
			<li class=><a href="portal.jsp" class="btn btn-primary">首页</a></li>
	  <c:forEach items="${gameTypeList2}" var="gameType2">
      <li><a href="${pageContext.request.contextPath}/buyingRecord/GameByTypeId.action?typeId=${gameType2.id}" class="btn btn-primary">${gameType2.gametype}</a></li></c:forEach>
      	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		
				
    </ul>
		</div>
    </div>
    
    
	<div id="nail1" class="container">
		
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div  class="row">
			<div class="col-md-12 ">
				<div id="leftNav" class="col-md-2">
				<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
		<div class="jquery-accordion-menu-header" id="form"></div>
		<ul id="demo-list">
			<c:forEach items="${gameTypeList2}" var="gameType2">
      		<li><a href="${pageContext.request.contextPath}/buyingRecord/GameByTypeId.action?typeId=${gameType2.id}"><img width="50px" src="${pageContext.request.contextPath}/images/cover/1430727532556.jpg"/>${gameType2.gametype}</a></li>
      </c:forEach>
      		<c:choose>
      			<c:when test="${gameTypeList3Size!=0}">
      			<li><a href="#"><i class="fa fa-suitcase"></i>更多类型 </a>
				<ul class="submenu">
					 <c:forEach items="${gameTypeList3}" var="gameType3">
          				<li><a href="${pageContext.request.contextPath}/GameByTypeId.do?typeId=${gameType3.typeId}"><img width="50px" src="${pageContext.request.contextPath}/images/cover/${gameType3.typePicture}"/>${gameType3.typeName}</a></li>
          			</c:forEach>
				</ul>
			</li>
      			</c:when>
      		</c:choose>
			
		</ul>
		
		<div class="jquery-accordion-menu-footer">
			Footer
		</div>
	</div>
				</div>
				<div id="nail2" class="col-md-8 col-md-offset-1">
						<div class="row"><div class="col-md-6"><h2>&nbsp;&nbsp;${msg2}</h2></div></div>
						<c:choose>
						<c:when test="${gameList2!=null}">
							<c:forEach items="${gameList2}" var="game">
						<div class="col-md-4 col-sm-6 "><div class="thumbnail">
								<img src="${pageContext.request.contextPath}/upload/${game.gamepic_address}" width="150" height="150px" alt="${game.game_intro}">
								<div class="caption"><h3>${game.game_name}</h3>
									<p><a href="${pageContext.request.contextPath}/buyingRecord/queryGameDetailByGameId.action?gameId=${game.id}" class="btn btn-primary">游戏详情</a></p>
								</div>
							</div>
						</div>
					</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="col-md-4 col-sm-6 ">该游戏类型下没有提供可下载游戏</div>
						</c:otherwise>
						</c:choose>
					
				</div>

			</div>
		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
(function($) {
$.expr[":"].Contains = function(a, i, m) {
	return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};
function filterList(header, list) {
	//@header 头部元素
	//@list 无需列表
	//创建一个搜素表单
	var form = $("<form>").attr({
		"class":"filterform",
		action:"#"
	}), input = $("<input>").attr({
		"class":"filterinput",
		type:"text"
	});
	$(form).append(input).appendTo(header);
	$(input).change(function() {
		var filter = $(this).val();
		if (filter) {
			$matches = $(list).find("a:Contains(" + filter + ")").parent();
			$("li", list).not($matches).slideUp();
			$matches.slideDown();
		} else {
			$(list).find("li").slideDown();
		}
		return false;
	}).keyup(function() {
		$(this).change();
	});
}
$(function() {
	filterList($("#form"), $("#demo-list"));
});
})(jQuery);	
</script>

</body>

</html>
