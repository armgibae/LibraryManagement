<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="txxt/html; charset=EUC-KR">
<title>�¼� ���</title>
</head>
<body>
<h2>Register Seat</h2>
<form method="post" action="RegisterSeatResult.jsp">
		�¼���ȣ : <input type="text" name="seat_no" maxlength="10"><br/>
		�������� : <input type="text" name="train_name" maxlength="10"><br/>
		   ��߿� : <input type="text" name="src_station" maxlength="10"><br/>
		   ������ : <input type="text" name="dst_station" maxlength="10"><br/>
		��߽ð� : <input type="text" name="src_time" maxlength="10"><br/>
		�ҿ�ð� : <input type="text" name="total_time" maxlength="10"><br/>
	
		
		<input type="submit" value="�Է¿Ϸ�">
	</form>
</body>
</html>