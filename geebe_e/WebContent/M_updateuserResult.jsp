<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
   <%@ page import="java.sql.*" %>
    
    <% request.setCharacterEncoding("euc-kr"); %>
    <%!
    	
    %>
    <%	

    	String id = request.getParameter("user_id");
    	String pw = request.getParameter("user_pw");
    	String email = request.getParameter("user_email");
    	String phone = request.getParameter("user_phone");
    	String type = request.getParameter("user_type");
    	String count = request.getParameter("user_count");
    	String name = request.getParameter("user_name");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String str = "";
    	try{	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
    	String sql = "update user set PW = ?, email = ?, phone = ?, user_type = ?, count = ?, name = ? where ID = ?";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, pw);
    	pstmt.setString(2, email);
    	pstmt.setString(3, phone);
    	pstmt.setString(4, type);
    	pstmt.setInt(5, Integer.parseInt(count));
    	pstmt.setString(6, name);
    	pstmt.setString(7, id);
    	
    	pstmt.executeUpdate();
    	str = "���� ���� ���� �Ϸ�.";
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		str = "���� ���� ���� ����";
    	}
    	finally{
    		if(pstmt !=null)try{pstmt.close();}catch(SQLException sqle){}
    		if(conn != null)try{conn.close();}catch(SQLException sqle){}
    	}
    %>
    <!DOCTYPE html PUBLIC "-//W3C/DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>���ڵ� �߰�</title>
    </head>
    <body>
    	<%=str %>
    	<form method="post" action="M_main.jsp">
	
		
		<input type="submit" value="���� ȭ������ ���ư���.">
	</form>
    </body>
    </html>
 



	