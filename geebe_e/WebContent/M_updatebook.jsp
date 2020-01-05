<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%!%>
<%
	String isbn = request.getParameter("isbn");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="txxt/html; charset=EUC-KR">
<title>도서 등록</title>
</head>
<body>
	<h2>update book</h2>
	<form method="post" action="M_updatebookResult.jsp">
		new title : <input type="text" name="book_title" maxlength="20">
		new author : <input type="text" name="book_author" maxlength="20">
		new publication : <input type="text" name="book_publication" maxlength="20">
		<input type="text" name="book_isbn" maxlength="13" value = "<%=isbn %>" style = "display: none"><br />
		<input type="submit" value="입력완료">
	</form>
</body>
</html>