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
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../res/layui/css/layui.css"  media="all">
<script src="../res/layui/layui.js" charset="utf-8"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<link href="css/doubleDate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="js/doubleDate2.0.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.doubledate').kuiDate({
		className:'doubledate',
		isDisabled: "0"  // isDisabled为可选参数，“0”表示今日之前不可选，“1”标志今日之前可选
	});

});
</script>
<script type="text/javascript">
	$(window).on('load', function() {
		$('.selectpicker').selectpicker({
			'selectedText' : 'cat'
		});

	});
</script>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}


.iptgroup{width:620px;height:60px;margin:20px auto 0 auto;}
.iptgroup li{float:left;height:30px;line-height:30px;padding:5px;}
.iptgroup li .ipticon{background:url(blue/date_icon.gif) 98% 50% no-repeat;border:1px #CFCFCF solid;padding:3px;}
</style>
</head>
<body>
	<div>
		<div id="container">
			<div class="page-header ">
				<h2>密保卡生成</h2>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-4">
								<div class="modal-body">
									<form class="form-horizontal"
										action="${pageContext.request.contextPath}/addCard.do"
										enctype="multipart/form-data" method="post">
										<table class="table table-bordered table-hover table-condensed  ">
											<tbody>
												<tr>
													<td>数量(张)</td>
													<td><input type="text" name="count" placeholder="必须输入整数"
													required oninvalid="setCustomValidity('必须填写(整数类型)！');" /></td>
												</tr>
												<tr>
													<td>选择需要生成卡的省份</td>
													<td> <select id="moreSelect" name="ids"
													class="selectpicker bla bla bli" multiple data-live-search="true">
													<optgroup>
														<c:forEach items="${provinceList}" var="province">
															<option value="${province.provId}">${province.provName}</option>
														</c:forEach>
													</optgroup>
												</select></td>
												</tr>
												<tr>
													<td>金额(游币数量)</td>
													<td><input type="text" name="cardAmount" placeholder="必须输入整数"
														required oninvalid="setCustomValidity('必须填写(整数类型)！');" /></td>
												</tr>
												<tr class="iptgroup">
												  	<td> <input class="layui-input" required="required" name="cardStartTime"  placeholder="开始日" id="LAY_demorange_s"></td>
												  	<td><input class="layui-input" required="required"  name="cardEndTime" placeholder="截止日" id="LAY_demorange_e"></td>
												</tr>
											</tbody>
										</table>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-primary">生成密保卡</button>
												
									<button class="btn btn-warning" onClick="javascript:history.back(-1);">返回上一页</button>
											</div>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  var start = {
    min: laydate.now()
    ,max: '2099-06-16 23:59:59'
    ,istoday: false
    ,choose: function(datas){
      end.min = datas; //开始日选好后，重置结束日的最小日期
      end.start = datas //将结束日的初始值设定为开始日
    }
  };
  
  var end = {
    min: laydate.now()
    ,max: '2099-06-16 23:59:59'
    ,istoday: false
    ,choose: function(datas){
      start.max = datas; //结束日选好后，重置开始日的最大日期
    }
  };
  
  document.getElementById('LAY_demorange_s').onclick = function(){
    start.elem = this;
    laydate(start);
  }
  document.getElementById('LAY_demorange_e').onclick = function(){
    end.elem = this
    laydate(end);
  }
  
});
</script>
</body>

<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
