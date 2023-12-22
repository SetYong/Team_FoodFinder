package questionBoard;

import java.util.Date;

public class QuestionBoardDTO {
	private int headnum;
	private int mbnum;
	private String userid;
	private String qucate;
	private String title;
	private String content;
	private String answer;
	private Date qudate;
	private int readadmin;
	
	
	public int getHeadnum() {
		return headnum;
	}
	public void setHeadnum(int headnum) {
		this.headnum = headnum;
	}
	public int getMbnum() {
		return mbnum;
	}
	public void setMbnum(Integer mbnum) {
		this.mbnum =  mbnum;
	}
	public String getQucate() {
		return qucate;
	}
	public void setQucate(String qucate) {
		this.qucate = qucate;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getQudate() {
		return qudate;
	}
	public void setQudate(Date qudate) {
		this.qudate = qudate;
	}
	public int getReadadmin() {
		return readadmin;
	}
	public void setReadadmin(int readadmin) {
		this.readadmin = readadmin;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String user_id) {
		this.userid = user_id;
	}
}
