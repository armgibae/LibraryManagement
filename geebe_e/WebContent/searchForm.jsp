<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Log in Page</title>
 <script type="text/javascript">
        // ��� ��ư Ŭ���� �α��� ȭ������ �̵�
        function gotomain() {
            location.href="main.jsp";
        }
    </script>
</head>
<body>
<h1>���� �˻�</h1>
	<form method="post" action="search.jsp">                   <!-- actino�Ǵ� �� ���� �ʿ�  -->
    �˻��� å ������ �Է��ϼ��� : <input type="text" name="bookname" maxlength="12" ><br/>
      <input type="radio" name="Tool" value = "bookName" checked>å �������� �˻�
	<input type="radio" name="Tool" value = "ISBNName">ISBN���� �˻�<br/>
      <input type="submit" value="�˻�">
      <input type="button" value="�ݱ�" onclick = "gotomain()"> <!-- onclick ���� ���� -->
   </form>
</body>
</html>