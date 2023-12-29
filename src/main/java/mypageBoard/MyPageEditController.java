package mypageBoard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageEditController extends HttpServlet{
	MyPageBoardDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MyPageBoardDAO();
	}
	@Override 
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mbnum = req.getParameter("MBNUM");
		int headnum = Integer.parseInt(req.getParameter("Headnum"));
		MyPageBoardDTO dto = dao.selectView(headnum, mbnum);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageedit.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}

}