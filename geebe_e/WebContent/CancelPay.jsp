<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.ReservationDAO" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope= "page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>JSP 게시판 사이트</title>
</head>
<body>
<%		String userID=null;
	if(session.getAttribute("userID")!=null){
		
		userID=(String)session.getAttribute("userID");
	}
	

	User buser = new User();
	UserDAO userDAO = new UserDAO();
	buser = userDAO.userInformation(userID);
	String ticket = buser.getUserTicket();
	
	ReservationDAO auser = new ReservationDAO();
	auser.CancelPay(userID);
	

	String seat_no = "";
	seat_no+=ticket.charAt(11);
	seat_no+=ticket.charAt(12);
	auser.setCancelPay(seat_no);
	
		
%>
	<a href="main.jsp">결제 취소완료.</a>
</body>

</html>