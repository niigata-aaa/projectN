package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AlbumDAO {
	public int updateAlbum(String user_id, int Album_id)throws SQLException, ClassNotFoundException{
		int processingNumber = 0;
		
		String sql = "UPDATE t_album SET album_name = ?,trip_start =?, trip_end = ?,companion = ?, memo = ?";
		
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1,album_name);
			pstmt.setDate(2,trip_start);
			pstmt.setDate(3,trip_end);
			pstmt.setString(4,companion);
			pstmt.setString(5,memo);
			
			processingNumber = pstmt.executeUpdate();
			
		}
		return processingNumber;
	}

}
