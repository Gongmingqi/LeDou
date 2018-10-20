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


<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../game_type/js/jquery.js"></script>
<script src="../game_type/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../game_type/js/jquery.js"></script>
<script type="text/javascript" src="../game_type/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../game_type/js/jquery.form.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#FunctionButtonInput").live("click",function(){
		var ajax_option={
			type:"post",
			url:"${pageContext.request.contextPath}/gametype/updateGameTypeData.action",
			//data:$("form").serialize(),
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success:function(obj){
				if(obj=='0'){
					
					alert("修改成功！");
					location.href='${pageContext.request.contextPath}/gametype/queryGameTypeAllBySize.action';
				}else if(obj=='1'){
					alert("存在未下线的该类型游戏，修改失败！");
				}else if(obj=='2'){
					alert("该类型名字已存在，修改失败！");
				}
			}
		}
		$('#form').ajaxSubmit(ajax_option);
	});
});



</script>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>修改游戏类型</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form id="form" class="form-horizontal" action=""  method="post">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr class="text-center">
								<td>类型名称</td>
								<td>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="typeName"
											name="typeName"  value="${gameType.gametype}"> <input
											type="hidden" name="id" value="${gameType.id}" />
											<input type="hidden" id="oldTypeName" value="${gameType.gametype}"/>
											
									</div></td>
							</tr>
							<tr class="text-center">
								<td>状态</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											<c:choose>
												<c:when test="${gameType.type_state==1}">
													<label> <input type="radio" name="typeStatus"
														value="1" checked="checked"> 商用 </label>
													<label> <input type="radio" name="typeStatus"
														value="2"> 下线</label>
												</c:when>
												<c:when test="${gameType.type_state==2}">
													<label> <input type="radio" name="typeStatus"
														value="1"> 商用 </label>
													<label> <input type="radio" name="typeStatus"
														checked="checked" value="2"> 下线</label>
												</c:when>
											</c:choose>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-7">
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<input type="button" class="btn btn-primary" value="确认修改" id="FunctionButtonInput" />
								</div>
							</div>
						</div>
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class=" col-sm-11">
									<!-- <button class="btn btn-warning" onClick="javascript :window.history.back(-1);">返回上一页</button> -->
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
</html>
