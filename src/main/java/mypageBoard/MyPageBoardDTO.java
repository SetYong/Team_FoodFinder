package mypageBoard;

public class MyPageBoardDTO {
	private int MBnum;
	private String text;
	private String date;
	private int kcal;
	private String time;
	private String image;
	public int getMBnum() {
		return MBnum;
	}
	public void setMBnum(int mBnum) {
		MBnum = mBnum;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
