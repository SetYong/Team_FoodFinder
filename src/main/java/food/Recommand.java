package food;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Recommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;
	
	public void init() throws ServletException{
		dao = new FoodDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Map<String, Object> map = new HashMap<>();
		HttpSession session = request.getSession();
		String rownum = Integer.toString((int)((Math.random()*dao.selectCount(map))+1));

		FoodDTO dto = dao.RecommandView(rownum);
		String headnum = Integer.toString(dto.getHeadnum());
		dao.updateVisitcount(headnum);
		String nickname = dao.checkNickname(dto.getMbnum().toString());
		if(session.getAttribute("MBNUM") != null) {
			String replyheart = dao.selectheart(headnum, session.getAttribute("MBNUM").toString());
			request.setAttribute("heartstate", replyheart);
		}
		
		 List<FoodDTO> replyList = dao.Reple(map);
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		dto.setRecipe(dto.getRecipe().replaceAll("\r\n", "<br/>"));
		
		request.setAttribute("dto", dto);
		request.setAttribute("nickName", nickname);
		request.setAttribute("replyList", replyList);
		request.setAttribute("mbnumcheck", session.getAttribute("MBNUM"));
		request.getRequestDispatcher("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("푸드 게시판 추천하기 서블릿 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
