package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReservationDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String ticket = "";

	public ReservationDAO() {
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
	
	public String whatIsFirstEndTime(String ISBN) {
		String SQL = "select end_date from db_test.borrow where ISBN = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 return rs.getString("end_date");
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "";
	}
	
	public String whatIsUserType(String userID) {
		String SQL = "select user_type from db_test.user where ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				return rs.getString("user_type");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	public String whatIsUserID(String ISBN, String reservation_order) {
		String SQL = "select ID from db_test.reservation where ISBN = ? and reservation_order = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			pstmt.setString(2, reservation_order);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				return rs.getString("ID");
			
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "";
	}
	
	public void MinusReservation_order(String ISBN, String reservation_order) {
		String SQL = "update db_test.reservation set reservation_order = reservation_order - 1 where ISBN = ? and reservation_order > ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			pstmt.setString(2, reservation_order);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	public void removeReservation(String ISBN, String userID) {
		System.out.println(ISBN);
		System.out.println(userID);
		String SQL = "delete from db_test.reservation where ISBN = ? and ID = ?";
			
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
			
			

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public String getMyReservation_order(String ISBN, String userID) {
		String SQL = "select reservation_order from db_test.reservation where ISBN = ? and ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			pstmt.setString(2, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString("reservation_order");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
		
		
	}
	

	public int getReservation_order(String ISBN) {
		String SQL = "select reservation_order from db_test.reservation " + "where ISBN = ?";
		int  count=0;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count++;
			}
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;
	}

	public String getBookTitle(String ISBN) {
		String SQL = "select title from db_test.book where ISBN = ?";
		String temp = "";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ISBN);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				temp = rs.getString("title");
			}
			return temp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "";
	}

	public ResultSet getMyReservationInfo(String userid) {
		String SQL = "select db_test.book.ISBN, db_test.book.title," + " db_test.reservation.reservation_order from "
				+ "db_test.book inner join db_test.reservation " + "where db_test.reservation.ID = ? and "
						+ "db_test.book.ISBN = db_test.reservation.ISBN";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public void RunningReservation(String ISBN, String ID, String reservation_order) {
		String SQL = "insert db_test.reservation values(?,?,?)";

		try {
		
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reservation_order);
			pstmt.setString(2, ID);
			pstmt.setString(3, ISBN);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void setCancelPay(String seat_no) {
		String SQL = "update db_test.seat set is_saled = 0 where seat_no = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seat_no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean is_saled(String seat_no) {
		String SQL = "select * from db_test.seat where seat_no = ? AND is_saled = 1";// 팔린게있니?
		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seat_no);
			rs = pstmt.executeQuery();
			if (rs != null)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public void CancelPay(String userID) {
		String SQL = "update db_test.user set userHistory = null, userTicket = null where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void setSeatListResultSet() {
		String SQL = "SELECT * FROM db_test.seat where is_saled = 0";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ResultSet getHaveMileageResultSet(String userID) {
		String SQL = "SELECT userMileage from db_test.user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public ResultSet RunningPay(String Seatno) {
		String SQL = "update db_test.seat set is_saled = 1 where seat_no = ?";

		try {

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, Seatno);
			pstmt.executeUpdate();

			SQL = "select * from db_test.seat where seat_no = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, Seatno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ticket += "seat_no  : " + rs.getString("seat_no") + "\n";
				ticket += "train_name : " + rs.getString("train_name") + "\n";
				ticket += "src_station  : " + rs.getString("src_station") + "\n";
				ticket += "dst_station  : " + rs.getString("dst_station") + "\n";
				ticket += "src_time  : " + rs.getString("src_time") + "\n";
				ticket += "total_time  : " + rs.getString("total_time") + "\n";

			}

			rs.beforeFirst();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public void setTicket(String userid) {
		String SQL = "update db_test.user set userTicket = ? where userID = ?";
		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ticket);
			pstmt.setString(2, userid);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SQL = "update db_test.user set userHistory = ? where userID = ?";
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String current = "pay time : ";
		current += format1.format(time) + "\n";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, current + ticket);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void setHavePaymethodResultSet(String userID) {
		String SQL = "select userPayMethod from db_test.user where userID= ?";
		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ResultSet getSeatListResultSet() {
		setSeatListResultSet();
		return this.rs;
	}

	public ResultSet getHavePayMethodResultSet(String userID) {
		setHavePaymethodResultSet(userID);
		return this.rs;
	}

}