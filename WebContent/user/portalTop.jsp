<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">游戏手机下载门户网站</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a id="time"> <script>
					document.getElementById('time').innerHTML = new Date()
							.toLocaleString()
							+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
					setInterval(
							"document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
							1000);
				</script> </a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#">欢迎${loginUser==null?notlogin:loginUser.name}</a>
				</li>
			<c:choose>
				<c:when test="${loginUser==null}">
				<li class="dropdown"><a href="../login.jsp" >登录</a>
				</li>
				<li class="dropdown"><a href="../register.jsp" >注册</a>
				</li>
				</c:when>
				<c:otherwise>
				<li class="dropdown"><a href="#" class="dropdown-toggle "
					data-toggle="dropdown">个人中心<b class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/buyingRecord/queryUserDetailInfo.action?userId=${loginUser.id}">余额信息</a></li>
						<li><a href="${pageContext.request.contextPath}/buyingRecord/queryAllExpenseByUserId.action?userId=${loginUser.id}">消费记录</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/buyingRecord/exitUser.action">退出</a></li>
					</ul>
				</li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">密保卡充值</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" action="${pageContext.request.contextPath}/addPrepaid.do" 
								enctype="multipart/form-data" method="post"  ">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">卡号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardNumber"
												name="cardNumber" placeholder="请输入卡号">
												<input type="hidden" name="userId" value="${user.userId}"/>
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">密码</label>
										<div class="col-sm-10">
												<input type="text" class="form-control"  placeholder="请输入卡密码" name="cardPwd" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default">确认充值</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>

	
    