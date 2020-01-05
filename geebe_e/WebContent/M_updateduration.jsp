<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String[] info = request.getParameter("info").split("-");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="txxt/html; charset=EUC-KR">
<title>마감 기간 변경</title>
</head>
<body>
	<h2>update duration</h2>
	<form method="post" action="M_updatedurationResult.jsp">
		new end date : <input type="date" name="end_date">
		<input type="text" name="book_isbn" maxlength="13" value = "<%=info[0] %>" style = "display: none"><br />
		<input type="text" name="user_id" maxlength="13" value = "<%=info[1] %>" style = "display: none"><br />
		<input type="submit" value="입력완료">
	</form>
</body>
</html>