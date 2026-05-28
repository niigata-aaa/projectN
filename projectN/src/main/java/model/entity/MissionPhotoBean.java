package model.entity;

import java.io.Serializable;

public class MissionPhotoBean implements Serializable{
	
	private int area_id;
	
	private String area_name;
	
	private String mission_photo_data;
	
	private int mission_photo_id;
	
	private int mission_id;
	
	private String user_id;
	
	
	public MissionPhotoBean() {
		
	}


	public int getArea_id() {
		return area_id;
	}


	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}


	public String getArea_name() {
		return area_name;
	}


	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}


	public String getMission_photo_data() {
		return mission_photo_data;
	}


	public void setMission_photo_data(String mission_photo_data) {
		this.mission_photo_data = mission_photo_data;
	}


	public int getMission_photo_id() {
		return mission_photo_id;
	}


	public void setMission_photo_id(int mission_photo_id) {
		this.mission_photo_id = mission_photo_id;
	}


	public int getMission_id() {
		return mission_id;
	}


	public void setMission_id(int mission_id) {
		this.mission_id = mission_id;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	

}
