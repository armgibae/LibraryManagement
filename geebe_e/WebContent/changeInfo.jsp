<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>도서관리</title>
</head>
<body>



	<%
      String ID = null;
      if (session.getAttribute("ID") != null) { //로그인 되어 있을 때
         ID = (String) session.getAttribute("ID");
      }
   %>

	<%--페이지 위 --%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" //로고 href="main.jsp">도서관리 시스템</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1"></div>
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<%
               if (ID != null) {
            %>
				<li><a href="information.jsp">내 정보</a></li>
				<%
               }
            %>

				<li><a href="bbs.jsp">예매</a></li>
				<%
               if (ID == null) {
            %>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				<%
               }
            %>
				<%-- ID가 이미 있을 경우 로그아웃선택가능--%>
				<%
               if (ID != null) {
            %>

				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<%
               }
            %>
			</ul>
		</div>
	</nav>
	<div class="container">
		<%-- 내부 내용 --%>

		<%
         User user = new User();
         UserDAO userDAO = new UserDAO();
         user = userDAO.userInformation(ID);
      %>
		<div class="col-Lg-4"></div>
		<div class="col-Lg-4"></div>
		<br>
		<div class="container">


			<div class="well">
				내 ID :
				<%=user.getID()%>
			</div>
			<br>
			<div class="well">
				내 Password :
				<%=user.getPW()%>
			</div>
			<br>

			<div class="well">
				내 E-mail :
				<%=user.getEmail()%>
			</div>
			<br>
			<div class="well">
				내 전화번호 :
				<%=user.getPhone()%>
			</div>
			<br>
			<div class="well">
				내 userType :
				<%=user.getUser_type()%>
			</div>
			<br>
			<div class="well">
				내 대여 횟수 :
				<%=user.getCount()%>
			</div>
			<br>
			<div class="well">
				내 이름 :
				<%=user.getName()%>
			</div>
			<br>
			<div class="well">
				현재 대여중인 도서 :
				<%
				ResultSet rs = userDAO.checkMyBook(ID);
				while(rs.next()){
					%>

				<% out.print(rs.getString(1));
				}
		%>
			</div>
			<br>

			<form method="post" action="changeInfoAction.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="수정할 비밀번호"
						name="PW" maxlength="20">
				</div>
				<br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="수정할  E-mail"
						name="email" maxlength="20">
				</div>
				<br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="수정할 전화번호"
						name="phone" maxlength="20">
				</div>
				<br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="수정할 유저타입"
						name="user_type" maxlength="20">
				</div>
				<br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="수정할 이름"
						name="name" maxlength="20">
				</div>
				<br> <input type="submit" class="btn btn-primary form-control"
					value="정보수정 완료"><br>
				<br> <br>
			</form>
		</div>
	</div>
	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>