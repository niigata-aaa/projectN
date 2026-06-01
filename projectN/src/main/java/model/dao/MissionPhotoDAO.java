package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.MissionPhotoBean;

public class MissionPhotoDAO {
//displayAllPhoto()のDAO
	public List<MissionPhotoBean> displayAllPhoto()
			throws SQLException, ClassNotFoundException{

		List<MissionPhotoBean> MissonPhotoList = new ArrayList<MissionPhotoBean>();

		String sql = "SELECT * FROM t_mission_photo WHERE mission_photo_data";

		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery(sql)){

			while(res.next()){
				String mission_photo_data = res.getString("mission_photo_data");

				MissionPhotoBean missionPhoto = new MissionPhotoBean();
				missionPhoto.setMission_photo_data("mittion_photo_data");

				MissonPhotoList.add(missionPhoto);
			}

		}
		return MissonPhotoList;
	}
	
	// カテゴリー別でミッション写真のリストを取得
	public List<MissionPhotoBean> displayCategoryPhoto(int mission_id, String user_id, int area_id) throws SQLException, ClassNotFoundException{
		List<MissionPhotoBean> missionPhotoList = new ArrayList<MissionPhotoBean>();
		String sql = "SELECT * FROM t_mission_photo WHERE mission_id = ? AND user_id = ? AND area_id = ?;";

		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, mission_id);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, area_id);
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()){
				String mission_photo_data = res.getString("mission_photo_data");

				MissionPhotoBean missionPhoto = new MissionPhotoBean();
				missionPhoto.setMission_photo_id(res.getInt("mission_photo_id"));
				missionPhoto.setUser_id(res.getString("user_id"));
				missionPhoto.setArea_id(res.getInt("area_id"));
				missionPhoto.setMission_id(res.getInt("mission_id"));
				missionPhoto.setUser_id(res.getString("mission_photo_data"));
				
				missionPhotoList.add(missionPhoto);
			}

		}
		
		return missionPhotoList;
	}
	
	// ミッション写真を登録する
	public int insertMissionPhoto(MissionPhotoBean missionPhoto) throws SQLException, ClassNotFoundException{
		int cnt = 0;
		
		String sql = "INSERT INTO t_mission_photo VALUES (null, ?, ?, ?, ?);";

		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setString(1, missionPhoto.getUser_id());
			pstmt.setInt(2, missionPhoto.getArea_id());
			pstmt.setInt(3, missionPhoto.getMission_id());
			pstmt.setString(4, missionPhoto.getMission_photo_data());
			cnt = pstmt.executeUpdate();

		}
		return cnt;
	}
	
	// ミッション写真を削除する
	public int deleteMissionPhoto(int mission_photo_id) throws SQLException, ClassNotFoundException{
		int cnt = 0;
		
		String sql = "DELETE FROM t_mission_photo WHERE mission_photo_id = ?;";

		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, mission_photo_id);
			cnt = pstmt.executeUpdate();

		}
		
		return cnt;
	}
	
	// カテゴリごとの写真の数を取得する
	public int photoCount(int mission_id, String user_id, int area_id) throws SQLException, ClassNotFoundException{
		int cnt = 0;
		
		String sql = "SELECT COUNT(mission_photo_id) AS photoCount FROM t_mission_photo "
				+ "WHERE mission_id = ? AND user_id = ? AND area_id = ?"
				+ "GROUP BY mission_id;";

		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, mission_id);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, area_id);
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()){
				cnt = res.getInt("photoCount");
			}
		}
		
		return cnt;
	}
}
