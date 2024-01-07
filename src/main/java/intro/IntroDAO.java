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
	
	public int selectCountNotice(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM C##foodfinder.introBoard WHERE cate != 'event'";
	// 검색 조건이 있다면 WHERE 절 추가
		if (map.get("searchWord") != null) {
			query += " AND " + map.get("searchField") + " "
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
	
	public int selectCountEvent(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM C##foodfinder.introBoard WHERE cate = 'event'";
		
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
				+ " 	SELECT Tb.*, rownum rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.introboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY introdate DESC "
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				IntroDTO dto = new IntroDTO();
				dto.setHeadnum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setText(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setVisitcount(rs.getString(7));
				
				board.add(dto);
				System.out.println("1 "+dto.getTitle());
				System.out.println("2 "+dto.getText());
				System.out.println("3 "+dto.getHeadnum());
				System.out.println("4 "+dto.getImage());
				System.out.println("5 "+dto.getPostdate());
				System.out.println("6 "+dto.getVisitcount());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public List<IntroDTO> selectListPageNotice(Map<String, Object> map) {
		List<IntroDTO> board = new Vector<IntroDTO>();
		String query = " "
				+ "SELECT * FROM ( "
				+ " 	SELECT Tb.*, rownum rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.introboard Where cate != 'event' ";
		if (map.get("searchWord") != null) {
			query += " AND " + map.get("searchField")
				+ " LIKE '%"+ map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY introdate DESC "
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				IntroDTO dto = new IntroDTO();
				dto.setHeadnum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setText(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setVisitcount(rs.getString(7));
				
				board.add(dto);
				System.out.println("1 "+dto.getTitle());
				System.out.println("2 "+dto.getText());
				System.out.println("3 "+dto.getHeadnum());
				System.out.println("4 "+dto.getImage());
				System.out.println("5 "+dto.getPostdate());
				System.out.println("6 "+dto.getVisitcount());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public List<IntroDTO> selectListPageEvent(Map<String, Object> map) {
		List<IntroDTO> board = new Vector<IntroDTO>();
		String query = " "
				+ "SELECT * FROM ( "
				+ " 	SELECT Tb.*, rownum rNum FROM ( "
				+ "			SELECT * FROM C##foodfinder.introboard Where cate = 'event' "
				+ "			ORDER BY introdate DESC " 
				+"		) Tb "
				+"	) "
				+" WHERE rNum BETWEEN ? AND ?";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				IntroDTO dto = new IntroDTO();
				dto.setHeadnum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setText(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setVisitcount(rs.getString(7));
				dto.setTitleimage(rs.getString(8));
				
				board.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	// 게시물 입력
	public void insertintroWrite(IntroDTO dto) {
		String query = "INSERT INTO c##foodfinder.introBOARD("
				+ "title, text, cate,image, titleimage)"
				+ " VALUES(?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getText());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getImage());
			psmt.setString(5, dto.getTitleimage());
			System.out.println(query);
			psmt.executeUpdate();
			
		}
		catch (Exception e) {
			System.out.println("공지사항 게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	//주어진 일련번호에 해당하는 게시물을 DTO에 담아서 반환합니다.
	public IntroDTO selectView(String headnum) {
		IntroDTO dto = new IntroDTO();
		String query = "SELECT * FROM C##foodfinder.introboard WHERE headnum=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setHeadnum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setText(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setImage(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setVisitcount(rs.getString(7));
				dto.setTitleimage(rs.getString(8));
			}
		}
		catch(Exception e) {
			System.out.println("introdao 게시물 상세보기 중 예외 발생");
			e.printStackTrace();;
		}
		return dto;
	}
	
	// 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킵니다.
	public void updateVisitCount(String headnum) {
		String query = "UPDATE introboard set"
				+" visitcount=visitcount+1"
				+" WHERE headnum=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("introdao 게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	//게시물 삭제
	public void deleteBoard(String headnum) {
		String query = "DELETE FROM C##foodfinder.IntroBoard WHERE headnum = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, headnum);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
