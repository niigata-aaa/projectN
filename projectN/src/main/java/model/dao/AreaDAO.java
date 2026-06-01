package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.AreaBean;

public class AreaDAO {
	//各市町村を取得する
	public List<AreaBean> allAreaList() throws SQLException, ClassNotFoundException {
		List<AreaBean> areaList = new ArrayList<AreaBean>();
		
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery("SELECT * FROM m_area")){
			
			while(res.next()) {
				AreaBean area = new AreaBean();
				area.setArea_id(res.getInt("area_id"));
				area.setArea_name(res.getString("area_name"));
				areaList.add(area);
		}
	}
		return areaList;
  }
}
