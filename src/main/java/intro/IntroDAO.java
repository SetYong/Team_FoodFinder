package intro;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import exffff.DBConnPool;

public class IntroDAO extends DBConnPool{
	public IntroDAO() {
		super();
	}
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM C##foodfinder.introBoard";
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
	public List<IntroDTO> selectListPage(Map<String, Object> map) {
		List<IntroDTO> board = new Vector<IntroDTO>();
		String query = " "
				+ "SELECT * FROM ( "
				+ " 	SELECT Tb.*, idx rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.introboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY introdate DESC "
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				IntroDTO dto = new IntroDTO();
			
				dto.setTitle(rs.getString(1));
				dto.setText(rs.getString(2));
				dto.setIdx(rs.getString(3));
				dto.setImage(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				
				board.add(dto);
				System.out.println("1"+dto.getTitle());
				System.out.println("2"+dto.getText());
				System.out.println("3"+dto.getIdx());
				System.out.println("4"+dto.getImage());
				System.out.println("5"+dto.getPostdate());
				System.out.println("6"+dto.getVisitcount());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	// 게시물 입력
	public void insertintroWrite(String title,String text, String image) {
		String query = "INSERT INTO c##foodfinder.introBOARD("
				+ "title, text, image)"
				+ " VALUES(?, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, text);
			psmt.setString(3, image);
			System.out.println(query);
			psmt.executeUpdate();
			
		}
		catch (Exception e) {
			System.out.println("공지사항 게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
	}
}
