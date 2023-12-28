package questionBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionBoardDAO dao = new QuestionBoardDAO();
		
		String headnum = request.getParameter("headnum");
		System.out.println(headnum + "번 문의사항 View");
		
		QuestionBoardDTO dto = dao.selectView(headnum);
		dao.close();
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("../Main/Main.jsp").forward(request, response);
	}
}
