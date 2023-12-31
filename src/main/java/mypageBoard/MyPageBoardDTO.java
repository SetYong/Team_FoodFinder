package mypageBoard;

public class MyPageBoardDTO {
	private String Mbnum;
	private String kcal;
	private String timecate;
	private String headnum;
	private String name;
	private String title;
	private String content;
	private String ofile;
	private String sfile;
	private String pass;
	private String image;
	private String rnum;
	private int downcount;
	private int visitcount;
	private java.sql.Date postdate;
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTimecate() {
		return timecate;
	}
	public void setTimecate(String timecate) {
		this.timecate = timecate;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String Kcal) {
		this.kcal = Kcal;
	}
	public String getMbnum() {
		return Mbnum;
	}
	public void setMbnum(String Mbnum) {
		this.Mbnum = Mbnum;
	}
	public String getHeadnum() {
		return headnum;
	}
	public void setHeadnum(String headnum) {
		this.headnum = headnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
}
