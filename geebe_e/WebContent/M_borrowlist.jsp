<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
   <%@ page import="java.sql.*" %>
    
    <% request.setCharacterEncoding("euc-kr"); %>
    <%!
    	
    %>
    <%	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String str = "";
    	try{	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	ResultSet rs;
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    	
    	String sql = "select * from borrow w inner join book k on w.ISBN = k.ISBN";
    	pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();

    	while(rs.next()){
    		String isbn = rs.getString("ISBN");
    		String id = rs.getString("ID");
    		String info = isbn + "-" +id;
    		String title = rs.getString("title");
    		String start_date = rs.getString("start_date");
    		String end_date = rs.getString("end_date");
    		String author = rs.getString("author");
    		String publication = rs.getString("publication");
    		str += "<div id =\"" + info + "\"> ISBN : " + isbn + "</br> title : " + title + "</br> author : " + author + "</br> publication : "
    		+ publication + "</br> user ID : " + id + "</br> 대출 기간 : " + start_date + " ~ " + end_date + "</br><button onclick =\"location.href = 'M_updateduration.jsp?info="
    		+ info + "'\">대출 기간 조정</button></div></br>";
    	}
    	}
    	catch(Exception e){
    		e.printStackTrace();
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
	
		
		<input type="submit" value="메인화면으로 돌아가기.">
	</form>
    </body>
    </html>
 



	