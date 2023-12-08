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
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = "admin";
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberDTO dto = dao.getUSER_ID(id, pass);
		
		String memberID = dto.getId();
		if(memberID != null) {
			req.setAttribute("loginMessage", memberID + " 회원님 등장");
		}
		else {
			if (admin_id.equals(id)) {
				req.setAttribute("loginMessage", admin_id + "관리자 등장");
			} else {
				req.setAttribute("loginMessage", "비회원 등장");
			}
		}
		req.getRequestDispatcher("/Main/Main.jsp").forward(req, resp);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}
