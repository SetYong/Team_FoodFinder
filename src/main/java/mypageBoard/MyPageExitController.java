package mypageBoard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;

public class MyPageExitController extends HttpServlet {
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mbnum = Integer.parseInt(req.getParameter("MBNUM"));
		dao.deleteMember(mbnum);
		req.getRequestDispatcher("/EXFFFF/Member/Logout.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}