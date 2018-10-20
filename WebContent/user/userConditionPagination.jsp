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

<title>用户管理</title>


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}

#TableTail {
	border-bottom: 2px solid #A4CDEC;
	border-top: 2px solid #A4CDEC;
	height: 34px;
	width: 100%;
	padding-top: 4px;
	background-color: #FFFFFF;
	background-repeat: repeat-x;
}

.FunctionButton{
	background-image:url(img/button_bg.png);
	background-repeat: repeat-x;
	float: left;
	height: 23px;
	font-size: 12px;
	border: 1px solid #84A5C6;
	margin: 0;
	margin-left: 8px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top:3px;
}

#disabled{
    color:gray;
    cursor:pointer;
    pointer-events: none;

}
</style>
<script type="text/javascript">
	/* $(function(){
	$("#search").click(function(){
			$("#searchTable").html("");
			$.ajax({
				url: "${pageContext.request.contextPath}/queryConditionUser.do",
				  cache: false,
				  type: "Post",
				  data: {
				  	searchUserName:$("#searchUserName").val(),
				  	searchUserPhone:$("#searchUserPhone").val()
				  },
				  dataType:"json",
				  success:function(searchUserList){
					  $("#searchTable").append("<tr><td><input type='checkbox' id='all' value='全选' onclick='checkall()' /> 全选</td><td>ID</td><td>用户名</td><td>手机账号</td><td>状态</td><td>创建时间</td></tr>");
					  for(var i=0;i<searchUserList.length;i++){
					  	if(searchUserList[i].userStatus==1){
					  	 $("#searchTable").append($("<tr><td>"+"<input type='checkbox' name='opt' value='"+searchUserList[i].userId+"'></td><td>"+searchUserList[i].userId+"</td><td>"+searchUserList[i].userName+"</td><td>"+searchUserList[i].userPhone+"</td><td>正常"+"</td><td>"+searchUserList[i].userCreateTime+"</td></tr>"));	 
					  	}else{
					  	
					  	 $("#searchTable").append($("<tr><td>"+"<input type='checkbox' name='opt' value='"+searchUserList[i].userId+"'></td><td>"+searchUserList[i].userId+"</td><td>"+searchUserList[i].userName+"</td><td>"+searchUserList[i].userPhone+"</td><td>离开"+"</td><td>"+searchUserList[i].userCreateTime+"</td></tr>"));	 }
						 }
					  },
				  error:function(){
							alert("没有符合该类型名称或类型状态的数据,请重新输入查询条件");
						  }
				});
		});

	}); */

	function openUser() {
		var x=0;//用于判断用户是否选中
		var status=1;
		var cb=document.getElementsByName("opt");
		for(var i = 0 ;i<cb.length;i++) {
			if(cb[i].checked==true) {
				x=1; 
				break;
			}
		}
		if(x!=1){
			alert("未选中需要恢复使用的用户,请选中后再点击恢复使用");
		}else{
			if (confirm("确认恢复选中用户吗？")) {
				obj = document.getElementsByName("opt");
				check_val = [];
				for (k in obj) {
					if (obj[k].checked)
						check_val.push(obj[k].value);
				}
				window.location.href = "${pageContext.request.contextPath}/user/recoverUser.action?ids="+check_val;
			}
		}
	}

	function closeUser() {
		var x=0;//用于判断用户是否选中
		var status=2;
		var cb=document.getElementsByName("opt");
		for(var i = 0 ;i<cb.length;i++) {
			if(cb[i].checked==true) {
				x=1; 
				break;
			}
		}
		if(x!=1){
			alert("未选中需要禁止的用户,请选中后再点击禁用");
		}else{
			if (confirm("确认禁止用户吗？")) {
				obj = document.getElementsByName("opt");
				check_val = [];
				for (k in obj) {
					if (obj[k].checked)
						check_val.push(obj[k].value);
				}
				window.location.href = "${pageContext.request.contextPath}/user/pauseUser.action?ids="+check_val;
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

	
</script>
</head>
<body>
	<div id="container"  >
		<div class="page-header">
			<h2>用户列表</h2>
		</div>
		<form action="${pageContext.request.contextPath}/user/queryConditionUser.action" method="post">
			<div class="row">
				<div class="col-xs-6 col-sm-2">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<span class="btn btn-default">账号</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" name="searchUserAccount" id="searchUserAccount"
								class="form-control" />
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">姓名</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" name="searchUserName" id="searchUserName"
								class="form-control" />
						</div>
					</div>
				</div>
				
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">手机号码</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" name="searchUserPhone" id="searchUserPhone"
								class="form-control" />
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
				<a class="btn btn-success" onclick='openUser();'> <span class="glyphicon glyphicon-ok-sign"></span>
					恢复使用</a>
				
				<a class="btn btn-danger" onclick='closeUser();'> <span
					class="glyphicon glyphicon-trash"></span> 禁止使用</a>
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
							<td>用户账号</td>
							<td>姓名</td>
							<td>手机号码</td>
							<td>状态</td>
							<td>创建时间</td>
						</tr>
						<c:forEach var="user" items="${userList}">
							<tr>
								<td><input type='checkbox' onclick="checkChecked()"
									name='opt' value='${user.id}' />
								</td>
								<td>${user.id}</td>
								<td>${user.account}</td>
								<td>${user.name}</td>
								<td>${user.phonenumber}</td>
								<td><c:choose>
										<c:when test="${user.userstate==0}">   
   											 正常
 										</c:when>
										<c:when test="${user.userstate==1}">   
   											 暂停使用 
  										</c:when>
									</c:choose></td>
								
								<td>
								<fmt:formatDate value="${user.createtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
								</td>
							</tr>
						</c:forEach>
						
					</table>
				</div>
					<div id="TableTail" align="center">
			
			<div class="FunctionButton" style="margin-left:450px;" >
				<a href="${pageContext.request.contextPath}/user/userConditionPagination.action?currentPage=1" >首页</a>
			</div>
			<div class="FunctionButton" style="margin-left:10px;" >
				<a id="${user_pb.currentPage==1?'disabled':''}" href="${pageContext.request.contextPath}/user/userConditionPagination.action?currentPage=${user_pb.currentPage==1?user_pb.currentPage:user_pb.currentPage-1}" >上一页</a>
			</div>
			<div class="FunctionButton" style="margin-left:10px;" >
				<a id="${user_pb.currentPage==user_pb.allPages?'disabled':''}" href="${pageContext.request.contextPath}/user/userConditionPagination.action?currentPage=${user_pb.currentPage==user_pb.allPages?user_pb.currentPage:user_pb.currentPage+1}" >下一页</a>
			</div>
			<div class="FunctionButton" style="margin-left:10px;" >
				<a href="${pageContext.request.contextPath}/user/userConditionPagination.action?currentPage=${user_pb.allPages}" >末页</a>
			</div>
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
