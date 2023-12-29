package mypageBoard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class MyPageExitpassController extends HttpServlet {
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
		String pass = dao.getPwdpass(MBNUM, pwd);
		
		if( pass.equals("true")) {
			System.out.println("비밀번호 조회 성공");
			req.setAttribute("pwdpass", pass);
			req.setAttribute("authmessage", "비밀번호가 확인되었습니다.");
			req.setAttribute("exitpass", 0);
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageExit.jsp").forward(req, resp);
		} else {
			System.out.println("비밀번호 조회 실패");
			req.setAttribute("authmessage", "비밀번호가 일치하지 않습니다.");
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageExit.jsp").forward(req, resp);
		}
		
	}
	@Override
	public void destroy() {
		dao.close();
	}
}