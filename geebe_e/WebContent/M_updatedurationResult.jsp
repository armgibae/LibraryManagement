<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
   <%@ page import="java.sql.*" %>
    
    <% request.setCharacterEncoding("euc-kr"); %>
    <%!
    	
    %>
    <%	

    	String id = request.getParameter("user_id");
    	String isbn = request.getParameter("book_isbn");
    	String end_date = request.getParameter("end_date");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String str = "";
    	try{	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
    	String sql = "update borrow set end_date = ? where ID = ? and ISBN = ?";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, end_date);
    	pstmt.setString(2, id);
    	pstmt.setString(3, isbn);
    	
    	pstmt.executeUpdate();
    	str = "마감 날짜 변경 완료.";
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		str = "마감 날짜 변경 실패";
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
    <title>레코드 추가</title>
    </head>
    <body>
    	<%=str %>
    	<form method="post" action="M_main.jsp">
	
		
		<input type="submit" value="메인 화면으로 돌아가기.">
	</form>
    </body>
    </html>
 



	