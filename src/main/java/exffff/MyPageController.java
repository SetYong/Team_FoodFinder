package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class MyPageController extends HttpServlet {
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String MBNUMstr = req.getParameter("MBNUM");
		int MBNUM = Integer.parseInt(MBNUMstr);
		MemberDTO memberDTO = dao.getProfile(MBNUM);
		System.out.println("mypagecontroller : "+MBNUM);
		
		String nickname = memberDTO.getNickname();
		String email = memberDTO.getEmail();
		String phone = memberDTO.getPhone();
		
		System.out.println("nickname : "+ nickname + " email : "+ email + " phone : "+ phone);
		
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
