<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope= "page"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>JSP �Խ��� ����Ʈ</title>
</head>
<body>
<%		String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	
	String BookName=request.getParameter("BookName");
	UserDAO userDAO= new UserDAO();
	
	if( userDAO.returnRequest(BookName) ==1){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('�����ݳ� ��û�Ϸ�')");
		script.println("location.href ='information.jsp'");
		script.println("</script>");
	}
	else{
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('�ݳ���û �����߻�')");
		script.println("history.back()");
		script.println("</script>");
	
	}
%>
</body>
</html>