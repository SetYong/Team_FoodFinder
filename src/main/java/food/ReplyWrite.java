package food;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;

	public void init() throws ServletException {
		dao = new FoodDAO();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String headnum = request.getParameter("headnum");
		int iResult = 0;
		try {
			FoodDTO dto = new FoodDTO();
			HttpSession session = request.getSession();
			dto.setRepletext(request.getParameter("replyText"));
			
			if (session.getAttribute("MBNUM") != "") {
				dto.setReplembnum(session.getAttribute("MBNUM").toString());
				dto.setReplenickname(dao.checkNickname(session.getAttribute("MBNUM").toString()));
				iResult = dao.ReplyWrite(dto, headnum);
			}

			if (iResult == 1) {
				response.sendRedirect("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum="+headnum);
				return;
			} else {
				response.sendRedirect("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do");
				return;
			}
		} catch (Exception e) {
			System.out.println("푸드 게시판 댓글 작성 서블릿 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}

}
