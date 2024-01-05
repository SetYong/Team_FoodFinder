package exffff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class FindControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberName = req.getParameter("memberName");

		String memberCn = req.getParameter("memberCn1");
			   memberCn += "-";
			   memberCn += req.getParameter("memberCn2");
			   
		String memberPhone = req.getParameter("memberPhone");
		String memberPhoneformat = memberPhone.substring(0, 3) + "-" + memberPhone.substring(3, 7) + "-" + memberPhone.substring(7);
		
		System.out.println(memberName + " : " + memberCn + " : " + memberPhoneformat);
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberId(memberName, memberCn, memberPhoneformat);
		memberDTO.setName(memberName);
		dao.close();
		System.out.println("가져온 ID " + memberDTO.getId());
		
		if(memberDTO.getId() != null) {
			req.setAttribute("memberName",memberDTO.getName());
			req.setAttribute("memberId",memberDTO.getId());
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/FindIdResult.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("LoginErrMsg", "입력하신 정보의 회원을 찾지 못하였습니다.");
			req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/FindIdHome.jsp").forward(req, resp);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
