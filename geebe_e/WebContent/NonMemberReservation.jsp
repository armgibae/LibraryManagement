<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.ReservationDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootsrap.css">
<title>예매예매!!</title>
</head>
<body>
	<%
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			
		}
	%>

	<table class="table table-striped">
		<tr>
			<td>좌석 번호</td>
			<td>열차 종류</td>
			<td>출발역</td>
			<td>도착역</td>
			<td>출발시간</td>
			<td>소요시간</td>
			
		</tr>


		<%
			ReservationDAO resDAO = new ReservationDAO();
			ResultSet rs = resDAO.getSeatListResultSet();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("seat_no")%></td>
			<td><%=rs.getString("train_name")%></td>
			<td><%=rs.getString("src_station")%></td>
			<td><%=rs.getString("dst_station")%></td>
			<td><%=rs.getString("src_time")%></td>
			<td><%=rs.getString("total_time")%></td>
			
		</tr>
		<%
			}

			if (rs != null)
				rs.close();
		%>


	</table>

	<div class="container">
		<%-- 내부 내용 --%>
		<div class="col-Lg-4"></div>
		<div class="col-Lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="PayResult.jsp">
				<h3 style="text-align: center;">결제화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="좌석번호"
						name="seat_no" maxlength="5">
				</div>
				<div class="form-gruop">
					<%
						
					%>
					<input type="text" class="form-control" ID="paymethod"
						placeholder="결제수단" name="paymethod" maxlength="10">
		
		</div>
				<br> <input type="submit" class="btn btn-primary form-control"
					value="예매 및 결제요청" href="PayResult.jsp">
					
			</form>
			
	
		</div>
	</div>
	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>