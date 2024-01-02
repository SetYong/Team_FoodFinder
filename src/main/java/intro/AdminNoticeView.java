package intro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IntroDAO dao;
	
	public void init() throws ServletException{
		dao = new IntroDAO();
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IntroDTO dto = new IntroDTO();
		try {
			String headnum = request.getParameter("headnum");
			System.out.println(headnum);
			dto = dao.selectView(headnum);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("../Admin/AdminMain.jsp?contentPage=NoticeView.jsp").forward(request, response);
			return; 
			
		} catch(Exception e) {
			System.out.println("공지 사항 작성 중 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
	
}
