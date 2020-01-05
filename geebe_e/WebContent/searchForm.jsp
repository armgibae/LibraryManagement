<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Log in Page</title>
 <script type="text/javascript">
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function gotomain() {
            location.href="main.jsp";
        }
    </script>
</head>
<body>
<h1>도서 검색</h1>
	<form method="post" action="search.jsp">                   <!-- actino되는 곳 수정 필요  -->
    검색할 책 제목을 입력하세요 : <input type="text" name="bookname" maxlength="12" ><br/>
      <input type="radio" name="Tool" value = "bookName" checked>책 제목으로 검색
	<input type="radio" name="Tool" value = "ISBNName">ISBN으로 검색<br/>
      <input type="submit" value="검색">
      <input type="button" value="닫기" onclick = "gotomain()"> <!-- onclick 갈곳 수정 -->
   </form>
</body>
</html>