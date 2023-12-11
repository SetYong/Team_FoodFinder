package EXFFF;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class FoodLogin extends HttpServlet {
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = "admin_id";
		
		String id = req.getParameter("id");
		String pass = req.getParameter("password");
		
		MemberDTO memberDTO = dao.getMember(id, pass);
		
		int memberMBnum = memberDTO.getMbnum();
		System.out.println(id+" "+  pass+" "+ "1111"+" " + memberMBnum);
		if (memberMBnum>0) {
			req.setAttribute("authMessage", memberMBnum + " 회원 등장");
			req.setAttribute("MBNUM", memberMBnum);
		}
		else {
			if (admin_id.equals(id)) {
				req.setAttribute("authMessage", admin_id +"는 관리자");
			} else {
				req.setAttribute("authMessage", "비회원 등장");
			}
		}
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp").forward(req, resp);
		
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}