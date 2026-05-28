package model.entity;

public class PhotoBean {
	private String photo_data;
	private int photo_id;
	private int is_published;
	private String photo_title;
	private String area_id;
	private String area_name;
	private int album_id;
		
	public PhotoBean(){	
}

	public String getPhoto_data() {
		return photo_data;
	}

	public void setPhoto_data(String photo_data) {
		this.photo_data = photo_data;
	}

	public int getPhoto_id() {
		return photo_id;
	}

	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}

	public int getIs_published() {
		return is_published;
	}

	public void setIs_published(int is_published) {
		this.is_published = is_published;
	}

	public String getPhoto_title() {
		return photo_title;
	}

	public void setPhoto_title(String photo_title) {
		this.photo_title = photo_title;
	}

	public String getArea_id() {
		return area_id;
	}

	public void setArea_id(String area_id) {
		this.area_id = area_id;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public int getAlbum_id() {
		return album_id;
	}

	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}

}
