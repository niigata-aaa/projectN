package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {//指定されたuser_idのユーザを削除するDAO
	public int delete(String user_id) throws SQLException{
		int count = 0;
		
		String sql = "DELETE FROM m_user WHERE user_id = ?";
		
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, user_id);
			
			count = pstmt.executeUpdate();
		}
		return count;
	}
}
