package food;

import java.sql.Date;

public class FoodDTO {
private int head_num;
private String title;
private String content;
private String recipe;
private String mbnum;
private String image;
private String cate;
private Date fooddate;
private String repletext;
private String replembnum;
private String replenickname;
private Date replydate;
private int heartcount;
private int adminassent;

public int getHead_num() {
	return head_num;
}
public void setHead_num(int head_num) {
	this.head_num = head_num;
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
public String getRecipe() {
	return recipe;
}
public void setRecipe(String recipe) {
	this.recipe = recipe;
}
public String getMbnum() {
	return mbnum;
}
public void setMbnum(String mbnum) {
	this.mbnum = mbnum;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getCate() {
	return cate;
}
public void setCate(String cate) {
	this.cate = cate;
}
public Date getFooddate() {
	return fooddate;
}
public void setFooddate(Date fooddate) {
	this.fooddate = fooddate;
}

public String getRepletext() {
	return repletext;
}
public void setRepletext(String repletext) {
	this.repletext = repletext;
}
public String getReplembnum() {
	return replembnum;
}
public void setReplembnum(String replembnum) {
	this.replembnum = replembnum;
}
public String getReplenickname() {
	return replenickname;
}
public void setReplenickname(String replenickname) {
	this.replenickname = replenickname;
}
public Date getReplydate() {
	return replydate;
}
public void setReplydate(Date replydate) {
	this.replydate = replydate;
}
public int getHeartcount() {
	return heartcount;
}
public void setHeartcount(int heartcount) {
	this.heartcount = heartcount;
}
public int getAdminassent() {
	return adminassent;
}
public void setAdminassent(int adminassent) {
	this.adminassent = adminassent;
}
}