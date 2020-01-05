<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.ReservationDAO"%>
<%@ page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>예약 처리</title>
</head>
<body>
	<%	
		String userID=null; 	 	
		if(session.getAttribute("ID") !=null){
		userID=(String)session.getAttribute("ID");
		}
		
		ReservationDAO res = new ReservationDAO();
		String ISBN = request.getParameter("isbn");
		int reservation_order = res.getReservation_order(ISBN);
		String title  = res.getBookTitle(ISBN);
		
		
		
		
	
		
	 %>
	<table class="table table-striped">
		<tr>
			<td>ISBN</td>
			<td>도서명</td>
			<td>예약대기 번호</td>
	

		</tr>

		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expended="false">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" //로고 href="PayResult.jsp">예약이 완료되었습니다.</a>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1"></div>
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>

					<% 
					 
					 
					res.RunningReservation(ISBN, userID, String.valueOf(++reservation_order));
					
					
					 
						 %>
					<tr>
						<td><%=ISBN %></td>
						<td><%=title%></td>
						<td><%=reservation_order%></td>
						

					</tr>
		
      	
   


				</ul>

			</div>

		</nav>


		<div class="col-Lg-4"></div>
		<script src="https://code.jquery.com-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>