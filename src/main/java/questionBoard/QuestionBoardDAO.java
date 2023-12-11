package questionBoard;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.DBConnPool;

public class QuestionBoardDAO extends DBConnPool{
	
	public List<QuestionBoardDTO> selectList() {
		List<QuestionBoardDTO> QuestionBoardList = new Vector<QuestionBoardDTO>();
		
		String query ="SELECT * FROM QUESTIONBOARD";
		
		try {
			
		} catch(Exception e) {
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
