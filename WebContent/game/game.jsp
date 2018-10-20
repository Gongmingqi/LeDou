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

<title>游戏列表</title>


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
			url:"${pageContext.request.contextPath}/game/addGame.action",
			//data:$("form").serialize(),
			contentType: "multipart/form-data; charset=utf-8",
			success:function(obj){
				if(obj=='0'){
					alert("游戏添加成功！");
					location.href = '${pageContext.request.contextPath}/game/queryAllGameBySize.action';
				}else if(obj=='1'){
					alert("填写的信息有误，添加失败!");
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



	function del() {
		var x=0;//用于判断删除游戏是否选中
		var cb=document.getElementsByName("opt");
		for(var i = 0 ;i<cb.length;i++) {
			if(cb[i].checked==true) {
				x=1; 
				break;
			}
		}
		if(x!=1){
			alert("未选中需要删除的游戏,请选中后再点击删除");
		}else{
			if (confirm("确认删除吗？")) {
				obj = document.getElementsByName("opt");
				check_val = [];
				for (k in obj) {
					if (obj[k].checked)
						check_val.push(obj[k].value);
				}
				window.location.href = "${pageContext.request.contextPath}/delGame.do?ids="+check_val;
			}
		}
	}
	
	function checkall(){
		//获取所有的子项
		var cb=document.getElementsByName("opt");
		for(var i=0;i<cb.length;i++){
			//子项的选中状态和全选的选中状态一样
			cb[i].checked=document.getElementById("all").checked;
		}
	}
	
	//判断每个子项是否选中
	function checkAllChecked(){
		var cb=document.getElementsByName("opt");
		for(var i = 0 ;i<cb.length;i++) {
			if(cb[i].checked==false) {
				return false ; 
			}
		}
		return true ;
	}
	window.onload=function(){
		var cb=document.getElementsByName("opt");
		for(var i = 0 ;i<cb.length;i++) {
			//绑定事件
			cb[i].onclick =function(){
				document.getElementById("all").checked =checkAllChecked();
			};
		};
	};

	
function checkName() {  
    var check = false;  
    var ts = document.getElementById("msg").innerHTML;  
    if (ts=="√,该游戏名可用") {  
        check =true;  
    } else {  
        check = false;  
    }  
    return check;  
}  
function check() {  
    var check = checkName();  
    return check;  
} 
	
	
</script>
</head>
<body>
	<div id="container">
		<div class="page-header">
			<h2>游戏列表</h2>
		</div>
		<form action="${pageContext.request.contextPath}/game/queryConditionGame.action" method="post">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">游戏名称</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" name="searchGameName" id="searchGameName"
								class="form-control" />
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-2">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<span class="btn btn-default">游戏类型</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<select name="searchGameType" id="searchGameType" class="form-control">
								<option value=""></option>
								<c:forEach  items="${gameTypeList}" var="gameType">
								<option value="${gameType.id}">${gameType.gametype}</option>
								</c:forEach>
							</select>
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-4">
					<input type="submit" class="btn btn-primary" id="search" value="查询" />
				</div>
			</div>
		</form>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a class="btn btn-primary" data-toggle="modal"
					data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span>
					新增</a>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">新增游戏</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal"
									action=""  enctype="multipart/form-data" method="post" id="form">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">游戏名称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="gameName"
												name="gameName"    required oninvalid="setCustomValidity('请输入添加的游戏名称！');"  placeholder="请输入游戏名称">
											<span id="msg"></span>
										</div>
									</div>
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏状态</label>
										<div class="col-sm-10">
											<div class="radio">
												<label> <input type="radio" name="gameStatus"
													value="1" checked> 商用 </label> <label> <input
													type="radio" name="gameStatus" value="2"> 下线</label>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏类型</label>
										<div class="col-sm-4">
											<div class="radio">
												<select name="gameType"
													id="gameType" class="form-control">
												<c:forEach items="${gameTypeList}" var="gameType">
													<option value="${gameType.id}">${gameType.gametype}</option>
												</c:forEach>
												 </select>
											</div>
										</div>
									</div>

									
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏详情</label>
										<div class="col-sm-5">
											<div class="radio">
												<textarea name="gameDetail"   class="form-control" rows="3"></textarea>
											</div>
										</div>
									</div>
									
									
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">游戏图片</label>
										<div class="col-sm-5">
											<div class="file">
												<input type="file" name="img" id="gameCover1" onchange="changImg(event)" value="" />	<br/>
												<img style='max-width:68px;width:68px;width:expression(width>68?"68px":width "px");max-width: 68px;' 
									src="" id="myImg">
											</div>
										</div>
									</div>
									
									
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label" >话费价格</label>
										<div class="col-sm-5">
											<div class="input">
												<input type="text" name="gameTariffe" id="gameTariffe" required oninvalid="setCustomValidity('必须填写该游戏话费价格(数字类型)！'); "/>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">乐豆价格</label>
										<div class="col-sm-5">
											<div class="input">
												<input type="text" name="gameCurrency" id="gameCurrency" required oninvalid="setCustomValidity('必须填写该游戏游币价格(数字类型)！');" />
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<input type="button" class="btn btn-default" value="添加游戏" id="FunctionButtonInput"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-default" data-dismiss="modal"
									aria-hidden="true">取消</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>


				<!-- <a class="btn btn-danger" onclick='del();'> <span
					class="glyphicon glyphicon-trash"></span> 删除</a> -->
			</div>
		</div>

		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-11">
				<div class="table-responsive"
					style="vertical-align: middle;text-align: center;">
					<table id="searchTable"
						class="table table-bordered table-hover table-condensed  ">
						<tr>
							<td><input type="checkbox" id="all" value="全选"
								onclick="checkall()" /> 全选</td>
							<td>ID</td>
							<td>游戏名称</td>
							<td>游戏类别</td>
							<td>游戏图片</td>
							<td>状态</td>
							<td>乐豆价格</td>
							<td>话费价格</td>
							<td>创建时间</td>
							<td>更新时间</td>
							<td>操作</td>
						</tr>
						<c:forEach var="game" items="${gameList}">
							<tr>
								<td><input type='checkbox' onclick="checkChecked()"
									name='opt' value='${game.id}' />
								</td>
								<td>${game.id}</td>
								<td>${game.game_name}</td>
								<td>${game.gameType.gametype}</td>
								<td>
									<div class="col-xs-6  col-md-offset-4">
										<img class="img-responsive" width="33" height="30"
											src="${pageContext.request.contextPath}/upload/${game.gamepic_address}" />
									</div></td>
								<td><c:choose>
										<c:when test="${game.game_state==1}">   
   											 商用 
 										</c:when>
										<c:when test="${game.game_state==2}">   
   											 下线  
  										</c:when>
									</c:choose></td>
								<td>${game.game_bean_price}</td>
								<td>${game.game_call_price}</td>
								<td>
								
								<fmt:formatDate value="${game.createtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
								</td>
								<td><c:choose>
										<c:when test="${game.updatetime==null}">
									未曾修改
								</c:when>
										<c:otherwise>
											<fmt:formatDate value="${game.updatetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
										</c:otherwise>
									</c:choose></td>
								<td>
									<div class="col-xs-6 col-sm-2 col-md-offset-3">
										<a class="btn btn-info btn-sm"
											href="${pageContext.request.contextPath}/game/queryGameById.action?id=${game.id}+&function=update">
											<span class="glyphicon glyphicon-pencil"></span>修改</a>
									</div>
									<div class="col-xs-6 col-sm-4 col-md-offset-1">
										<a class="btn btn-warning btn-sm"
											href="${pageContext.request.contextPath}/game/queryGameById.action?id=${game.id}+&function=details">
											<span class="glyphicon glyphicon-pencil"></span>详情</a>
									</div></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="12">
								<div class="col-xs-6 col-sm-11">${pagingButton}</div></td>
						</tr>
					</table>
				</div>
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
