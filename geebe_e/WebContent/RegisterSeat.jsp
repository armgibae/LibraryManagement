<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="txxt/html; charset=EUC-KR">
<title>좌석 등록</title>
</head>
<body>
<h2>Register Seat</h2>
<form method="post" action="RegisterSeatResult.jsp">
		좌석번호 : <input type="text" name="seat_no" maxlength="10"><br/>
		기차유형 : <input type="text" name="train_name" maxlength="10"><br/>
		   출발역 : <input type="text" name="src_station" maxlength="10"><br/>
		   도착역 : <input type="text" name="dst_station" maxlength="10"><br/>
		출발시간 : <input type="text" name="src_time" maxlength="10"><br/>
		소요시간 : <input type="text" name="total_time" maxlength="10"><br/>
	
		
		<input type="submit" value="입력완료">
	</form>
</body>
</html>