package questionBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class QuestionBoardDAO extends DBConnPool{
	public QuestionBoardDAO(){
		super();
	}    
	public List<QuestionBoardDTO> selectList(Map<String, Object> map) {
		List<QuestionBoardDTO> questionBoardList = new Vector<QuestionBoardDTO>();
		
		String query = "SELECT * FROM(SELECT Tb.*, ROWNUM rNUM FROM(SELECT * FROM QUESTIONBOARD";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY head_num desc  ) Tb ) WHERE rNUM BETWEEN ? AND ?";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				QuestionBoardDTO dto = new QuestionBoardDTO();
				
				dto.setHeadnum(rs.getInt("head_num"));
				dto.setQucate(rs.getString("Qucate"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setMbnum(rs.getInt("MBNUM"));
				dto.setQudate(rs.getDate("Qudate"));
				dto.setReadadmin(rs.getInt("ReadAdmin"));
				
				questionBoardList.add(dto);
			}
		} catch(Exception e) {
			System.out.println("문의사항 : 게시판 조회 중 예외 발생");
			e.printStackTrace();
		}
		return questionBoardList;
	}
	
	public List<QuestionBoardDTO> selctListUser(Map<String,Object> map){
		List<QuestionBoardDTO> userList = new Vector<QuestionBoardDTO>();
		
		String query = "SELECT  * FROM(SELECT Tb.*, ROWNUM rNUM FROM(SELECT * FROM QUESTIONBOARD "
					 + "WHERE mbnum = " + map.get("MBNUM")
					 +  " ORDER BY head_num desc  ) Tb ) WHERE rNUM BETWEEN ? AND ?";
		System.out.println("게시물 조회 : " + query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			System.out.println("유저 리스트 넣기 시도");
			System.out.println("rs값 : " + rs);
			if(rs != null) {
				while(rs.next()) {
					System.out.println("dto 생성 시작");
					QuestionBoardDTO dto = new QuestionBoardDTO();
					
					dto.setHeadnum(rs.getInt(1));
					System.out.println("HeadNUM 넣기 시도 : " + rs.getInt(1));
					dto.setQucate(rs.getString(2));
					System.out.println("Qucate 넣기 시도 : " + rs.getString(2));
					dto.setTitle(rs.getString(3));
					System.out.println("Title 넣기 시도 : " + rs.getString(3));
					dto.setContent(rs.getString(4));
					System.out.println("Content 넣기 시도 : " + rs.getString(4));
					dto.setMbnum(rs.getInt(5));
					System.out.println("MBNUM 넣기 시도 : " + rs.getInt(5));
					dto.setImage(rs.getString(6));
					System.out.println("Image 넣기 시도 : " + rs.getString(6));
					dto.setQudate(rs.getDate(7));
					System.out.println("QuDate 넣기 시도 : " + rs.getDate(7));
					dto.setReadadmin(rs.getInt(8));
					System.out.println("ReadAdmin 넣기 시도 : " + rs.getInt(8));
					
					userList.add(dto);
				}
				System.out.println("유저리스트 넣기 완료");
			}
			System.out.println("유저리스트 최종 완료");
		} catch (Exception e) {
			System.out.println("유저 문의사항 : 게시판 조회 중 예외 발생");
			e.printStackTrace();
		}
		return userList;
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
			
			System.out.println(dto.getQucate() + " : "+ dto.getTitle() + " : " + dto.getContent() + " : " + dto.getMbnum());
			System.out.println(query);
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM QuestionBoard ";
		if (map.get("searchWord") != null) {
			query += "Where " + map.get("searchField") + " " + "like '%" + map.get("searchWord") + "%'";
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
	
	public int selectCountUser(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM QuestionBoard "
					 + "where mbnum = " + map.get("MBNUM");

		System.out.println("카운트 : " + query);
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
}
