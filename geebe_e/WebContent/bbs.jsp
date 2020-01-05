<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.ReservationDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>예매예매!!</title>
</head>
<body>
   <%   
      String userID=null;
      if(session.getAttribute("userID") !=null){
      userID=(String)session.getAttribute("userID");
      }

    %>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expended="false">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" //로고 href="main.jsp">좌석 예매</a>
         <div class="collapse navbar-collapse"
            id="bs-example-navbar-collapse-1"></div>
         <ul class="nav navbar-nav">
            <li><a href="main.jsp">메인</a></li>
         
            <li><a href="MemberReservation.jsp">예약 취소</a></li>
        
            
         
          
            </ul>

      </div>

   </nav>


   <div class="col-Lg-4"></div>
   <script src="https://code.jquery.com-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>