package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.UserBean;

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
	
	public List<UserBean> displayAllUser(String post_id) throws SQLException,ClassNotFoundException{
		List<UserBean> displayAllList = new ArrayList<UserBean>();
		
		//データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery("SELECT * FROM m_post")){
			
			while(res.next()) {
					UserBean user = new UserBean();
					user.setPost_id(res.getString("post_id"));
					user.setPost_name(res.getString("post_name"));
					List.add(user);
			}
						
		}
			return displayAllList;
				
				
	}

}


