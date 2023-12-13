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
		
		String query = "SELECT COUNT(*) FROM MyPageBoard";
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
				+ " 	SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "			SELECT * FROM mypageboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY date DESC "
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
				
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
}
