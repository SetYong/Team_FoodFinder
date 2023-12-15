package mypageBoard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class MyPageSetprofileController extends HttpServlet {
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String MBNUMstr = req.getParameter("MBNUM");
		int MBNUM = Integer.parseInt(MBNUMstr);
		String pwd = req.getParameter("pwd");
		boolean pass = dao.getPwdpass(MBNUM, pwd);
		
		req.setAttribute("pwdpass", pass);
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageSetprofile.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}