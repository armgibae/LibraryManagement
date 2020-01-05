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
<link rel="stylesheet" href="css/bootstrap.css">
<title>예매예매!!</title>
</head>

<body>
	<%
   String userID=null;
   if(session.getAttribute("ID") !=null){
   userID=(String)session.getAttribute("ID");
   }
   
  if(userID==null){
	  PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인해야 이용하실 수 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
  }
   

   %>

	<table class="table table-striped">
		<tr>
			<td>ISBN</td>
			<td>도서명</td>
			<td>나의 예약대기 번호</td>
			
			
		</tr>


		<%   
      
      
      ReservationDAO resDAO = new ReservationDAO();
  	 ResultSet rs = resDAO.getMyReservationInfo(userID);
      int day = 0;
      String userType = null;
  	 if(!rs.wasNull()){
  	 while(rs.next()){
    	  
    	  
      
    %>
		<tr>
			<td><%=rs.getString("ISBN") %></td>
			<td><%=rs.getString("title") %></td>
			<td><%=rs.getString("reservation_order") %></td>
				<%
		int my_order = Integer.parseInt(rs.getString("reservation_order"));
		int real_order = resDAO.getReservation_order(rs.getString("ISBN"))-my_order;
				
			int temp_order = 1;
		while(temp_order<my_order)	{	
		
		String userid = resDAO.whatIsUserID(rs.getString("ISBN"),String.valueOf(temp_order));
		userType = resDAO.whatIsUserType(userid);
			
		if(userType.equals("undergraduate")){
			day+=10;
		}
		else if(userType.equals("graduate")){
			day+=30;
		}
		else if(userType.equals("professor")){
			day+=60;
		}
			temp_order++;
		}
		String firstEndTime = resDAO.whatIsFirstEndTime(rs.getString("ISBN"));
		firstEndTime += "으로부터 최대 "+day+"일 후에 대출가능";
		
				%>
				
			<td><%=firstEndTime%></td>					
		
		</tr>
		<%
      }
  	 }
      
     
   
      
   %>


	</table>

	<div class="container">
		<%-- 내부 내용 --%>
		<div class="col-Lg-4"></div>
		<div class="col-Lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="CancelReservation.jsp">
				<h3 style="text-align: center;">예약 취소하기</h3>
				<div class="form-group">
			
			
         
					<input type="text" class="form-control" id="ISBN"
						placeholder="예약취소할 ISPN번호" name="ISBN" maxlength="10">
					
				
					
			
</div>
				<br> <input type="submit" class="btn btn-primary form-control"
					value="예약 취소요청" href="CancelReservation.jsp">
			</form>
		</div>
	</div>
	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>