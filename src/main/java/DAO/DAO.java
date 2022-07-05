package DAO;

import Connect.DBConnection;
import DTO.DTO;

public class DAO extends DBConnection {
	public DAO (String driver, String url, String id, String pass) {
		super(driver, url, id, pass);
	}
	public DTO getDTO(String userid, String userpass) {
		DTO dto = new DTO();
		try {
			String sql = "SELECT * FROM Customer WHERE userid =? AND userpass=?"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpass);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setSyslev(rs.getInt(3));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
