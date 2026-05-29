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
	public int delete(String user_id) throws SQLException,ClassNotFoundException{
		int count = 0;
		
		String sql = "DELETE FROM m_user WHERE user_id = ?";
		
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, user_id);
			
			count = pstmt.executeUpdate();
		}
		return count;
	}
	
	//ユーザを一覧表示するDAO
	public List<UserBean> displayAllUser(String post_id) throws SQLException,ClassNotFoundException{
		List<UserBean> displayAllList = new ArrayList<UserBean>();
		
		//データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery("SELECT * FROM m_post")){
			
			while(res.next()) {
					UserBean user = new UserBean();
					user.setUser_id(res.getString("user_id"));
					user.setPost_id(res.getInt("post_id"));
					displayAllList.add(user);
			}
						
		}
			return displayAllList;
				
				
	}
	
	//ユーザログイン認証
	public boolean login(String user_id,String password)throws ClassNotFoundException,SQLException{
		
		String sql = "SELECT user_id, password FROM m_user WHERE user_id = ? AND password = ?";
		
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1,user_id);
			pstmt.setString(2, password);
			
			ResultSet res = pstmt.executeQuery();
			
			if(res.next()) {
				return true;
			}
			
		}
		return false;
	}
	

		
		public int insertUser(String user_id,String password)throws SQLException,ClassNotFoundException{
			int count = 0;
			
			String sql = "INSERT INTO m_user VALUE(?,?)";
			
			try(Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)){
				
				pstmt.setString(1,user_id);
				pstmt.setString(2,password);
				
				count = pstmt.executeUpdate();
				
				}
			
				return count;
			}

	}



