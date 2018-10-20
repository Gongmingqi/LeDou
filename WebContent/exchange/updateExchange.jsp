<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>修改游戏类型</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>修改对应省份乐豆兑换比例</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form class="form-horizontal" action="${pageContext.request.contextPath}/exchange/updateExchange.action" method="post">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr class="text-center">
								<td>省份名</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											
											<input type="text" disabled="disabled" value="${exchange.province}"/>
											<input type="hidden" name="exchangeProvId" value="${exchange.id}"/>
										</div>
									</div>
								</td>
							</tr>
							
							<tr class="text-center">
								<td>兑换比例</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											<input type="text" name="exchangeCharge"  id="exchangeCharge" value="${exchange.cost_rate}"  required oninvalid="setCustomValidity('必须填写消费金额(数字类型)！');" />
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-7">
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<input type="submit" class="btn btn-primary" value="确认修改" />
								</div>
							</div>
						</div>
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class=" col-sm-11">
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
