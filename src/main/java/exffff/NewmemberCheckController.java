package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;

public class NewmemberCheckController extends HttpServlet{
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("newmembercheck controller 입장!");
		String id = req.getParameter("id");
		String check = dao.checkId(id);
		
		if( check.equals("true")) {
			System.out.println("아이디 사용 가능");
			req.setAttribute("checkid", id);
			req.setAttribute("checkidmessage", "사용가능한 아이디입니다.");
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/Newmember.jsp").forward(req, resp);
		} else {
			System.out.println("아이디 중복으로 사용 불가능 ");
			req.setAttribute("checkid", id);
			req.setAttribute("checkmessage", "이미 사용중인 아이디입니다.");
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/Newmember.jsp").forward(req, resp);
		}
	}
	@Override
	public void destroy() {
		dao.close();
	}
}