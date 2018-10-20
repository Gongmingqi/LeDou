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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
function changImg(e){  
    for (var i = 0; i < e.target.files.length; i++) {  
        var file = e.target.files.item(i);  
        if (!(/^image\/.*$/i.test(file.type))) {  
            continue; //不是图片 就跳出这一次循环  
        }  
        //实例化FileReader API  
        var freader = new FileReader();  
        freader.readAsDataURL(file);  
        freader.onload = function(e) {  
            $("#myImg").attr("src",e.target.result);  
        }  
    }  
}

$(function(){
	$("#FunctionButtonInput").live("click",function(){
		var ajax_option={
			type:"post",
			url:"${pageContext.request.contextPath}/game/updateGame.action",
			//data:$("form").serialize(),
			contentType: "multipart/form-data; charset=utf-8",
			success:function(obj){
				if(obj=='0'){
					alert("游戏修改成功！");
					location.href = '${pageContext.request.contextPath}/game/queryAllGameBySize.action';
				}else if(obj=='1'){
					alert("填写信息有误，修改失败!");
				}
			}
		}
		var callPrice=document.getElementById("gameTariffe").value;
		var beanPrice=document.getElementById("gameCurrency").value;
		if(Number(callPrice)<0 || Number(beanPrice) < 0 ){
			alert("话费价格和乐豆价格不能为负！");
		}else{
		$('#form').ajaxSubmit(ajax_option);
		}
	});
});
 

</script>
</head>
<body>
	<div id="container">
		<div class="page-header ">
			<h2>修改游戏</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-8 col-md-offset-2">
				<form class="form-horizontal text-center"
					action=""
					enctype="multipart/form-data"   method="post" id="form">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr>
								<td >游戏名称</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="hidden" class="col-sm-12" name="gameId"
											value="${game.id}" /> <input type="text"
											class="col-sm-12" name="gameName"  id="gameName"  value="${game.game_name}" />
											<input type="hidden" id="oldGameName"  value="${game.game_name}"/>
							
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏类型</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<select name="gameType" class="col-sm-12">
											<c:forEach var="gameType" items="${gameTypeList}">
												<c:choose>
													<c:when test="${gameType.id==game.gametype_id}">
														<option selected="selected" value="${gameType.id}">${gameType.gametype}</option>
													</c:when>
													<c:otherwise>
														<option value="${gameType.id}">${gameType.gametype}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</select>
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏状态</td>
								<td>
									<div class="col-sm-6 col-md-offset-1">
										<c:choose>
											<c:when test="${game.game_state==1}">
												<label> <input type="radio" name="gameStatus"
													value="1" checked="checked"> 商用 </label>
												<label> <input type="radio" name="gameStatus"
													value="2"> 下线</label>
											</c:when>
											<c:when test="${game.game_state==2}">
												<label> <input type="radio" name="gameStatus"
													value="1"> 商用 </label>
												<label> <input type="radio" name="gameStatus"
													checked="checked" value="2"> 下线</label>
											</c:when>
										</c:choose>
									</div>
								</td>
							</tr>


							<tr>
								<td>游戏详情</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<textarea name="gameDetail" class="form-control" rows="3">${game.game_intro}</textarea>
									</div>
								</td>
							</tr>

							<tr>
								<td>乐豆价格</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="gameCurrency" id="gameCurrency"
											value="${game.game_bean_price}" />
									</div>
								</td>
							</tr>

							<tr>
								<td>话费价格</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="gameTariffe" id="gameTariffe"
											value="${game.game_call_price}" />
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏图片</td>
								<td>
									<div class="col-sm-6  col-md-offset-3">
										<div class="thumbnail">
											<img style='max-width:68px;width:68px;width:expression(width>68?"68px":width "px");max-width: 68px;' 
									src="${pageContext.request.contextPath}/upload/${game.gamepic_address}" id="myImg">
										</div>
										<div class="caption">
											<p>
												<input type="file" name="img" id="gameCover1" onchange="changImg(event)" value="${game.gamepic_address}" />
												<input type="hidden" id="gamepicaddress" name="imgaddress"  value="${game.gamepic_address}"/>
											</p>
										</div>

									</div>
								</td>
							</tr>

							
							<tr>
								<td>创建时间</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										
										<fmt:formatDate value="${game.createtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
									</div>
								</td>
							</tr>

							<tr>
								<td>修改时间</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<c:choose>
											<c:when test="${game.updatetime==null}">
												未曾修改
											</c:when>
										</c:choose>
										<fmt:formatDate value="${game.updatetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-10">
							<div class="form-group">
								<div class="col-xs-6 col-sm-4 col-md-offset-3">
									<input class="btn btn-info" type="button" value="提交修改" id="FunctionButtonInput"/>
								</div>
								<div class="col-xs-6 col-sm-4">
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
