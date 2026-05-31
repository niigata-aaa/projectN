package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.UserBean;

public class UserDAO {
	
	//指定されたuser_idのユーザを削除するDAO
	public int deleteUser(String user_id) throws SQLException,ClassNotFoundException{
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
	public List<UserBean> displayAllUser() throws SQLException,ClassNotFoundException{
		List<UserBean> displayAllList = new ArrayList<UserBean>();
		
		//データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery("SELECT * FROM m_user")){
			
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
	

		//ユーザの登録
		public int insertUser(String user_id,String password)throws SQLException,ClassNotFoundException{
			int count = 0;
			
			String sql = "INSERT INTO m_user VALUES(?,?,1)";
			
			try(Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)){
				
				pstmt.setString(1,user_id);
				pstmt.setString(2,password);
				
				count = pstmt.executeUpdate();
				
			}
			
				return count;
		}
	
		
		//ユーザの登録（管理者）
		public int insertAdmin(String user_id,String password)throws SQLException,ClassNotFoundException{
				int count = 0;
					
				String sql = "INSERT INTO m_user VALUE(?,?,2)";
					
				try(Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)){
						
						
					pstmt.setString(1,user_id);
					pstmt.setString(2,password);
			
						
					count = pstmt.executeUpdate();
						
					}
					
					return count;
			}
		//displaySelectUser(String user_id)のDAO
		public UserBean displaySelectUser(String user_id) throws SQLException, ClassNotFoundException {
			UserBean user = new UserBean();
			String sql = "SELECT * FROM m_user WHERE user_id = ?";
			//データベースへの接続の取得、PreparedStatementの取得
			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)) {
				//プレースホルダへの値の設定
				pstmt.setString(1, user_id);
				//SQLステートメントの実行
				ResultSet res = pstmt.executeQuery();
				//結果の操作
				while (res.next()) {
					user.setUser_id(res.getString("user_id"));
					user.setPost_id(res.getInt("post_id"));
				}
			}
			return user;
		}
		
		
		//displaySelectUser(int post_id)のDAO
		public List<UserBean> displaySelectUser(int post_id) throws SQLException, ClassNotFoundException {
			List<UserBean> displaySelectUser = new ArrayList<UserBean>();
			//データベースへの接続の取得、Statementの取得、SQLステートメントの実行
			try (Connection con = ConnectionManager.getConnection();
					Statement stmt = con.createStatement();
					ResultSet res = stmt.executeQuery("SELECT * FROM m_post")) {
				while (res.next()) {
					UserBean user = new UserBean();
					user.setUser_id(res.getString("user_id"));
					user.setPost_id(res.getInt("post_id"));
					displaySelectUser.add(user);
}
			}
			return displaySelectUser;
		}

	}



