package food;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import exffff.DBConnPool;

public class FoodDAO extends DBConnPool {
	
	public int insertWrite(FoodDTO dto) {
		int result = 0;
		String query = "Insert INTO Food (title, content, recipe, mbnum, cate) VALUES (?,?,?,?,?)";
		try {
			System.out.println(query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getRecipe());
			psmt.setString(4, dto.getMbnum());
			psmt.setString(5, dto.getCate());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("푸드 게시판 작성 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public FoodDTO selectView(String headnum) {
		FoodDTO dto = new FoodDTO();
		String query = "SELECT * FROM Food WHERE headnum=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);;
			rs= psmt.executeQuery();
			
			if(rs.next()) {
				dto.setHeadnum(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setRecipe(rs.getString(4));
				dto.setMbnum(rs.getString(5));
				dto.setImage(rs.getString(6));
				dto.setCate(rs.getString(7));
				dto.setFooddate(rs.getDate(8));
				dto.setHeartcount(rs.getInt(9));
				//dto.setVistcount
				dto.setAdminassent(rs.getInt(11));
			}
		} catch (Exception e) {
			System.out.println("푸드 게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public FoodDTO getEdit( String content, String image, String text, String title, String heartcount, String cate) {
		FoodDTO vo = new FoodDTO();
		try {
			String updateQuery = "UPDATE FOOD set visitcount=?, image=?, text=?, title=?, heartcount=?, cate=?";

			System.out.println(updateQuery);
			psmt = con.prepareStatement(updateQuery);
			psmt.setString(1, content);
			psmt.setString(2, image);
			psmt.setString(3, text);
			psmt.setString(4, title);
			psmt.setString(5, heartcount);
			psmt.setString(6, cate);
			psmt.executeUpdate();

			System.out.println(content + image + text + title + heartcount + cate);


			vo.setImage(rs.getString(image));
			vo.setContent(rs.getString(content));
			vo.setTitle(rs.getString(title));
			vo.setHeartcount(rs.getInt(heartcount));
			vo.setCate(rs.getString(cate));

			System.out.println(vo.getImage());
			System.out.println(vo.getContent());
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

		String query = "SElECT COUNT(*) FROM Food WHERE ADMINASSENT = 1";

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
	public int selectCountAdmin(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SElECT COUNT(*) FROM Food ";

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
		List<FoodDTO> fbs = new Vector<FoodDTO>();

		String query = "SELECT * FROM (SELECT Tb.*, ROWNUM rNUM FROM(SELECT * FROM Food WHERE ADMINASSENT = 1";
			   query += " ORDER BY headnum desc  ) Tb ) WHERE rNUM BETWEEN ? AND ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				FoodDTO dto = new FoodDTO();
				dto.setHeadnum(rs.getInt("Headnum"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getNString("cate"));
				dto.setFooddate(rs.getDate("fooddate"));
				dto.setHeartcount(rs.getInt("heartcount"));
				dto.setAdminassent(rs.getInt("adminassent"));

				fbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return fbs;
	}
	
	public List<FoodDTO> selectListAdmin(Map<String, Object> map) {
		List<FoodDTO> fbs = new Vector<FoodDTO>();

		String query = "SELECT * FROM (SELECT Tb.*, ROWNUM rNUM FROM(SELECT * FROM Food";
			   query += " ORDER BY headnum desc  ) Tb ) WHERE rNUM BETWEEN ? AND ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				FoodDTO dto = new FoodDTO();
				dto.setHeadnum(rs.getInt("Headnum"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getNString("cate"));
				dto.setFooddate(rs.getDate("fooddate"));
				dto.setHeartcount(rs.getInt("heartcount"));
				dto.setAdminassent(rs.getInt("adminassent"));

				fbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return fbs;
	}
	
	public String checkNickname(String mbnum) {
		String nickName = "";
		String query = "SELECT NICKNAME FROM MEMBER_PROFILE WHERE mbnum = "+ mbnum + " ";
		System.out.println(query + " : : " + mbnum);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			nickName = rs.getString(1);
			
		} catch(Exception e) {
			System.out.println("닉네임 체크 중 예외 발생");
			e.printStackTrace();
		}

		System.out.println(nickName + mbnum);
		return nickName;
	}

	public List<FoodDTO> Reple(Map<String, Object>map){
		List<FoodDTO> repleList = new Vector<FoodDTO>();
		String query = "SELECT * FROM Reply Where headnum = ? ORDER BY replydate ASC";
		System.out.println(query);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("headnum").toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				FoodDTO dto = new FoodDTO();
				dto.setReplembnum(rs.getString("MBNUM"));
				dto.setRepletext(rs.getString("Text"));
				dto.setReplydate(rs.getDate("replydate"));
				dto.setReplenickname(rs.getString("nickname"));

				repleList.add(dto);
			}
			
		} catch(Exception e) {
			System.out.println("푸드게시판 댓글 불러오기 중 예외 발생");
			e.printStackTrace();
		}
		System.out.println("댓글 완료");
		return repleList;
	}
	
	public int ReplyWrite(FoodDTO dto, String headnum) {
		int result = 0;
		String query = "Insert INTO REPLY (headnum, mbnum, TEXT, nickname) VALUES (?,?,?, ?)";
		try {
			System.out.println(query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.setString(2, dto.getReplembnum());
			psmt.setString(3, dto.getRepletext());
			psmt.setString(4, dto.getReplenickname());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("푸드 게시판 댓글 작성 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public void updateAssentYes(String headnum) {
		String query = "UPDATE FOOD SET ADMINASSENT = 1 WHERE HEADNUM = " + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("푸드게시판 관리자 승인 처리 중 예외 발생");
			e.printStackTrace();
		}
	}
	public void updateAssentNo(String headnum) {
		String query = "UPDATE FOOD SET ADMINASSENT = 0 WHERE HEADNUM = " + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("푸드게시판 관리자 승인 처리 중 예외 발생");
			e.printStackTrace();
		}
	}
}