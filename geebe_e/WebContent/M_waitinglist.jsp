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
    	
    	String sql = "select * from borrow w inner join book k on w.ISBN = k.ISBN where state = 2";
    	pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();

    	while(rs.next()){
    		String isbn = rs.getString("ISBN");
    		String id = rs.getString("ID");
    		String info = isbn + "-" +id;
    		String title = rs.getString("title");
    		str += "<div id =\"" + info + "\"> ISBN : " + isbn + "</br> title : " + title + "</br> user ID : " + id + "</br>�ݳ� �����...<button onclick =\"location.href = 'M_acceptreturn.jsp?info=" + info + "'\">����</button></div></br>";
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
    <title>���ڵ� �߰�</title>
    </head>
    <body>
    	<%=str %>
    	<form method="post" action="M_main.jsp">
	
		
		<input type="submit" value="����ȭ������ ���ư���.">
	</form>
    </body>
    </html>
 



	