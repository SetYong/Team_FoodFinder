package food;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import questionBoard.QuestionBoardDTO;


public class FoodView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;
	
	public void init() throws ServletException{
		dao = new FoodDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Map<String, Object> map = new HashMap<>();
		String headnum = request.getParameter("headnum");
		map.put("headnum", headnum);
		System.out.println(headnum + "번 푸드게시판 View");
		
		FoodDTO dto = dao.selectView(headnum);
		String nickname = dao.checkNickname(dto.getMbnum().toString());
		 List<FoodDTO> replyList = dao.Reple(map);
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		dto.setRecipe(dto.getRecipe().replaceAll("\r\n", "<br/>"));
		
		request.setAttribute("dto", dto);
		request.setAttribute("nickName", nickname);
		request.setAttribute("replyList", replyList);
		request.getRequestDispatcher("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("푸드 게시판 상세보기 서블릿 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
