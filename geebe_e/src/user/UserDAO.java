package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import jdk.nashorn.internal.ir.SetSplitState;

import java.sql.PreparedStatement;

public class UserDAO { // user DB에 접근하는 클래스
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/db_test?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User userInformation(String ID) {
		try {
			String query = "SELECT * FROM user where ID= ?";
			User tempUser = new User();

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				tempUser.setID(rs.getString(1));
				tempUser.setPW(rs.getString(2));
				tempUser.setEmail(rs.getString(3));
				tempUser.setPhone(rs.getString(4));
				tempUser.setUser_type(rs.getString(5));
				tempUser.setCount(rs.getInt(6));
				tempUser.setName(rs.getString(7));
			}

			return tempUser;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int userWithdraw(String ID, String PW) { // 회원탈퇴
		try {
			String query = "DELETE FROM user WHERE ID= ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ID);
			pstmt.executeUpdate();

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}


	public ResultSet checkMyBook(String ID) {

		try {
			String query = 
					"select title from book where book.isbn="
					+ "Any(select isbn from borrow where borrow.id=?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			
			return rs;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int returnRequest(String BookName) {
		try {
			String query = 
					"update borrow set state='2' where (select isbn from book where book.title = ?) =borrow.ISBN";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, BookName);
			pstmt.executeUpdate();
			
			return 1;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int changeUserInfo(String ID, String PW, String name,String email, String phone, String user_type) {
		try {
			if(!PW.equals(null)&&!name.equals(null)&&!email.equals(null)
					&&!phone.equals(null)&&!user_type.equals(null)) {
			String query = "UPDATE user SET PW = ?, name=?, email=?, phone=? , user_type=? Where ID= ?";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, PW);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, user_type);
			pstmt.setString(6, ID);
			pstmt.executeUpdate();

			return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int login(String ID, String PW) { // 로그인
		String SQL = "SELECT PW FROM USER where ID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(PW)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비번틀림
			}
			return -1; // 아이디가 틀렸나..
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public int join(User user) {
		String SQL = "insert into user values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getID());
			pstmt.setString(2, user.getPW());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getUser_type());
			pstmt.setInt(6, user.getCount());
			pstmt.setString(7, user.getName());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
