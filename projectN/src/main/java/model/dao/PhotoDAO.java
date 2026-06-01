package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.PhotoBean;

public class PhotoDAO {
	
	
	public PhotoDAO() {
	}

	
	public PhotoDAO(String photo_data) {
	}
		
	
	//写真を追加するメソッド
	public int insertPhoto(int album_id, int area_id, String photo_data) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO t_photo VALUES (null, ?, ?, null, 0, ?)";

		int cnt = 0;
		
		

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			pstmt.setInt(1, album_id);
			pstmt.setInt(2, area_id);
			pstmt.setString(3, photo_data);

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
	
	//アルバムの写真を表示する
	public List<PhotoBean> displayAlbumPhoto(int origin_album_id)throws ClassNotFoundException, SQLException {
		List<PhotoBean> photolist = new ArrayList<PhotoBean>();
		
		String sql = "SELECT * FROM t_photo WHERE album_id = ?";
		
		
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

		
		pstmt.setInt(1, origin_album_id);
		
		ResultSet res =  pstmt.executeQuery();
		
		while (res.next()) {
			int photo_id = res.getInt("photo_id");
			int album_id = res.getInt("album_id");
			int area_id = res.getInt("area_id");
			String photo_title = res.getString("photo_title");
			int is_published = res.getInt("is_published");
			String photo_data = res.getString("photo_data");
			
			PhotoBean photobean = new PhotoBean();
			photobean.setPhoto_id(photo_id);
			photobean.setAlbum_id(album_id);
			photobean.setArea_id(area_id);
			photobean.setPhoto_title(photo_title);
			photobean.setIs_published(is_published);
			photobean.setPhoto_data(photo_data);
			
			photolist.add(photobean);
		}
		
		}
		
		return photolist;
	}
	
	
	//公開設定の写真をすべて表示する
	public List<PhotoBean> displayAllPublishedPhoto() throws ClassNotFoundException, SQLException {
		List<PhotoBean> publishedphotolist = new ArrayList<PhotoBean>();
		
		String sql = "SELECT * FROM t_photo WHERE is_published = 1";
		
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

		
		ResultSet res =  pstmt.executeQuery();
		
		while (res.next()) {
			int photo_id = res.getInt("photo_id");
			int area_id = res.getInt("area_id");
			String photo_title = res.getString("photo_title");
			int is_published = res.getInt("is_published");
			String photo_data = res.getString("photo_data");
			
			PhotoBean photobean = new PhotoBean();
			photobean.setPhoto_id(photo_id);
			photobean.setArea_id(area_id);
			photobean.setPhoto_title(photo_title);
			photobean.setIs_published(is_published);
			photobean.setPhoto_data(photo_data);
			
			publishedphotolist.add(photobean);
		}
		
		}
		
		return publishedphotolist;
	}
	
	//写真の公開設定を切り替える（公開なら非公開、非公開なら公開）
//	public int setteingChangePhoto (int photo_id, int is_published)throws ClassNotFoundException, SQLException {
//		int cnt = 0;
//		
//		String sql = "UPDATE t_photo SET is_published = ? WHERE photo_id = ?";
//		
//		try (Connection con = ConnectionManager.getConnection();
//				PreparedStatement pstmt = con.prepareStatement(sql);) { 
//			
//			pstmt.setInt(2, photo_id);
//			
//			if (is_published == 0);{
//				pstmt.setInt(1, 1);
//				
//			} else {
//				pstmt.setInt(1, 0);
//			}
//		}
//	}
}
