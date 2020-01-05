<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%!%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="txxt/html; charset=EUC-KR">
<title>도서 등록</title>
</head>
<body>
	<h2>update book</h2>
	<form method="post" action="M_updateuserResult.jsp">
		new PW : <input type="text" name="user_pw" maxlength="10">
		new name : <input type="text" name="user_name" maxlength="10">
		new email : <input type="text" name="user_email" maxlength="20">
		new phone : <input type="text" name="user_phone" maxlength="11">
		new type : <input type="text" name="user_type" maxlength="10">
		new count : <input type="number" name="user_count" maxlength="10">
		<input type="text" name="user_id" maxlength="13" value = "<%=id %>" style = "display: none"><br />
		<input type="submit" value="입력완료">
	</form>
</body>
</html>