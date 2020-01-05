<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope= "page"/>
<jsp:setProperty name="user" property="PW"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>µµ¼­°ü¸®</title>
</head>
<body>
<%		String ID=null;
	if(session.getAttribute("ID")!=null){
		ID=(String)session.getAttribute("ID");
	}
	
	UserDAO userDAO= new UserDAO();
	
	if( userDAO.userWithdraw(ID, user.getPW())  ==1){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('Å»Åð ¿Ï·á')");
		script.println("location.href ='logoutAction.jsp'");
		script.println("</script>");
	}
	else{
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('Å»Åð ¿À·ù')");
		script.println("history.back()");
		script.println("</script>");
	
	}

%>
</body>
</html>