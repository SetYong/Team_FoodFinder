package intro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IntroViewEventController extends HttpServlet {
	IntroDAO dao;
	
	public void init() throws ServletException{
		dao = new IntroDAO();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IntroDTO dto = new IntroDTO();
		try {
			String headnum = request.getParameter("headnum");
			dao.updateVisitCount(headnum);
			dto = dao.selectView(headnum);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("../Main/Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../Intro/EventView.jsp").forward(request, response);
			return; 
			
		} catch(Exception e) {
			System.out.println("이벤트 상세보기 중 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
