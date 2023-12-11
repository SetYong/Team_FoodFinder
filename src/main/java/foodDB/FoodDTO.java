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
public void setHead_num() {
	this.head_num =head_num;
}
public int getVisitcount() {
	return visitcount;
}
public void setVisitcount() {
	this.visitcount =visitcount;
}
public String getImage() {
	return image;
}
public void setImage() {
	this.image =image;
}
public String getText() {
	return text;
}
public void setText() {
	this.text =text;
}
public String getTitle() {
	return title;
}
public void setTitle() {
	this.title =title;
}
public int getMbnum() {
	return mbnum;
}
public void setMbnum() {
	this.mbnum =mbnum;
}
public int getHeartcount() {
	return heartcount;
}
public void setHeartcount() {
	this.heartcount =heartcount;
}
public Date getFooddate() {
	return fooddate;
}
public void setFooddate() {
	this.fooddate = fooddate;
}
public String getCate() {
	return cate;
}
public void setCate() {
	this.cate =cate;
}

}
