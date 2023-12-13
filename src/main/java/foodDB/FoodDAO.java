package foodDB;

import java.sql.Date;
import java.sql.ResultSet;

import common.DBConnPool;
import foodDB.FoodDTO;

public class FoodDAO extends DBConnPool {
	public FoodDTO getList(String visitcount, String image, String text, String title, String heartcount, String cate) {
		FoodDTO vo = new FoodDTO();
		
		try {
			String insertQuery = "INSERT INTO FOOD(head_num,visitcount, image, text, title,mbnum,heartcount, cate) VALUES(5,?,?,?,?,1,?,?)";
			
			psmt = con.prepareStatement(insertQuery);
			psmt.setString(1, visitcount);
			psmt.setString(2, image);
			psmt.setString(3, text);
			psmt.setString(4, title);
			psmt.setString(5, heartcount);
			psmt.setString(6, cate);
			psmt.executeUpdate();

			System.out.println(insertQuery);
			System.out.println(visitcount + image + text + title + heartcount + cate);
			
			
			vo.setVisitcount();
			vo.setImage();
			vo.setText();
			vo.setTitle();
			vo.setHeartcount();
			vo.setCate();

			System.out.println(vo.getVisitcount());
			System.out.println(vo.getImage());
			System.out.println(vo.getText());
			System.out.println(vo.getTitle());
			System.out.println(vo.getHeartcount());
			System.out.println(vo.getCate());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;

	}
}
