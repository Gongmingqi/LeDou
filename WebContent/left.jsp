
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ä¸è¿°3ä¸ªmetaæ ç­¾*å¿é¡»*æ¾å¨æåé¢ï¼ä»»ä½å¶ä»åå®¹é½*å¿é¡»*è·éå¶åï¼ -->
    <meta name="description" content="">
    <meta name="author" content="">
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  </head>
  <body>
   	<div class="lefter">
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"><div class="panel panel-default">
    			<div class="panel-heading"  >
      				<h4 class="panel-title">
      					<a href="#" ><span class="glyphicon glyphicon-th-large" ></span> 菜单列表</a>
      				</h4>
    			</div>
    			
 		 	</div>
  			<div class="panel panel-default">
    			<div class="panel-heading"  >
      				<h4 class="panel-title">
      					<a href="${pageContext.request.contextPath}/user/queryAllUserBySize.action" target="right"><span class="glyphicon glyphicon-user" ></span> 用户管理</a>
      				</h4>
    			</div>
    			
 		 	</div>
  <div class="panel panel-default">
    <div class="panel-heading"  >
      <h4 class="panel-title">
      	<a href="${pageContext.request.contextPath}/gametype/queryGameTypeAllBySize.action" target="right"><span class="glyphicon glyphicon-th"></span> 游戏类型</a>
      </h4>
    </div>
   
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
      	<a href="${pageContext.request.contextPath}/game/queryAllGameBySize.action" target="right"><span class="glyphicon  glyphicon-list"></span> 游戏列表</a>
      </h4>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading"  >
      <h4 class="panel-title">
      	<a href="${pageContext.request.contextPath}/exchange/queryAllExchangeBySize.action" target="right"><span class="glyphicon glyphicon-transfer"></span>乐豆换算比例</a>
      </h4>
    </div>
   
  </div>
  
  
   <%--<div class="panel panel-default">
    <div class="panel-heading"  >
      <h4 class="panel-title">
      	<a href="${pageContext.request.contextPath}/queryAllCardBySize.do" target="right"><span class="glyphicon glyphicon-barcode"></span>å¯ä¿å¡ç®¡ç</a>
      </h4>
    </div>
   
  </div>
  
  
  
  --%><div style="display:none" class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" aria-controls="collapseThree">
          <span class=""></span> é¢ç
        </a>
      </h4>
    </div>
    <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
      <ul class="nav nav-sidebar"> 
            <li ><a href="${pageContext.request.contextPath}/right1.jsp" target="right">æéç®¡ç</a></li>
            <li ><a href="${pageContext.request.contextPath}/right1.jsp" target="right">ç»å½æ¥å¿</a></li>
            <li ><a href="${pageContext.request.contextPath}/right1.jsp" target="right">æä½æ¥å¿</a></li>
          </ul>
      </div>
    </div>
  </div>
</div>
	</div>
	<script>
   $(function(){
      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // è·åå·²æ¿æ´»çæ ç­¾é¡µçåç§°
      var activeTab = $(e.target).text(); 
      // è·ååä¸ä¸ªæ¿æ´»çæ ç­¾é¡µçåç§°
      var previousTab = $(e.relatedTarget).text(); 
      $(".active-tab span").html(activeTab);
      $(".previous-tab span").html(previousTab);
   });});</script>
  </body>
</html>
