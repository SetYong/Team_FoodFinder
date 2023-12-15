package mypageBoard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class MyPageSetprofile extends HttpServlet {
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String MBnumstr = req.getParameter("MBNUM");
		int MBNUM = Integer.parseInt(MBnumstr);
		dao.setProfile(nickname, email, phone, MBNUM);
		
		req.setAttribute("change", "profile");
		req.setAttribute("nickname", nickname);
		req.setAttribute("email", email);
		req.setAttribute("phone", phone);
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageBody.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}