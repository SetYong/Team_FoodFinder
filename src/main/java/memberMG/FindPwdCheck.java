package memberMG;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import questionBoard.QuestionBoardDTO;
import questionBoard.QuestionPageUser;

public class FindPwdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO dao;

	public void init() throws ServletException {
		dao = new MemberDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String userName = request.getParameter("memberName");
			String userEmail = request.getParameter("memberIdEmail");
			String userPhone = request.getParameter("memberPhone");
			String userPhoneformat = userPhone.substring(0, 3) + "-" + userPhone.substring(3, 7) + "-" + userPhone.substring(7);
			
			MemberDTO dto = dao.userfindpwdcheck(userName, userEmail, userPhoneformat);
			
			if(dto.getMbnum() != 0) {
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/FindPassChange.jsp").forward(request, response);
			}
			else {
				request.setAttribute("LoginErrMsg", "입력하신 정보의 회원을 찾지 못하였습니다.");
				request.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/FindPassHome.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
