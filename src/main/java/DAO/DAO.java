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
			String sql = "SELECT * FROM Customer WHERE id ='"; 
			sql += userid + "' AND userpass = '";
			sql += userpass + "';";
			stmt = conn.createStatement();
			
			stmt.executeQuery(sql);
			
			if (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
