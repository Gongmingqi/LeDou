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

<title>余额详情</title>
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
			<div class="col-md-6">
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<caption>余额详情</caption>
						<tbody>
			
							<tr>
								<td><strong>话费余额:</strong>${userDetail.call_balance}</td>
							</tr>
							<tr>
								<td><strong>乐豆余额:</strong>${userDetail.bean_balance}</td>
							</tr>
							
							
						</tbody>
					</table>
					
       				<a class="btn btn-warning" href = "javascript:history.back()">返回上页</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
