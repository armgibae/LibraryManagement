<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope= "page"/>
<jsp:setProperty name="user" property="ID"/>
<jsp:setProperty name="user" property="PW"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>JSP �Խ��� ����Ʈ</title>
</head>
<body>
<%		String ID=null;
	if(session.getAttribute("ID")!=null){
		ID=(String)session.getAttribute("ID");
	}
	if(ID!=null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('�α��εǾ� �ֽ��ϴ�')");
		script.println("location.href ='main.jsp'");
		script.println("</script>");
	}
		UserDAO userDAO = new UserDAO();
		
		int result= userDAO.login(user.getID(), user.getPW());
		if(result ==1){
			session.setAttribute("ID",user.getID());
			
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("location.href ='main.jsp'");
			script.println("</script>");
		}
		else if(result ==0 ){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('���Ʋ��')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result ==-1 ){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('���̵����')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result ==-2 ){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('��������')");
			script.println("history.back()");
			script.println("</script>");
		}
%>
</body>
</html>