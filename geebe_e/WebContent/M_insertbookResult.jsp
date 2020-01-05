<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
   <%@ page import="java.sql.*" %>
    
    <% request.setCharacterEncoding("euc-kr"); %>
    <%!
    	
    %>
    <%	

    	String isbn = request.getParameter("book_isbn");
    	String title = request.getParameter("book_title");
    	String author = request.getParameter("book_author");
    	String publication = request.getParameter("book_publication");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String str = "";
    	try{	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
    	String sql = "insert into book values(?, ?, ?, ?)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, isbn);
    	pstmt.setString(2, title);
    	pstmt.setString(3, author);
    	pstmt.setString(4, publication);
    	
    	pstmt.executeUpdate();
    	str = "���� �߰� �Ϸ�.";
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		str = "�ߺ��� ISBN�� �����մϴ�.";
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
 



	