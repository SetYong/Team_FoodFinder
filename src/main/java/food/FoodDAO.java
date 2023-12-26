package food;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class FoodDAO extends DBConnPool {
	
	public int insertWrite(FoodDTO dto) {
		int result = 0;
		String query = "Insert INTO Food (title, content recipe, mbnum, cate) VALCUES ( ";
		try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public FoodDTO getList(String visitcount, String image, String text, String title, String heartcount, String cate) {
		FoodDTO vo = new FoodDTO();
		try {
			String insertQuery = "INSERT INTO FOOD(visitcount, image, text, title, heartcount, cate) VALUES(?,?,?,?,?,?)";

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

			vo.setVisitcount(rs.getInt(visitcount));
			vo.setImage(rs.getString(image));
			vo.setText(rs.getString(text));
			vo.setTitle(rs.getString(title));
			vo.setHeartcount(rs.getInt(heartcount));
			vo.setCate(rs.getString(cate));

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

	public FoodDTO getEdit( String visitcount, String image, String text, String title, String heartcount, String cate) {
		FoodDTO vo = new FoodDTO();
		try {
			String updateQuery = "UPDATE FOOD set visitcount=?, image=?, text=?, title=?, heartcount=?, cate=?";

			System.out.println(updateQuery);
			psmt = con.prepareStatement(updateQuery);
			psmt.setString(1, visitcount);
			psmt.setString(2, image);
			psmt.setString(3, text);
			psmt.setString(4, title);
			psmt.setString(5, heartcount);
			psmt.setString(6, cate);
			psmt.executeUpdate();

			System.out.println(visitcount + image + text + title + heartcount + cate);

			vo.setVisitcount(rs.getInt(visitcount));
			vo.setImage(rs.getString(image));
			vo.setText(rs.getString(text));
			vo.setTitle(rs.getString(title));
			vo.setHeartcount(rs.getInt(heartcount));
			vo.setCate(rs.getString(cate));

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

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SElECT * FROM Food";
		if (map.get("searchWord") != null) {
			query += "WHERE" + map.get("searchField") + " " + " LIKE '% " + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<FoodDTO> selectList(Map<String, Object> map) {
		List<FoodDTO> bbs = new Vector<FoodDTO>();

		String query = "SELECT * FROM FOOD";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " Like '%" + map.get("searchWord") + "%' ";
		}
		

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				FoodDTO dto = new FoodDTO();
				dto.setText(rs.getString("text"));
				dto.setHead_num(rs.getInt("Head_num"));
				dto.setTitle(rs.getString("title"));
				dto.setFooddate(rs.getDate("fooddate"));
				dto.setVisitcount(rs.getInt("visitcount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;

	}

}