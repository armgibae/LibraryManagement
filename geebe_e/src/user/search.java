package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class search {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public search(){
		try {
			String dbURL = "jdbc:mysql://localhost:3307/db_test?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public ResultSet  searchName(String search) {
		String SQL = "SELECT *FROM book LEFT OUTER JOIN borrow ON book.ISBN=borrow.ISBN where title like %?%";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	public ResultSet resrvationBool(String name) {
		String SQL = "SELECT state FROM book LEFT OUTER JOIN borrow ON book.ISBN=borrow.ISBN where title like %?%";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
}
