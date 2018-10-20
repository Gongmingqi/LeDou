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

<title>游戏详情</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>游戏详情</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form class="form-horizontal text-center" >
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr>
								<td>游戏id</td>
								<td>
									<div class="col-sm-10">
										${game.id}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏名称</td>
								<td>
									<div class="col-sm-10">
										${game.game_name}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏类型</td>
								<td>
									<div class="col-sm-10">
										${game.gameType.gametype}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏状态</td>
								<td>
									<div class="col-sm-10">
										<c:if test="${game.game_state==1}">商用</c:if>
										<c:if test="${game.game_state==2}">下线</c:if>
									</div></td>
							</tr>
							
							
							<tr >
								<td>游戏详情</td>
								<td>
									<div class="col-sm-10">
										${game.game_intro}
									</div></td>
							</tr>
							
							<tr >
								<td>乐豆价格</td>
								<td>
									<div class="col-sm-10">
										${game.game_bean_price}
									</div></td>
							</tr>
							
							<tr >
								<td>话费价格</td>
								<td>
									<div class="col-sm-10">
										${game.game_call_price}
									</div></td>
							</tr>
							
							<tr >
								<td>游戏图片</td>
								<td>
									<div class="col-sm-10  col-md-offset-4">
										<img class="img-responsive" width="80"
											src="${pageContext.request.contextPath }/upload/${game.gamepic_address}" />
									</div></td>
							</tr>
							
							
							<tr >
								<td>创建时间</td>
								<td>
									<div class="col-sm-10">
										<fmt:formatDate value="${game.createtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
									</div></td>
							</tr>
							
							<tr >
								<td>修改时间</td>
								<td>
									<div class="col-sm-10">
										<c:choose>
											<c:when test="${game.updatetime==null}">
												未曾修改
											</c:when>
										</c:choose>
										<fmt:formatDate value="${game.updatetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class="col-sm-offset-10 col-sm-11">
									<a href="#" class="btn btn-warning" onclick="window.history.back()">返回上一页</a>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>

<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
