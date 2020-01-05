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
    	int top_number = 1;
    	try{	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	ResultSet rs;
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    	
    	String sql = "select * from user order by count DESC";
    	pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();

    	while(rs.next()){
    		String id = rs.getString("ID");
    		String pw = rs.getString("PW");
    		String name = rs.getString("name");
    		String email = rs.getString("email");
    		String phone = rs.getString("phone");
    		String type = rs.getString("user_type");
    		String count = rs.getString("count");
    		str += "<h3>TOP "+ top_number++ + "</h3>";
    		str += "<div id =\"" + id + "\"> id : " + id + "</br> pw : " + pw + "</br> name : " + name + "</br> email : " + email + "</br> phone : " + phone + "</br> type : " + type + "</br> count : " + count + "</br><button onclick =\"location.href = 'M_updateuser.jsp?id=" + id + "'\">수정</button><button onclick =\"location.href = 'M_deleteuserResult.jsp?id=" + id + "'\">삭제</button></div></br>";
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
 



	