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
		String nickname = dao.checkNickname(mbnum);
		System.out.println("받은 하트값 : " + request.getParameter("replycate"));
		
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
				dto.setReplembnum(mbnum);
				dto.setReplenickname(nickname);
				dao.ReplyWrite(dto, headnum);
			}
			else {
				if(cate.equals("hearton")) {
					System.out.println("하트 온");
					dao.Updatehearton(headnum, mbnum);
				}
				else {
					if(dao.selectheart(headnum, mbnum).equals("")) {
						System.out.println("하트 오프 + 첫 공감");
						dao.insertHeart(headnum, mbnum, nickname);
					}
					else {
						System.out.println("하트 오프");
						dao.Updateheartoff(headnum, mbnum);
					}	
				}
			}

			dao.downVisitcount(headnum);
			response.sendRedirect("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum="+headnum);
			return;
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
