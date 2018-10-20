<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Bootstrap后台管理系统</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
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

	$(function(){
		$("#FunctionButtonInput").live("click",function(){
			var ajax_option={
				type:"post",
				url:"${pageContext.request.contextPath}/gametype/addGameType.action",
				//data:$("form").serialize(),
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				success:function(obj){
					if(obj=='0'){
						
						alert("添加成功");
						location.href='${pageContext.request.contextPath}/gametype/queryGameTypeAllBySize.action';
					}else if(obj=='1'){
						alert("类型名字重复，添加失败");
					}
				},
				  error:function(){
						alert("类型名字重复，添加失败");
					  }
			}
			var str = document.getElementById("typeName").value;
			var len = 0;
			for (var i = 0; i < str.length; i++) {
				if(str.charCodeAt(i)>127 || str.charCodeAt(i)==94){
					len +=2;
				}else{
					len++;
				}
			}
			if(len > 10){
				alert("类型名长度不能超过5个中文字符或10个英文字符！");
			}else{
				
			$('#form').ajaxSubmit(ajax_option);
			}
		});
	});



	

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
	function del() {
		var x=0;
		var cb=document.getElementsByName("opt");
		for(var i = 0 ;i<cb.length;i++) {
			if(cb[i].checked==true) {
				x=1; 
				break;
			}
		}
		if(x!=1){
			alert("未选中需要删除的游戏类型,请选中后再点击删除");
		}else{
			if (confirm("确认删除吗？")) {
				obj = document.getElementsByName("opt");
				check_val = [];
				for (k in obj) {
					if (obj[k].checked)
						check_val.push(obj[k].value);
				}
				window.location.href = "${pageContext.request.contextPath}/delGameType.do?ids="+check_val;
			}
		}
		
	}
	
	

	
	
</script>
</head>
<body>
	<div id="container" class="col-sm-12">
		<div class="page-header">
			<h2>游戏类型</h2>
		</div>
		<form action="${pageContext.request.contextPath}/gametype/queryConditionGameType.action" method="post">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">类型名称</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" name="searchTypeName" id="searchTypeName" class="form-control" />
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-2">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">状态</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<select name="searchTypeStatus"  id="searchTypeStatus" class="form-control">
								<option value="1">商用</option>
								<option value="2">下线</option>
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
								<h4 class="modal-title" id="myModalLabel">新增游戏类型</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" action="" 
								enctype="application/x-www-form-urlencoded" method="post"   id="form">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">类型名称</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="typeName" 
												name="typeName" required="required" placeholder="请输入类型名称"/><span id="msg"></span>
										</div>
									</div>
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">状态</label>
										<div class="col-sm-10">
											<div class="radio">
												<label> <input type="radio" name="typeStatus"
													value="1" checked/> 商用 </label> <label> <input
													type="radio" name="typeStatus" value="2"/> 下线</label>
											</div>
										</div>
									</div>

									<!-- <div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">类型图片</label>
										<div class="col-sm-10">
											<input type="file" name="typePicture" id="typePicture" required />
										</div>
									</div> -->
									
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="button" class="btn btn-default" id="FunctionButtonInput">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
				<div class="table-responsive " style="vertical-align: middle;text-align: center;">
					<table id="searchTable" class="table table-bordered table-condensed ">
						<tr>
							<td><input  type="checkbox" id="all" value="全选" onclick="checkall()"/> 全选</td>
							<td>ID</td>
							<td>类型名称</td>
							<td>状态</td>
							<td>创建时间</td>
							<td>更新时间</td>
							<td>操作</td>
						</tr>
						<c:forEach var="gameType" items="${gameTypeList}">
							<tr>
								<td><input type='checkbox' onclick="checkChecked()" name='opt' value='${gameType.id}' /></td>
								<td>${gameType.id}</td>
								<td>${gameType.gametype}</td>
								<td>
									<c:choose>
										<c:when test="${gameType.type_state==1}">   
   											 商用 
 										</c:when>
										<c:when test="${gameType.type_state==2}">   
   											 下线  
  										</c:when>
									</c:choose>
								</td>
								
								<td><fmt:formatDate value="${gameType.createtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/></td>
								<td><fmt:formatDate value="${gameType.updatetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/></td>
								<td><a class="btn btn-info" href="${pageContext.request.contextPath}/gametype/updateGameType.action?id=${gameType.id}"> <span class="glyphicon glyphicon-pencil"></span>修改</a></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="8">
								<div class="col-xs-6 col-sm-11">${pagingButton}</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
td{
	vertical-align: middle !important;
}
</style>
</html>
