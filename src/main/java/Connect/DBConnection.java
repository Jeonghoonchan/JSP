package Connect;

import java.sql.*;

public class DBConnection {
	
	public Connection conn = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	
	public DBConnection(String driver, String url, String id, String pass) {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 연결 성공!");
			conn = DriverManager.getConnection(url, id, pass);
			System.out.println("DB 연결 성공!");
		}
		catch(Exception e) {
			System.out.println("DB 연결 에러");
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
