package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class NewmemberController extends HttpServlet{
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pass");
		String name = req.getParameter("username");
		String cn = req.getParameter("memberCn1") + "-" + req.getParameter("memberCn2");
		String phone = req.getParameter("memberPhone1")+ "-" + req.getParameter("memberPhone2") + "-" +req.getParameter("memberPhone3");
		String mail = req.getParameter("mail1") + "@" + req.getParameter("mail2");
		String nickname = req.getParameter("Nickname");

		dao.insertRegister(name, cn, mail, phone, nickname);
		MemberDTO memberDTO2 = dao.getMBNUM(name, cn, mail, phone, nickname);
		dao.insertLogin(memberDTO2.getMbnum(),id, pwd);
		int MBNUM = memberDTO2.getMbnum();
		
		System.out.println("name : "+ name + " cn :"+ cn + " mail :"+ mail + " phone :"+ phone + " nickname :"+ nickname);
		System.out.println("MBNUM :"+ MBNUM);
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}
