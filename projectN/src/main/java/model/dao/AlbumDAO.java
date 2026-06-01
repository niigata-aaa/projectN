package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import model.entity.AlbumBean;
import model.entity.UserBean;

public class AlbumDAO {
	public int updateAlbum(AlbumBean album) throws SQLException, ClassNotFoundException {
		int processingNumber = 0;

		String sql = "UPDATE t_album SET album_name = ?,trip_start =?, trip_end = ?,companion = ?, memo = ? "
				+ "WHERE album_id = ?;";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
				
				String album_name = album.getAlbum_name();
				LocalDate trip_start = album.getTrip_start();
				LocalDate trip_end = album.getTrip_end();
				String companion = album.getCompanion();
				String memo = album.getMemo();
				int album_id = album.getAlbum_id();

				pstmt.setString(1,album_name);
				pstmt.setDate(2, Date.valueOf(trip_start));
				pstmt.setDate(3,Date.valueOf(trip_end));
				pstmt.setString(4,companion);
				pstmt.setString(5,memo);
				pstmt.setInt(6, album_id);

			processingNumber = pstmt.executeUpdate();

		}
		return processingNumber;
	}

	// 指定したアルバムIDのアルバム情報を取得する
	public AlbumBean selectAlbum(int album_id)  throws SQLException, ClassNotFoundException {
		AlbumBean album = new AlbumBean();

		String sql = "SELECT album_id, user_id, t_album.area_id, m_area.area_name, trip_start, trip_end, album_name, companion, memo "
				+ "FROM t_album INNER JOIN m_area ON t_album.area_id = m_area.area_id "
				+ "WHERE album_id = ?;";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, album_id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				album.setAlbum_id(res.getInt("album_id"));
				album.setUser_id(res.getString("user_id"));
				album.setArea_id(res.getInt("area_id"));
				album.setArea_name(res.getString("area_name"));
				album.setTrip_start(res.getDate("trip_start").toLocalDate());
				album.setTrip_end(res.getDate("trip_end").toLocalDate());
				album.setAlbum_name(res.getString("album_name"));
				album.setCompanion(res.getString("companion"));
				album.setMemo(res.getString("memo"));
			}
		}
		return album;
	}
	
	// 各市町村のアルバム一覧を取得する
	public List<AlbumBean> displayAllAlbum(UserBean user, int area_id) throws SQLException, ClassNotFoundException {
		List<AlbumBean> albumList = new ArrayList<AlbumBean>();

		String sql = "SELECT album_id, user_id, t_album.area_id, m_area.area_name, trip_start, trip_end, album_name, companion, memo "
				+ "FROM t_album INNER JOIN m_area ON t_album.area_id = m_area.area_id "
				+ "WHERE user_id = ? AND t_album.area_id = ?;";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user.getUser_id());
			pstmt.setInt(2, area_id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				AlbumBean album = new AlbumBean();
				album.setAlbum_id(res.getInt("album_id"));
				album.setUser_id(res.getString("user_id"));
				album.setArea_id(res.getInt("area_id"));
				album.setArea_name(res.getString("area_name"));
				album.setTrip_start(res.getDate("trip_start").toLocalDate());
				album.setTrip_end(res.getDate("trip_end").toLocalDate());
				album.setAlbum_name(res.getString("album_name"));
				album.setCompanion(res.getString("companion"));
				album.setMemo(res.getString("memo"));

				albumList.add(album);
			}
		}
		return albumList;
	}

	//アルバムのinsert
	public int insertAlbum(AlbumBean album) throws SQLException, ClassNotFoundException {
		int key = 0;

		String sql = "INSERT INTO t_album VALUE(null,?,?,?,?,?,?,?)";//インサート内容は8個？

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {

			String user_id = album.getUser_id();
			int area_id = album.getArea_id();
			LocalDate trip_start = album.getTrip_start();
			LocalDate trip_end = album.getTrip_end();
			String companion = album.getCompanion();
			String album_name = album.getAlbum_name();
			String memo = album.getMemo();

			pstmt.setString(1, user_id);
			pstmt.setInt(2, area_id);
			pstmt.setDate(3, Date.valueOf(trip_start));
			pstmt.setDate(4, Date.valueOf(trip_end));
			pstmt.setString(5, album_name);
			pstmt.setString(6, companion);
			pstmt.setString(7, memo);

			int affectedRows = pstmt.executeUpdate();
			
			if(affectedRows > 0) {
				try(ResultSet generatedkeys = pstmt.getGeneratedKeys()){
					if(generatedkeys.next()) {
						key = generatedkeys.getInt(1);
					}
				}
			}

		}

		return key;
	}
	
	//アルバムの削除
	public int deleteAlbum(int album_id)throws SQLException,ClassNotFoundException{
		int count = 0;
		
		String sql = "DELETE FROM t_album WHERE album_id = ?";
		
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1,album_id);
			
			count = pstmt.executeUpdate();
		}
		return count;
	}
}
