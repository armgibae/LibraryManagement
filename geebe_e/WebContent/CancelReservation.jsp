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
<title>예매예매!!</title>
</head>
<body>
	<%	
		String userID=null; 	 	
		if(session.getAttribute("ID") !=null){
		userID=(String)session.getAttribute("ID");
		}
		
		ReservationDAO res = new ReservationDAO();
		String ISBN = request.getParameter("ISBN");
		String reservation_order = res.getMyReservation_order(ISBN, userID); //나의 오더순서
		System.out.println(reservation_order);
		res.removeReservation(ISBN, userID);
		res.MinusReservation_order(ISBN, reservation_order);
		
		
		
		
		
	
		
	 %>
	<table class="table table-striped">
		<tr>
			

		</tr>

		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expended="false">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" //로고 href="CancelReservation.jsp">예약취소 완료창 창</a>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1"></div>
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
		
      	<div class="container">
		<%-- 내부 내용 --%>
		<div class="col-Lg-4"></div>
		<div class="col-Lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="PayResult.jsp">
				<h3 style="text-align: center;">예약 취소완료</h3>
				<div class="form-group">
			
			</div>
			
			</form>
		</div>
	</div>
	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>