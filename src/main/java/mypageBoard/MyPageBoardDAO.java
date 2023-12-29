package mypageBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import exffff.DBConnPool;
import intro.IntroDTO;

public class MyPageBoardDAO extends DBConnPool{
	public MyPageBoardDAO() {
		super();
	}
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
	public int selectCount(Map<String, Object> map, String mbnum) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM C##foodfinder.diaryBoard WHERE mbnum=?";
	// 검색 조건이 있다면 WHERE 절 추가
		if (map.get("searchWord") != null) {
			query += " AND " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mbnum);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 내가 작성한 일기 조회
	public List<MyPageBoardDTO> selectListPage(Map<String, Object> map, String mbnum) {
		List<MyPageBoardDTO> board = new Vector<MyPageBoardDTO>();
		String query = " "
				+ "SELECT * FROM ( "
				+ " 	SELECT Tb.*, rownum rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.diaryboard where mbnum=?";
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY diarydate DESC "
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mbnum);
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyPageBoardDTO dto = new MyPageBoardDTO();
				// headnum mbnum title kcal timecate diarydate dno text image rnum
				dto.setHeadnum(rs.getString(1));
				dto.setMbnum(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setKcal(rs.getString(4));
				dto.setTimacate(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setContent(rs.getString(7));
				dto.setImage(rs.getString(8));
				dto.setRnum(rs.getString(9));
				
				board.add(dto);
				System.out.println("1 "+dto.getMbnum());
				System.out.println("2 "+dto.getTitle());
				System.out.println("3 "+dto.getKcal());
				System.out.println("4 "+dto.getTimacate());
				System.out.println("5 "+dto.getHeadnum());
				System.out.println("6 "+dto.getContent());
				System.out.println("7 "+dto.getImage());
				System.out.println("8 "+dto.getRnum());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	// 내가 작성한 레시피 조회
	public List<MyPageBoardDTO> selectfoodListPage(Map<String, Object> map, String mbnum) {
		List<MyPageBoardDTO> board = new Vector<MyPageBoardDTO>();
		String query = " "
				+ "SELECT * FROM ( "
				+ " 	SELECT Tb.*, rownum rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.food where mbnum=?";
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY fooddate DESC "
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mbnum);
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyPageBoardDTO dto = new MyPageBoardDTO();
				// head_num title content(재료) recipe mbnum image cate fooddate heartcount adminassent visitcount
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int selectfoodCount(Map<String, Object> map, String mbnum) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM C##foodfinder.food WHERE mbnum=?";
	// 검색 조건이 있다면 WHERE 절 추가
		if (map.get("searchWord") != null) {
			query += " AND " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mbnum);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("내가 작성한 레시피 게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 게시물 입력
	public void insertDiaryWrtie(int mbnum, String title, String timecate, String text, String image) {
		String query = "INSERT INTO c##foodfinder.DIARYBOARD("
				+ "mbnum, title, timecate, text, image)"
				+ " VALUES(?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, mbnum);
			psmt.setString(2, title);
			psmt.setString(3, timecate);
			psmt.setString(4, text);
			psmt.setString(5, image);
			System.out.println(query);
			psmt.executeUpdate();
			
		}
		catch (Exception e) {
			System.out.println("다이어리 게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
	}
	//주어진 일련번호에 해당하는 게시물을 DTO에 담아서 반환합니다.
		public MyPageBoardDTO selectView(int idx, String mbnum) {
			MyPageBoardDTO dto = new MyPageBoardDTO();
			String query = "SELECT * FROM C##foodfinder.diaryboard WHERE headnum=? and mbnum=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setInt(1, idx);
				psmt.setString(2, mbnum);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto.setHeadnum(rs.getString(1));
					dto.setMbnum(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setKcal(rs.getString(4));
					dto.setTimacate(rs.getString(5));
					dto.setPostdate(rs.getDate(6));
					dto.setContent(rs.getString(7));
					dto.setImage(rs.getString(8));
				}
			}
			catch(Exception e) {
				System.out.println("mypage 게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
}
