<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>예매예매!!</title>
</head>
<body>
	<%	
		String userID=null;
		if(session.getAttribute("userID") !=null){
		userID=(String)session.getAttribute("userID");
		}

	 %>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" //로고 href="main.jsp">예매예매!!</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1"></div>
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<% if(userID!=null){  
				%>
				<li><a href="information.jsp">내 정보</a></li>
				<%
				}
				%>

				<li><a href="bbs.jsp">예매</a></li>
				<% if(userID==null){  
				%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				<%
				}
				%>
				<%-- userID가 이미 있을 경우 로그아웃선택가능--%>
				<% if(userID!=null){              
				%>

				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<%
				}
				%>
			</ul>

		</div>
	</nav>
	<div class="container">
	<% UserDAO userDAO= new UserDAO();
	
	%>		

	<%-- 내부 내용 --%>
		<div class="col-Lg-4"></div>
		<div class="col-Lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align: center;">결제수단 등록</h3>

				<br> <input type="BUTTON" value='신용카드'><br>
				
				<br> <input type="BUTTON" value='계좌이체'><br>
				
				<br><input type="BUTTON" value='휴대폰결제'><br>

			</form>
		</div>
	</div>

	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>