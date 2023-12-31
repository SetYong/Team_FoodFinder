package exffff;

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
		String admin_pwd = "1234";
		
		String id = req.getParameter("id");
		String pass = req.getParameter("password");
		
		MemberDTO memberDTO = dao.getMember(id, pass);
		int memberMBnum = memberDTO.getMbnum();
		memberDTO = dao.getProfile(memberMBnum);
		System.out.println(id+" "+  pass+" "+ "로그인 했소"+" " + memberMBnum);
		if (memberMBnum>0) {
			req.setAttribute("authMessage", memberMBnum + " 회원 등장");
			req.setAttribute("MBNUM", memberMBnum);
			req.setAttribute("nickname", memberDTO.getNickname());
			req.setAttribute("email", memberDTO.getEmail());
			req.setAttribute("phone", memberDTO.getPhone());
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp").forward(req, resp);
		}
		else {
			if (admin_id.equals(id) && admin_pwd.equals(pass)) {
				resp.sendRedirect("../Admin/AdminMain.jsp");
				return;
			} else {
				System.out.println("로그인 실패");
				req.setAttribute("authMessage", "로그인 실패");
				req.getRequestDispatcher("../Main/Main.jsp?contentPage=../Member/Login.jsp").forward(req, resp);
			}
		}
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}