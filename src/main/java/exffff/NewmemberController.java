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
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String cn = req.getParameter("resident registration number");
		String phone = req.getParameter("phoneNumber");
		String email = req.getParameter("e-mail");
		String nickname = req.getParameter("Nickname");
		
		dao.insertRegister(name, cn, email, phone, nickname);
		MemberDTO memberDTO2 = dao.getMBNUM(name, cn, email, phone, nickname);
		dao.insertLogin(memberDTO2.getMbnum(),id, pass);
		int MBNUM = memberDTO2.getMbnum();
		
		System.out.println("name : "+ name + " cn :"+ cn + " email :"+ email + " phone :"+ phone + " nickname :"+ nickname);
		System.out.println("MBNUM :"+ MBNUM);
		
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}
