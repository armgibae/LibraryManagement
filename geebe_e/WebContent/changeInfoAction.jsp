<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope= "page"/>
<%-- ���� ȸ�������� ��ϵ� ������ --%>
<jsp:setProperty name="user" property="PW"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="email"/>
<jsp:setProperty name="user" property="phone"/>
<jsp:setProperty name="user" property="user_type"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">

</head>
<title>JSP �Խ��� ����Ʈ</title>
<body>
<%		String ID=null;
	if(session.getAttribute("ID")!=null){
		ID=(String)session.getAttribute("ID");
	}
	UserDAO userDAO =new UserDAO();
	if(userDAO.changeUserInfo(ID, user.getPW(),user.getName(), user.getEmail(), user.getPhone(),user.getUser_type())==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�������� �Ϸ�')");
		script.println("location.href ='information.jsp'");
		script.println("</script>");
		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�������� ����: ��� ������ �Է��Ͻʽÿ�')");
		script.println("location.href ='changeInfo.jsp'");
		script.println("</script>");
	}


	
	
%>
</body>
</html>