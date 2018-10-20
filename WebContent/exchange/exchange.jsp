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
<title>游币比例管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
$(function(){
	$("#FunctionButtonInput").live("click",function(){
		var ajax_option={
			type:"post",
			url:"${pageContext.request.contextPath}/exchange/addExchange.action",
			//data:$("form").serialize(),
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success:function(obj){
				if(obj=='0'){
					alert("添加成功！");
					location.href = '${pageContext.request.contextPath}/exchange/queryAllExchangeBySize.action';
				}else if(obj=='1'){
					alert("已有该省份数据，添加失败!");
				}
			}
		}
		$('#form').ajaxSubmit(ajax_option);
	});
});


/* $(function(){
	$("#FunctionButtonInput").live("click",function(){
		var ajax_option={
			type:"post",
			url:"${pageContext.request.contextPath}/game/addGame.action",
			//data:$("form").serialize(),
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success:function(obj){
				if(obj=='0'){
					alert("游戏添加成功！");
					location.href = '${pageContext.request.contextPath}/game/queryAllGameBySize.action';
				}else if(obj=='1'){
					alert("填写的信息有误，添加失败!");
				}
			}
		}
		$('#form').ajaxSubmit(ajax_option);
	});
}); */




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
			alert("未选中需要删除的省份兑换规则,请选中后再点击删除");
		}else{
			if (confirm("确认删除吗？")) {
				obj = document.getElementsByName("opt");
				check_val = [];
				for (k in obj) {
					if (obj[k].checked)
						check_val.push(obj[k].value);
				}
				//alert("666");
				$.ajax(
						
						{
							 type: "POST",
							 url: "${pageContext.request.contextPath}/exchange/delExchange.action?ids="+check_val,
							 /* data:{
								 ids:check_val	 
						     }, */
						     //dataType:"text",
						     traditional:true,//防止深度序列化
							 success: function(obj){
								 if(obj=='0'){
										alert("删除成功！");
										location.href = '${pageContext.request.contextPath}/exchange/queryAllExchangeBySize.action';
									}else if(obj=='1'){
										alert("删除失败!");
									}
							 }
						}		
					)
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
	<div id="container">
		<div class="page-header ">
			<h2>乐豆换算比例</h2>
		</div>
			<form action="${pageContext.request.contextPath}/exchange/queryConditionExchange.action" method="post">
			<div class="row">
				<div class="col-xs-4 col-sm-3 " >
					<div class="row">
						<div class="col-xs-8 col-sm-2">
							<span class="btn btn-default">省份</span>
						</div>
						<div class="col-xs-3 col-sm-5">
							<select name="searchExchangeProvId" id="searchExchangeProvId" class="form-control">
									<option value=""></option>
								<c:forEach items="${exchangeListFix}" var="exchange">
									<option value="${exchange.id}">${exchange.province}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-xs-6 col-sm-4 ">
					<input type="submit" class="btn btn-primary" id="search" value="查询" />
				</div>
					</div>
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
								<h4 class="modal-title" id="myModalLabel">新增乐豆比例</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal"
									action="" enctype="application/x-www-form-urlencoded" method="post" id="form">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">省份</label>
										<div class="col-sm-5">
											<select name="exchangeProvId" class="form-control">
												<option>吉林</option>
												<option>河北</option>
												<option>辽宁</option>
												<option>浙江</option>
												<option>广东</option>
												<option>四川</option>
												<option>云南</option>
												<option>北京</option>
												<option>上海</option>
												<option>江苏</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-1">相应省份消费1元话费赠送的乐豆数量</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">兑换比例</label>
										<div class="col-sm-5">
											<div class="input">
												<input type="text" name="exchangeCharge" value="1" id="exchangeCharge"  placeholder="必须输入整数" required="required" oninvalid="setCustomValidity('必须填写消费金额(数字类型)！');" />
											</div>
										</div>
									</div>
									
									
									
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
										
											<button type="button" class="btn btn-default" id="FunctionButtonInput">添加规则</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>


				<a class="btn btn-danger" onclick='del();'> <span
					class="glyphicon glyphicon-trash"></span> 删除</a>
				
			</div>
		</div>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-11">
				<div class="table-responsive"
					style="vertical-align: middle;text-align: center;">
					<div class="panel-body">  消费金额是指对应省份消费1元话费所赠送的游币数量 </div>
					<table id="searchTable"
						class="table table-bordered table-hover table-condensed  ">
						<tr>
							<td><input type="checkbox" id="all" value="全选"
								onclick="checkall()" /> 全选</td>
							<td>省份代码</td>
							<td>省份</td>
							<td>兑换比例</td>
							<td>创建时间</td>
							<td>修改时间</td>
							<td>操作</td>
						</tr>
						<c:forEach var="exchange" items="${exchangeList}">
							<tr>
								<td><input type='checkbox' onclick="checkChecked()"
									name='opt' value='${exchange.id}' />
								</td>
								<td>${exchange.id}</td>
								<td>${exchange.province}</td>
								<td>${exchange.cost_rate}</td>
								<td>
									
									<fmt:formatDate value="${exchange.createtime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
								</td>
								<td><c:choose>
										<c:when test="${exchange.updatetime==null}">
									未曾修改
								</c:when>
										<c:otherwise>
											
											<fmt:formatDate value="${exchange.updatetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" dateStyle="default"/>
										</c:otherwise>
									</c:choose></td>
									
								
								<td>
										<a class="btn btn-info btn-sm"
											href="${pageContext.request.contextPath}/exchange/queryExchangeById.action?id=${exchange.id}">
											<span class="glyphicon glyphicon-pencil"></span>修改</a>
								</td>
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
