<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원가입</title>
</head>
<body>
	<%	
		String ID=null;
		if(session.getAttribute("ID") !=null){
		ID=(String)session.getAttribute("ID");
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
			<a class="navbar-brand" //로고 href="main.jsp">도서관리 시스템</a>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1"></div>
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<% if(ID!=null){  
				%>
				<li><a href="information.jsp">내 정보</a></li>
				<%
				}
				%>
				
				<li><a href="이거 대출로 할거임?.jsp">대출</a></li>
				<% if(ID==null){  
				%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				<%
				}
				%>
				<%-- userID가 이미 있을 경우 로그아웃선택가능--%>
				<% if(ID!=null){              
				%>

				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-Lg-4"></div>
		<div class="col-Lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="사용할 아이디"
						name="ID" maxlength="20">
				</div>
				<div class="form-gruop">
					<input type="text" class="form-control" placeholder="사용할 비밀번호"
						name="PW" maxlength="20">
				</div><br>
				<div class="form-gruop">
					<input type="text" class="form-control" placeholder="사용할 이름"
						name="name" maxlength="20">
				</div><br>
				<div class="form-gruop">
					<input type="text" class="form-control" placeholder="사용할 E-mail"
						name="email" maxlength="20">
				</div><br>
				<div class="form-gruop">
					<input type="text" class="form-control" placeholder="사용할 전화번호"
						name="phone" maxlength="20">
				</div><br>
				<div class="form-gruop">
					<input type="text" class="form-control" placeholder="사용할 userType"
						name="user_type" maxlength="20">
				</div>
				<br>

		 <input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
	</div>
	<div class="col-Lg-4"></div>
	<script src="https://code.jquery.com-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>