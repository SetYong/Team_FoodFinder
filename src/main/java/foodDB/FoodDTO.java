package foodDB;

import java.sql.Date;

public class FoodDTO {
private int head_num;
private int visitcount;
private String image;
private String text;
private String title;
private int mbnum;
private int heartcount;
private Date fooddate;
private String cate;
public int getHead_num() {
	return head_num;
}
public void setHead_num(int head_num) {
	this.head_num = head_num;
}
public int getVisitcount() {
	return visitcount;
}
public void setVisitcount(int visitcount) {
	this.visitcount = visitcount;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getMbnum() {
	return mbnum;
}
public void setMbnum(int mbnum) {
	this.mbnum = mbnum;
}
public int getHeartcount() {
	return heartcount;
}
public void setHeartcount(int heartcount) {
	this.heartcount = heartcount;
}
public Date getFooddate() {
	return fooddate;
}
public void setFooddate(Date fooddate) {
	this.fooddate = fooddate;
}
public String getCate() {
	return cate;
}
public void setCate(String cate) {
	this.cate = cate;
}
}
