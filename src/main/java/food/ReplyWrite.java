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
		HttpSession session = request.getSession();
		String headnum = request.getParameter("headnum");
		String mbnum = session.getAttribute("MBNUM").toString();
		int iResult = 0;
		
		try {
			FoodDTO dto = new FoodDTO();
			String cate = request.getParameter("replycate");
			
			if(cate == null) {
				System.out.println("카테고리 에러 : " + cate);
			}
			else if (cate.equals("reply")) {
				System.out.println("댓글 온");
				dto.setRepletext(request.getParameter("replyText"));
				dto.setReplecate(cate);

				if (session.getAttribute("MBNUM") != "") {
					dto.setReplembnum(session.getAttribute("MBNUM").toString());
					dto.setReplenickname(dao.checkNickname(session.getAttribute("MBNUM").toString()));
					iResult = dao.ReplyWrite(dto, headnum);
				}
			}
			else {
				if(cate.equals("heartoff")) {
					System.out.println("하트오프");
					dto.setRepletext("heartoff");
					dao.deletehearton(headnum, mbnum);
				}
				else {
					System.out.println("하트 온");
					dto.setRepletext("hearton");
					dao.deleteheartoff(headnum, mbnum);
				}
				dto.setReplecate(cate);
				
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
