package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	//管理者が写真を登録する
	public int adminInsertPhoto(String photo_title, int area_id, String photo_data)
			throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO t_photo VALUES (null, null, ?, ?, 1, ?)";

		int cnt = 0;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			pstmt.setInt(1, area_id);
			pstmt.setString(2, photo_title);
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
	public List<PhotoBean> displayAlbumPhoto(int origin_album_id) throws ClassNotFoundException, SQLException {
		List<PhotoBean> photolist = new ArrayList<PhotoBean>();

		String sql = "SELECT * FROM t_photo WHERE album_id = ?";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setInt(1, origin_album_id);

			ResultSet res = pstmt.executeQuery();

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

		String sql = "SELECT t_photo.photo_id, t_photo.area_id, m_area.area_name, t_photo.photo_title, t_photo.is_published, t_photo.photo_data "
				+ "FROM t_photo LEFT JOIN m_area ON t_photo.area_id = m_area.area_id "
				+ "WHERE is_published = 1 ORDER BY t_photo.photo_id DESC;";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				int photo_id = res.getInt("photo_id");
				int area_id = res.getInt("area_id");
				String photo_title = res.getString("photo_title");
				int is_published = res.getInt("is_published");
				String photo_data = res.getString("photo_data");
				String area_name = res.getString("area_name");

				PhotoBean photobean = new PhotoBean();
				photobean.setPhoto_id(photo_id);
				photobean.setArea_id(area_id);
				photobean.setPhoto_title(photo_title);
				photobean.setIs_published(is_published);
				photobean.setPhoto_data(photo_data);
				photobean.setArea_name(area_name);

				publishedphotolist.add(photobean);
			}

		}

		return publishedphotolist;
	}

	//写真の公開設定を切り替える&タイトルを付与する（公開なら非公開、非公開なら公開）
	public int setteingChangePhoto(int photo_id, int is_published, String photo_title)
			throws ClassNotFoundException, SQLException {
		int cnt = 0;

		String sql = "UPDATE t_photo SET is_published = ?, photo_title = ? WHERE photo_id = ?";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setInt(1, is_published);
			pstmt.setString(2, photo_title);
			pstmt.setInt(3, photo_id);
			cnt = pstmt.executeUpdate();

			return cnt;
		}
	}

	//photo_idで写真を選ぶ
	public PhotoBean displaySelectPhoto(String origin_photo_id) throws ClassNotFoundException, SQLException {

		String sql = "SELECT * FROM t_photo WHERE photo_id = ?";
		PhotoBean photobean = new PhotoBean();

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setString(1, origin_photo_id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				int photo_id = res.getInt("photo_id");
				int album_id = res.getInt("album_id");
				int area_id = res.getInt("area_id");
				String photo_title = res.getString("photo_title");
				int is_published = res.getInt("is_published");
				String photo_data = res.getString("photo_data");

				photobean.setPhoto_id(photo_id);
				photobean.setAlbum_id(album_id);
				photobean.setArea_id(area_id);
				photobean.setPhoto_title(photo_title);
				photobean.setIs_published(is_published);
				photobean.setPhoto_data(photo_data);
			}
		}
		return photobean;
	}

	// 特定のarea_idの公開写真リストを取得する
	public List<PhotoBean> areaPublishedPhoto(int selectArea_id) throws ClassNotFoundException, SQLException {
		List<PhotoBean> publishedphotolist = new ArrayList<PhotoBean>();

		String sql = "SELECT t_photo.photo_id, t_photo.area_id, m_area.area_name, t_photo.photo_title, t_photo.is_published, t_photo.photo_data "
				+ "FROM t_photo LEFT JOIN m_area ON t_photo.area_id = m_area.area_id "
				+ "WHERE is_published = 1 AND t_photo.area_id = ? ORDER BY t_photo.photo_id DESC;";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			
			pstmt.setInt(1, selectArea_id);
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				int photo_id = res.getInt("photo_id");
				int area_id = res.getInt("area_id");
				String photo_title = res.getString("photo_title");
				int is_published = res.getInt("is_published");
				String photo_data = res.getString("photo_data");
				String area_name = res.getString("area_name");

				PhotoBean photobean = new PhotoBean();
				photobean.setPhoto_id(photo_id);
				photobean.setArea_id(area_id);
				photobean.setPhoto_title(photo_title);
				photobean.setIs_published(is_published);
				photobean.setPhoto_data(photo_data);
				photobean.setArea_name(area_name);

				publishedphotolist.add(photobean);
			}
		}

		return publishedphotolist;
	}

	//　各市町村ごとのランダムな公開写真を取得
	public Map<Integer, PhotoBean> publishPhotoMap() throws ClassNotFoundException, SQLException {
		Map<Integer, PhotoBean> ramdomPhotos = new HashMap<>();
		String sql = "SELECT area_id, photo_data, photo_title FROM t_photo WHERE is_published = 1 ORDER BY RAND();";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				int areaId = res.getInt("area_id");
				String photoData = res.getString("photo_data");
				String photoTitle = res.getString("photo_title");

				if (!ramdomPhotos.containsKey(areaId)) {
					PhotoBean photo = new PhotoBean();
					photo.setArea_id(areaId);
					photo.setPhoto_data(photoData);
					photo.setPhoto_title(photoTitle);

					ramdomPhotos.put(areaId, photo);
				}
			}
		}

		return ramdomPhotos;
	}
}
