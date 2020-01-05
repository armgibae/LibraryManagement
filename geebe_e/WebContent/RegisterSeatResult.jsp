<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
   <%@ page import="java.sql.*" %>
    
    <% request.setCharacterEncoding("euc-kr"); %>
    <%!
    	
    %>
    <%	

    	String seat_no = request.getParameter("seat_no");
    	String src_station = request.getParameter("src_station");
    	String dst_station = request.getParameter("dst_station");
    	String src_time = request.getParameter("src_time");
    	String total_time = request.getParameter("total_time");
    	String train_name = request.getParameter("train_name");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String str = "";
    	try{	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
    	String sql = "insert into Seat values(?, ?, ?, ?, ?, ?, DEFAULT)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, seat_no);
    	pstmt.setString(2, train_name);
    	pstmt.setString(3, src_station);
    	pstmt.setString(4, dst_station);
    	pstmt.setString(5, src_time);
    	pstmt.setString(6, total_time);
    
    	pstmt.executeUpdate();
    	str = "좌석 추가 완료.";
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		str = "좌석 추가 실패.";
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
    	<form method="post" action="RegisterSeat.jsp">
	
		
		<input type="submit" value="추가 화면으로 돌아가기.">
	</form>
    </body>
    </html>
 



	