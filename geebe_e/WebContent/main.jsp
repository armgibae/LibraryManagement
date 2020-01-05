<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>도서관리</title>
</head>
<body>
	<%	
		boolean ispolling=false;
		String ID=null; 	 	
		if(session.getAttribute("ID") !=null){
		ID=(String)session.getAttribute("ID");
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
			<a class="navbar-brand" //로고 href="main.jsp">도서관리 시스템</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1"></div>
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<% if(ID!=null){  
				%>
				<li><a href="information.jsp">내 정보</a></li>
				<li><a href="MemberReservation.jsp">내 예약목록 확인</a></li>
				<li><a href="searchForm.jsp">대출 및 예약하기</a></li>
				<%
				}
				%>
				
				<% if(ID==null){  
				%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				<%
				}
				%>
				<%-- userID가 이미 있을 경우 로그아웃선택가능--%>
				<% if(ID!=null){              
				%>

				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<%
				}
				%>
			</ul>

		</div>

	</nav>


	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>