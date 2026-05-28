package model.entity;

import java.time.LocalDate;

public class AlbumBean {
	private String user_id;
	private int album_id;
	private int area_id;
	private String area_name;
	private LocalDate trip_start;
	private LocalDate trip_end;
	private String companion;
	private String album_name;
	private String memo;
	
	public AlbumBean() {
}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getAlbum_id() {
		return album_id;
	}

	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}

	public int getArea_id() {
		return area_id;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public LocalDate getTrip_start() {
		return trip_start;
	}

	public void setTrip_start(LocalDate trip_start) {
		this.trip_start = trip_start;
	}

	public LocalDate getTrip_end() {
		return trip_end;
	}

	public void setTrip_end(LocalDate trip_end) {
		this.trip_end = trip_end;
	}

	public String getCompanion() {
		return companion;
	}

	public void setCompanion(String companion) {
		this.companion = companion;
	}

	public String getAlbum_name() {
		return album_name;
	}

	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}

}
