package mypageBoard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageDeleteController extends HttpServlet{
	MyPageBoardDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MyPageBoardDAO();
	}
	@Override 
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mbnum = Integer.parseInt(req.getParameter("MBNUM"));
		int headnum = Integer.parseInt(req.getParameter("Headnum"));
		
		System.out.println(" MBNUM : "+ mbnum + " Headnum : "+ headnum); 
		dao.deleteDiaryWrtie(mbnum, headnum);
		
		req.getRequestDispatcher("/EXFFFF/MyPage/MyPagelist.do").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}

}