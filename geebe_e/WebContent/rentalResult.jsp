<%@page import="user.ReservationDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
   request.setCharacterEncoding("euc-kr");
%>
<%!%>
<%
   String isbn = request.getParameter("isbn");
   String id = null;
   if (session.getAttribute("ID") != null) {
      id = (String) session.getAttribute("ID");
   }

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String str = "";
   try {
      String jdbcUrl = "jdbc:mysql://localhost:3306/db_test";
      String dbId = "root";
      String dbPass = "1234";

      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

      String sql = "select * from reservation inner join user on reservation.ID = user.ID where ISBN = ? and reservation_order = 1";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, isbn);

      rs = pstmt.executeQuery();

      if (rs.next()) {
         if (id.equals(rs.getString("ID"))) {
            String type = rs.getString("user_type");
            Calendar start = Calendar.getInstance();
            Calendar end = Calendar.getInstance();
            if (type.equals("undergraduate"))
               end.add(Calendar.DATE, 10);
            else if (type.equals("graduate"))
               end.add(Calendar.DATE, 30);
            else
               end.add(Calendar.DATE, 60);
            String s_date = start.get(Calendar.YEAR) + "-" + start.get(Calendar.MONTH) + "-"
                  + start.get(Calendar.DATE);
            String e_date = end.get(Calendar.YEAR) + "-" + end.get(Calendar.MONTH) + "-"
                  + end.get(Calendar.DATE);

            sql = "insert into borrow values(?, ?, ?, ?, 1)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, isbn);
            pstmt.setString(3, s_date);
            pstmt.setString(4, e_date);
            pstmt.executeUpdate();

            sql = "delete from reservation where reservation_order = 1 and isbn = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, isbn);
            pstmt.executeUpdate();

            sql = "select * from reservation where ISBN = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, isbn);
            rs = pstmt.executeQuery();

            while (rs.next()) {
               int order = rs.getInt("reservation_order");
               sql = "update reservation set reservation_order = ? where reservation_order = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, order - 1);
               pstmt.setInt(2, order);
               pstmt.executeUpdate();
            }
            
            sql = "select * from user where ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
               int count = rs.getInt("count");
               
               sql = "update user set count = ? where ID = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, count+1);
               pstmt.setString(2, id);
               pstmt.executeUpdate();
               
            }
            
            str = "대출에 성공하였습니다.</br><button onclick = \"location.href = 'main.jsp'\">돌아가기</button>";
         } else {
            str = "현재 예약중인 사람이 있습니다.</br><button onclick=\"location.href = 'PayResult.jsp?isbn = " + isbn
                  + "'\">예약</button>"; // 이동 jsp 파일 이름 수정
         }
      } else {

         sql = "select user_type from user where ID = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);

         rs = pstmt.executeQuery();
         if (rs.next()) {
            String type = rs.getString("user_type");
            Calendar start = Calendar.getInstance();
            Calendar end = Calendar.getInstance();
            if (type.equals("undergraduate"))
               end.add(Calendar.DATE, 10);
            else if (type.equals("graduate"))
               end.add(Calendar.DATE, 30);
            else
               end.add(Calendar.DATE, 60);
            String s_date = start.get(Calendar.YEAR) + "-" + (start.get(Calendar.MONTH)+1) + "-"
                  + start.get(Calendar.DATE);
            String e_date = end.get(Calendar.YEAR) + "-" + (end.get(Calendar.MONTH)+1) + "-"
                  + end.get(Calendar.DATE);	

            sql = "insert into borrow values(?, ?, ?, ?, 1)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, isbn);
            pstmt.setString(3, s_date);
            pstmt.setString(4, e_date);
            pstmt.executeUpdate();
            
            sql = "select * from user where ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
               int count = rs.getInt("count");
               
               sql = "update user set count = ? where ID = ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, count+1);
               pstmt.setString(2, id);
               pstmt.executeUpdate();
               
            }
            
            str = "대출에 성공적하였습니다.</br><button onclick = \"location.href = 'main.jsp'\">돌아가기</button>";
         }

      }
   } catch (Exception e) {
      e.printStackTrace();
      str = "대출에 실패하였습니다.</br><button onclick = \"location.href = 'main.jsp'\">돌아가기</button>";
   } finally {
      if (pstmt != null)
         try {
            pstmt.close();
         } catch (SQLException sqle) {
         }
      if (conn != null)
         try {
            conn.close();
         } catch (SQLException sqle) {
         }
   }
%>
<!DOCTYPE html PUBLIC "-//W3C/DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레코드 추가</title>
</head>
<body>
   <%=str%>
</body>
</html>



