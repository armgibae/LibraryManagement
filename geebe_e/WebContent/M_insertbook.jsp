<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="txxt/html; charset=EUC-KR">
<title>도서 등록</title>
</head>
<body>
<h2>Register book</h2>
<form method="post" action="M_insertbookResult.jsp">
		ISBN : <input type="text" name="book_isbn" maxlength="13"><br/>
		title : <input type="text" name="book_title" maxlength="20"><br/>
		author : <input type="text" name="book_author" maxlength="20"><br/>
		publication : <input type="text" name="book_publication" maxlength="20"><br/>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>