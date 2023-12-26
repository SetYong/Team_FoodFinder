package food;

import java.sql.Date;

public class FoodDTO {
private int head_num;
private String title;
private String content;
private String recipe;
private int mbnum;
private String image;
private String cate;
private Date fooddate;
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
public int getMbnum() {
	return mbnum;
}
public void setMbnum(int mbnum) {
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