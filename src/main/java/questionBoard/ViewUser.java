package questionBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.FoodDAO;

public class ViewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionBoardDAO dao;
	
	public void init() throws ServletException{
		dao = new QuestionBoardDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String headnum = request.getParameter("headnum");
		System.out.println(headnum + "번 문의사항 View");
		
		QuestionBoardDTO dto = dao.selectView(headnum);
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionView.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("내 질문 사항 게시판 상세보기 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}
