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

<title>消费记录</title>
<link rel="stylesheet" href="../user/css/bootstrap.min.css">
<link rel="stylesheet" href="../user/css/index.css" />
<script src="../user/js/jquery.js"></script>
<script src="../user/js/bootstrap.min.js"></script>


</head>
<body>
	<jsp:include page="portalTop.jsp"></jsp:include>
	<div class="row" style="background-color:#CCC; 
	overflow:hidden;" onLoad="init()">
		<div class="col-md-12">
			<ul class="nav nav-pills col-md-offset-3" >
			<li class=><a href="../user/portal.jsp" class="btn btn-primary">首页</a></li>
	  <%-- <c:forEach items="${gameTypeList2}" var="gameType2">
      <li><a href="${pageContext.request.contextPath}/GameByTypeId.do?typeId=${gameType2.typeId}" class="btn btn-primary">${gameType2.typeName}</a></li></c:forEach> --%>
      	
				
    </ul>
		</div>
    </div>
    
   
	<div class="row">&nbsp;</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<c:choose>
						<c:when test="${buyingRecordList!=null}">
							<table class="table table-striped table-hover">
						<caption>消费</caption>
						<thead>
							<tr>
								<td>ID</td>
								<td>游戏名</td>
								<td>消费金额</td>
								<td>购买方式</td>
								<td>赠送乐豆</td>
								<td>购买时间</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${buyingRecordList}" var="exp">
							<tr>
								<td>${exp.id}</td>
								<td>${exp.game_name}</td>
								<td>${exp.cost_price}</td>
 								<td><c:choose>
 								<c:when test="${exp.buying_way=='1'}">
 									话费购买
 								</c:when>
 								<c:otherwise>
 									乐豆购买
 								</c:otherwise>
 								</c:choose>
 								</td> 
 								<td>${exp.present_bean_num}</td>
								<td><fmt:formatDate value="${exp.buyingtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
						</c:when>
						<c:otherwise>
							该用户尚未购买过游戏
						</c:otherwise>
					</c:choose>
					
					
       				<a class="btn btn-warning" href = "javascript:history.back()">返回上页</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
