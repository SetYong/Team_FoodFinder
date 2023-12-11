package foodDB;

import java.sql.Date;

import common.DBConnPool;
import foodDB.FoodDTO;

public class FoodDAO extends DBConnPool {
	public FoodDTO getHead_num(int head_num, int visitcount, String image, String text, 
			String title, int mbnum, int heartcount, Date fooddate, String cate ) {
		FoodDTO vo = new FoodDTO();
		String insertQuery = "INSERT INTO FOOD(head_num, visitcount, image, text, title, mbnum, heartcount, fooddate, cate) VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(insertQuery);
			psmt.setInt(1, head_num);
			psmt.setInt(2, visitcount);
			psmt.setString(3, image);
			psmt.setString(4, text);
			psmt.setString(5, title);
			psmt.setInt(6, mbnum);
			psmt.setInt(7, heartcount);
			psmt.setDate(8, fooddate);
			psmt.setString(9, cate);
			psmt.executeUpdate();
			
			System.out.println(insertQuery);
			System.out.println(head_num + visitcount + image + text + title + mbnum + heartcount + fooddate + cate);
			
			if((this.rs !=null && this.rs.next())) {
				vo.setHead_num();
				vo.setVisitcount();
				vo.setImage();
				vo.setText();
				vo.setTitle();
				vo.setMbnum();
				vo.setHeartcount();
				vo.setFooddate();
				vo.setCate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}
