package food;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import exffff.DBConnPool;

public class FoodDAO extends DBConnPool {
	
	public int insertWrite(FoodDTO dto) {
		int result = 0;
		String query = "Insert INTO C##foodfinder.Food (title, content, recipe, mbnum, image, cate) VALUES (?,?,?,?,?,?)";

		try {
			System.out.println("푸드 게시판 INSERT Query : " + query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getRecipe());
			psmt.setString(4, dto.getMbnum());
			psmt.setString(5, dto.getImage());
			psmt.setString(6, dto.getCate());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("푸드 게시판 작성 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public FoodDTO selectView(String headnum) {
		FoodDTO dto = new FoodDTO();
		String query = "SELECT * FROM C##foodfinder.Food WHERE headnum=?";
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
				dto.setVisitcount(rs.getInt(10));
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
			String updateQuery = "UPDATE C##foodfinder.FOOD set visitcount=?, image=?, text=?, title=?, heartcount=?, cate=?";

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

		String query = "SElECT COUNT(*) FROM C##foodfinder.Food WHERE ADMINASSENT = 1";

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

		String query = "SElECT COUNT(*) FROM C##foodfinder.Food ";

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

		String query = "SELECT * FROM (SELECT Tb.*, ROWNUM rNUM FROM(SELECT * FROM C##foodfinder.Food WHERE ADMINASSENT = 1";
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
				dto.setImage(rs.getString("image"));
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

		String query = "SELECT * FROM (SELECT Tb.*, ROWNUM rNUM FROM(SELECT * FROM C##foodfinder.Food";
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
		String query = "SELECT NICKNAME FROM C##foodfinder.MEMBER_PROFILE WHERE mbnum = "+ mbnum + " ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			nickName = rs.getString(1);
			
		} catch(Exception e) {
			System.out.println("닉네임 체크 중 예외 발생");
			e.printStackTrace();
		}
		return nickName;
	}

	public List<FoodDTO> Reple(Map<String, Object>map){
		List<FoodDTO> repleList = new Vector<FoodDTO>();
		String query = "SELECT * FROM C##foodfinder.Reply Where headnum = ?  AND cate ='reply' ORDER BY replydate ASC";
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
				dto.setReplecate(rs.getString("cate"));
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
	
	public void ReplyWrite(FoodDTO dto, String headnum) {
		int result = 0;
		String query = "Insert INTO C##foodfinder.REPLY (headnum, mbnum, TEXT, cate, nickname) VALUES (?,?,?,?,?)";
		try {
			System.out.println(query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.setString(2, dto.getReplembnum());
			psmt.setString(3, dto.getRepletext());
			psmt.setString(4, dto.getReplecate());
			psmt.setString(5, dto.getReplenickname());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("푸드 게시판 댓글 작성 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public String selectheart(String headnum, String mbnum) {
		String heartstate = "";
		String query = "SELECT * FROM C##FOODFINDER.REPLY WHERE HEADNUM = ? AND mbnum = ? AND cate LIKE '%heart%'";
		System.out.println("selectheart DAO 실행");
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.setString(2, mbnum);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
	            heartstate = rs.getString("cate").toString();
	            System.out.println("하트 상태 DAO : " + heartstate);
	        }
		} catch(Exception e) {
			e.printStackTrace();
		}
		return heartstate;
	}
	
	public void insertHeart(String headnum, String mbnum, String nickname) {
		String query = "Insert INTO C##FOODFINDER.Reply (headnum, mbnum, nickname, text, cate) values (?,?,?,'heart','hearton')";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.setString(2, mbnum);
			psmt.setString(3, nickname);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void Updatehearton(String headnum, String mbnum) {
		String query = "UPDATE C##FOODFINDER.Reply SET cate = 'heartoff' WHERE headnum = ? and mbnum = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.setString(2, mbnum);
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void Updateheartoff(String headnum, String mbnum) {
		String query = "UPDATE C##FOODFINDER.Reply SET cate = 'hearton' WHERE headnum = ? and mbnum = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.setString(2, mbnum);
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateAssentYes(String headnum) {
		String query = "UPDATE C##foodfinder.FOOD SET ADMINASSENT = 1 WHERE HEADNUM = " + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("푸드게시판 관리자 승인 처리 중 예외 발생");
			e.printStackTrace();
		}
	}
	public void updateAssentNo(String headnum) {
		String query = "UPDATE c##foodfinder.FOOD SET ADMINASSENT = 0 WHERE HEADNUM = " + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("푸드게시판 관리자 미승인 처리 중 예외 발생");
			e.printStackTrace();
		}
	}
	public void updateAssentFail(String headnum) {
		String query = "UPDATE C##foodfinder.FOOD SET ADMINASSENT = 2 WHERE HEADNUM = " + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("푸드게시판 관리자 탈락 처리 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public void updateVisitcount(String headnum) {
		String query = "UPDATE C##foodfinder.FOOD SET visitcount=visitcount+1 WHERE HEADNUM =" + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void downVisitcount(String headnum) {
		String query = "UPDATE C##foodfinder.FOOD SET visitcount=visitcount-1 WHERE HEADNUM =" + headnum;
		try {
			psmt = con.prepareStatement(query);
			psmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String headnum) {
		String query = "DELETE FROM C##FOODFINDER.FOOD WHERE HEADNUM=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("푸드게시판 게시글 삭제 처리 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int updatefood(FoodDTO dto, String headnum) {
		int result = 0;
		String query = "UPDATE C##foodfinder.Food SET "
				+ "title=?, content=?, recipe=?, cate=?"
				+ "WHERE headnum=?";

		try {
			System.out.println("푸드 게시판 UPDATE Query : " + query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getRecipe());
			psmt.setString(4, dto.getCate());
			psmt.setString(5, headnum);
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("푸드 게시판 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	// 이미지 업데이트 
	public int updatefoodimage(FoodDTO dto, String headnum) {
		int result = 0;
		String query = "UPDATE C##foodfinder.Food SET "
				+ "image=? WHERE headnum=?";

		try {
			System.out.println("푸드 게시판 image UPDATE Query : " + query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getImage());
			psmt.setString(2, headnum);
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("푸드 게시판 image 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	// 추천게시글
	public FoodDTO RecommandView(String rownum) {
		FoodDTO dto = new FoodDTO();
		String query = "SELECT * FROM ("
				+ "SELECT Tb.*, rownum rNum FROM( "
				+ "SELECT * FROM C##FOODFINDER.FOOD WHERE adminassent = '1' "
				+ "ORDER BY fooddate DESC ) Tb )"
				+ "WHERE rNum=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, rownum);;
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
				dto.setVisitcount(rs.getInt(10));
				dto.setAdminassent(rs.getInt(11));
			}
		} catch (Exception e) {
			System.out.println("푸드 게시물 추천하기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
}