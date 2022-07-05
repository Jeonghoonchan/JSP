package Connect;

import java.sql.*;

public class DBConnection2 {
	
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;

	
	public DBConnection2() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 연결 성공!");
			String url = "jdbc:mysql://localhost:3306/ebookshop";
			String id = "java";
			String pass = "java";
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
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
