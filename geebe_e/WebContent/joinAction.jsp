<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="ID" />
<jsp:setProperty name="user" property="PW" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="phone" />
<jsp:setProperty name="user" property="user_type" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>JSP �Խ��� ����Ʈ</title>
</head>
<body>
	<%
		String ID = null;
		if (session.getAttribute("ID") != null) {
			ID = (String) session.getAttribute("ID");
		}
		
		user.setCount(0);
		
			if (user.getID().equals(null) || user.getPW().equals(null)||user.getName().equals(null))
				 {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ ��� �Է��ϼ���')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�̹� �����ϴ� ���̵�!')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					session.setAttribute("ID", user.getID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('ȸ������ �Ϸ�')");
					script.println("location.href ='main.jsp'");
					script.println("</script>");
				}
			}
		
	%>
</body>
</html>