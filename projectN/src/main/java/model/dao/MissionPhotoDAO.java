package model.dao;

import java.sql.Connection;
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
}
