<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>游币比例管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="bootstrap-select.js">
	
</script>
<link rel="stylesheet" type="text/css" href="bootstrap-select.css">

<!-- 3.0 -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>

<script type="text/javascript">
	$(function(){
	$("#search").click(function(){
	var searchCardStartTime=document.getElementById("searchCardStartTime").value;
	var searchCardEndTime=document.getElementById("searchCardEndTime").value;
	var cardStartTime=searchCardStartTime+"00:00:00";
	var cardEndTime=searchCardEndTime+"00:00:00";
	if(cardStartTime>cardEndTime){
		alert("开始时间要小于结束时间");
	}else{
	$("#searchTable").html("");
			$.ajax({
				url: "${pageContext.request.contextPath}/queryConditionCard.do",
				  cache: false,
				  type: "Post",
				  data: {
				  	searchCardNumber:$("#searchCardNumber").val(),
				  	searchCardProvId:$("#searchCardProvId").val(),
				  	searchCardStartTime:$("#searchCardStartTime").val(),
				  	searchCardEndTime:$("#searchCardEndTime").val(),
				  },
				  dataType:"json",
				  success:function(searchCardList){
					  $("#searchTable").append("<tr><td><input type='checkbox' id='all' value='全选' onclick='checkall()' /> 全选</td><td>ID</td><td>卡号</td><td>密码</td><td>金额</td><td>省份</td><td>有效期开始时间</td><td>有效期结束时间</td><td>使用状态</td><td>创建时间</td></tr>");
					  for(var i=0;i<searchCardList.length;i++){
						  $("#searchTable").append($("<tr><td>"+"<input type='checkbox' name='opt' value='"+searchCardList[i].cardId+"'></td><td>"+searchCardList[i].cardId+"</td><td>"+searchCardList[i].cardNumber+"</td><td>"+searchCardList[i].cardPwd+"</td><td>"+searchCardList[i].cardAmount+"</td><td>"+searchCardList[i].province.provName+"</td><td>"+searchCardList[i].cardStartTime+"</td><td>"+searchCardList[i].cardEndTime+"</td><td>"+searchCardList[i].cardStatus+"</td><td>"+searchCardList[i].cardCreateTime+"</td></tr>"));
					  };
				  },
				  error:function(){
							alert("没有符合该类型名称或类型状态的数据,请重新输入查询条件");
						  }
				});
			
	}	
		});

	});
	



	$(window).on('load', function() {
		$('.selectpicker').selectpicker({
			'selectedText' : 'cat'
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
</script>
</head>
<body>
	<div>
		<div id="container">
			<div class="page-header ">
				<h2>密保卡管理</h2>
			</div>
			<form action="">
				<div class="row">
					<div class="col-xs-4 col-sm-12 ">
						<div class="row">
							<div class="col-xs-8 col-sm-2">
								<span class="btn btn-default">卡号 <input type="text" name="cardNumber" id="searchCardNumber"/> </span>
							</div>
							<div class="col-xs-4 col-sm-3 ">
								<div class="row">
									<div class="col-xs-6 col-sm-4 ">
										<span class="btn btn-default">有效期开始时间 <input
											type="text" name="cardStartTime" id="searchCardStartTime" /> <img
											onclick="WdatePicker({el:$dp.$('searchCardStartTime')})"
											src="js/My97DatePicker/skin/datePicker.gif" width="16"
											height="22" /> </span>
									</div>
								</div>
							</div>

							<div class="col-xs-4 col-sm-3 ">
								<div class="row">
									<div class="col-xs-8 col-sm-4">
										<span class="btn btn-default">有效期结束时间 <input
											type="text" name="cardEndTime" id="searchCardEndTime" /> <img
											onclick="WdatePicker({el:$dp.$('searchCardEndTime')})"
											src="js/My97DatePicker/skin/datePicker.gif" width="16"
											height="22" /> </span>
									</div>
								</div>
							</div>

							<div class="col-xs-4 col-sm-2 ">
								<div class="row">
									<div class="col-xs-8 col-sm-3">
										<span class="btn btn-default"> 省份<select name="cardProvId" id="searchCardProvId">
												<option value="-1"></option>
												<c:forEach items="${provinceList}" var="province">
													<option value="${province.provId}">${province.provName}</option>
												</c:forEach>
										</select> </span>
									</div>
								</div>
							</div>
							<div class="col-xs-4 col-sm-1 ">
								<div class="row">
									<div class="col-xs-6 col-sm-4 ">
										<input type="button" class="btn btn-primary" id="search"
											value="查询" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
			<div class="row">&nbsp;</div>
			<div class="row">
				<div class="col-xs-6 col-sm-4">
					<a href="${pageContext.request.contextPath}/card/addCard.jsp" class="btn btn-primary">批量生成密保卡</a>
					
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
								<td>卡号</td>
								<td>密码</td>
								<td>金额</td>
								<td>省份</td>
								<td>有效期开始时间</td>
								<td>有效期结束时间</td>
								<td>使用状态</td>
								<td>创建时间</td>
							</tr>
							<c:forEach var="card" items="${cardList}">
								<tr>
									<td><input type='checkbox' onclick="checkChecked()"
										name='opt' value='${card.cardId}' /></td>
									<td>${card.cardId}</td>
									<td>${card.cardNumber}</td>
									<td>${card.cardPwd}</td>
									<td>${card.cardAmount}</td>
									<td>${card.province.provName}</td>
									<td>${card.cardStartTime}</td>
									<td>${card.cardEndTime}</td>
									<td>
										<c:choose>
											<c:when test="${card.cardStatus==1}">未生效</c:when>
											<c:when test="${card.cardStatus==2}">正常</c:when>
											<c:when test="${card.cardStatus==3}">已使用</c:when>
											<c:when test="${card.cardStatus==4}">过期</c:when>
										</c:choose>
									</td>
									<td>
										${card.cardCreateTime}
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="12">
									<div class="col-xs-6 col-sm-11">${pagingButton}</div>
								</td>
							</tr>
						</table>

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
