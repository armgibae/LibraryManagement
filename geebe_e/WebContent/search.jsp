<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
   <%@ page import="java.sql.*" %>
    
    <% request.setCharacterEncoding("euc-kr"); %>
    <%!
    	
    %>
    <%	
        String tool = request.getParameter("Tool");
    	String name = request.getParameter("bookname");
    	String ISBN = request.getParameter("bookname");
    	int resnum = 0;
    	name = "%" + name + "%";
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	PreparedStatement pstmt2 = null;
    	ResultSet rs;
    	ResultSet rsnum;
    	String bool = "";
    	String str = "";
    	try{	
    	
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
    	String dbId = "root";
    	String dbPass = "1234";
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    	
    	
    	if(tool.equals("bookName")){
    		String sql = "select * from book LEFT OUTER JOIN borrow ON book.ISBN=borrow.ISBN where book.title like ?";
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, name);
        	
        	rs = pstmt.executeQuery();
        	
        	while(rs.next()){
        		String isbn = rs.getString("ISBN");
        		String title = rs.getString("title");
        		sql = "select * from reservation where ISBN = ?";
            	pstmt2 = conn.prepareStatement(sql);
            	pstmt2.setString(1, isbn);
            	rsnum = pstmt2.executeQuery();
            	
            
				int num = 0;
				while(rsnum.next()){
					num++;
        	}
				
				
				
				
        		str += "<div>ISBN : " + isbn + "</br> title : " + title + "</br>" + "�����ο� : "+ num  + "��";
        		if (rs.getString("state")==null) { /* ������ �����Ѱ�� */
    				str += "<button onclick = \"location.href = 'rentalResult.jsp?isbn=" + isbn + "'\">����</button>";
    			} 
        		else {
    				str += "<button onclick = \"location.href = 'PayResult.jsp?isbn=" + isbn + "'\">����</button>";
    			}
        		
        	}
    	}
    	else{
    		String sql = "select * from book LEFT OUTER JOIN borrow ON book.ISBN=borrow.ISBN where book.ISBN like ?";
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, ISBN);
        	
        	rs = pstmt.executeQuery();
        	
        	while(rs.next()){
        		String isbn = rs.getString("ISBN");
        		String title = rs.getString("title");
        		sql = "select * from reservation where ISBN = ?";
            	pstmt = conn.prepareStatement(sql);
            	pstmt.setString(1, isbn);
            	rsnum = pstmt.executeQuery();
            	
            
				int num = 0;
				while(rsnum.next()){
					num++;
        	}
        		str += "<div>ISBN : " + isbn + "</br> title : " + title + "</br>" + "�����ο� : " + resnum + "��";
        		if (rs.getString("state")==null) { /* �������ΰ�� */
    				str += "<button onclick = \"location.href = 'rentalResult.jsp?isbn=" + isbn + "'\">����</button>";
    			} else {
    				str += "<button onclick = \"location.href = 'PayResult.jsp?isbn=" + isbn + "'\">����</button>";
    			}
        		
        	}
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
    	<form method="post" action="searchForm.jsp">
	
		
		<input type="submit" value="�˻� ȭ������ ���ư���.">
	</form>
    </body>
    </html>
 



	