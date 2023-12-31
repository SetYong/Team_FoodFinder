package exffff;

import java.io.IOException;
import java.io.PrintWriter;

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
		resp.setCharacterEncoding("UTF-8");
		String userId = req.getParameter("id");
		String pwd = req.getParameter("pass");
		String pwdcheck = req.getParameter("passcheck");
		String name = req.getParameter("username");
		String cn1 = req.getParameter("memberCn1");
		String cn2 = req.getParameter("memberCn2");
		String phone1 = req.getParameter("memberPhone1");
		String phone2 = req.getParameter("memberPhone2");
		String phone3 =	req.getParameter("memberPhone3");
		String mail = req.getParameter("mail");
		String nickname = req.getParameter("Nickname");
		String nickpass = req.getParameter("nickpass");

		int idCheck = dao.checkId(userId);
		
		if(idCheck == 0) {
			req.setAttribute("checkpass", "0");
			req.setAttribute("nickpass", nickpass);
			req.setAttribute("id", userId);
			req.setAttribute("pass", pwd);
			req.setAttribute("passcheck", pwdcheck);
			req.setAttribute("username", name);
			req.setAttribute("memberCn1", cn1);
			req.setAttribute("memberCn2", cn2);
			req.setAttribute("memberPhone1", phone1);
			req.setAttribute("memberPhone2", phone2);
			req.setAttribute("memberPhone3", phone3);
			req.setAttribute("mail", mail);
			req.setAttribute("Nickname", nickname);
			System.out.println("NewmemberCheckController : 이미 사용중인 아이디입니다.");
		} else if (idCheck ==1) {
			req.setAttribute("checkpass", "1");
			req.setAttribute("nickpass", nickpass);
			req.setAttribute("id", userId);
			req.setAttribute("pass", pwd);
			req.setAttribute("passcheck", pwdcheck);
			req.setAttribute("username", name);
			req.setAttribute("memberCn1", cn1);
			req.setAttribute("memberCn2", cn2);
			req.setAttribute("memberPhone1", phone1);
			req.setAttribute("memberPhone2", phone2);
			req.setAttribute("memberPhone3", phone3);
			req.setAttribute("mail", mail);
			req.setAttribute("Nickname", nickname);
			System.out.println("NewmemberCheckController : 사용 가능한 아이디입니다.");
		}
		
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/Newmembercheckresult.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}