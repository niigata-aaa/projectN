package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PhotoDAO {
	//写真を追加するメソッド
	public int insertPhoto(int album_id, int area_id, String photo_data)throws ClassNotFoundException, SQLException {
		
		String sql = "INSERT INTO t_photo VALUES (null, ?, ?. ?, 0, null)";
		
		int count = 0;
		
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO m_employee VALUES(?, ?, ?, ?)");){
			

						// プレースホルダへの値の設定
						pstmt.setInt(1, album_id);
						pstmt.setInt(2, area_id);
						pstmt.setString(3, photo_data);
	
						// SQLステートメントの実行
						count = pstmt.executeUpdate();
		}
		
		return count;
	}
}
