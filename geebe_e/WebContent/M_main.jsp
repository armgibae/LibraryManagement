<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
		boolean ispolling=false;
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
			<a class="navbar-brand" //로고 href="main.jsp">관리자 모드</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1"></div>
			<ul class="nav navbar-nav">
				<li><a href="M_insertbook.jsp">도서 등록</a></li>
				<li><a href="M_searchbook.jsp">도서 정보 수정 및 삭제</a></li>
				<li><a href="M_searchuser.jsp">회원 정보 수정 및 탈퇴</a></li>
				<li><a href="M_borrowlist.jsp">회원 대출 목록 관리</a></li>
				<li><a href="M_waitinglist.jsp">도서 반납 승인</a></li>
			</ul>

		</div>

	</nav>


	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>