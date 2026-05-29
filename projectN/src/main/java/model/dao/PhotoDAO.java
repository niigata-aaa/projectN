package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PhotoDAO {
	
	public PhotoDAO(String photo_data) {
		
	}
	//写真を追加するメソッド
	public int insertPhoto(String photo_data) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO t_photo VALUES (null, 1, 1, null, 0, ?)";

		int cnt = 0;
		
		

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			//pstmt.setInt(1, album_id);
			//pstmt.setInt(2, area_id);
			pstmt.setString(1, photo_data);

			// SQLステートメントの実行
			cnt = pstmt.executeUpdate();
		}

		return cnt;
	}
	
	// 写真を削除する
	public int deletePhoto(int photo_id) throws ClassNotFoundException, SQLException {
		int count = 0;
		
		String sql = "DELETE FROM t_photo WHERE photo_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			pstmt.setInt(1, photo_id);

			// SQLステートメントの実行
			count = pstmt.executeUpdate();
		}
		return count;
	}
}
