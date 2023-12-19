package mypageBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import exffff.DBConnPool;

public class MyPageBoardDAO extends DBConnPool{
	public MyPageBoardDAO() {
		super();
	}
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM C##foodfinder.diaryBoard";
	// 검색 조건이 있다면 WHERE 절 추가
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			psmt = con.prepareStatement(query);
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
	
	// 검색 조건에 맞는 게시물 목록을 반환합니다.
	public List<MyPageBoardDTO> selectListPage(Map<String, Object> map) {
		List<MyPageBoardDTO> board = new Vector<MyPageBoardDTO>();
		String query = " "
				+ "SELECT * FROM ( "
				+ " 	SELECT Tb.*, dno rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.diaryboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY diarydate DESC "
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyPageBoardDTO dto = new MyPageBoardDTO();
				// mbnum title kcal timecate diarydate dno text image rnum
				dto.setMbnum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setKcal(rs.getString(3));
				dto.setTimacate(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setIdx(rs.getString(6));
				dto.setContent(rs.getString(7));
				dto.setImage(rs.getString(8));
				dto.setRnum(rs.getString(9));
				
				board.add(dto);
				System.out.println("1"+dto.getMbnum());
				System.out.println("2"+dto.getTitle());
				System.out.println("3"+dto.getKcal());
				System.out.println("4"+dto.getTimacate());
				System.out.println("5"+dto.getIdx());
				System.out.println("6"+dto.getContent());
				System.out.println("7"+dto.getImage());
				System.out.println("8"+dto.getRnum());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
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
}
