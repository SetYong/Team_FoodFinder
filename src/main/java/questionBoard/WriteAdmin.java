package questionBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WriteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionBoardDAO dao;
	
	public void init() throws ServletException{
		dao = new QuestionBoardDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String headnum = request.getParameter("headnum");
		System.out.println(request.getParameter("headnum") + "번 문의사항 답신");
		
		QuestionBoardDTO dto = new QuestionBoardDTO();
		dto.setHeadnum(Integer.parseInt(headnum));
		dto.setAnswer(request.getParameter("answer")); 
		
		dao.UpdateAnswer(dto);
		System.out.println("답신 완료");
		dao.updateReadAdmim(headnum);
		System.out.println("Update Read Admin 변경 완료");
		
		request.getRequestDispatcher("/EXFFFF/Admin/AdminMain.jsp?contentPage=AdminQuestion.do").forward(request, response);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}

}
