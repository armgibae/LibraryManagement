<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope= "page"/>
<%-- 새로 회원정보에 등록될 정보들 --%>
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
<title>JSP 게시판 사이트</title>
<body>
<%		String ID=null;
	if(session.getAttribute("ID")!=null){
		ID=(String)session.getAttribute("ID");
	}
	UserDAO userDAO =new UserDAO();
	if(userDAO.changeUserInfo(ID, user.getPW(),user.getName(), user.getEmail(), user.getPhone(),user.getUser_type())==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보수정 완료')");
		script.println("location.href ='information.jsp'");
		script.println("</script>");
		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보수정 실패: 모든 정보를 입력하십시오')");
		script.println("location.href ='changeInfo.jsp'");
		script.println("</script>");
	}


	
	
%>
</body>
</html>