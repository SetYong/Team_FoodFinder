package questionBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class QuestionBoardDAO extends DBConnPool{
	
	public List<QuestionBoardDTO> selectList(Map<String, Object> map) {
		List<QuestionBoardDTO> QuestionBoardList = new Vector<QuestionBoardDTO>();
		
		String query ="SELECT * FROM QUESTIONBOARD ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY head_num desc ";
		
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				QuestionBoardDTO dto = new QuestionBoardDTO();
				
				dto.setHeadnum(rs.getInt("head_num"));
				dto.setQucate(rs.getString("Qucate"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setMbnum(rs.getInt("MBNUM"));
				dto.setQudate(rs.getDate("Qudate"));
				dto.setReadadmin(rs.getInt("ReadAdmin"));
				
				QuestionBoardList.add(dto);
			}
		} catch(Exception e) {
			System.out.println("문의사항 : 게시판 조회 중 예외 발생");
			e.printStackTrace();
		}
		return QuestionBoardList;
	}
	
	public int insertQuWrite(QuestionBoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO QuestionBoard (" 
						 + "Qucate, title, content, mbnum)" 
						 + " Values( " 
						 + "?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getQucate());;
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getMbnum());
			
			System.out.println(query);
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
