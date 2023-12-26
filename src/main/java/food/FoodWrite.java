package food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questionBoard.QuestionBoardDTO;

public class FoodWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;
	
	public void init() throws ServletException{
		dao = new FoodDAO();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FoodDTO dto = new FoodDTO();
		dto.setTitle(request.getParameter("Title"));
		dto.setCate(request.getParameter("Cate"));
		dto.setContent(request.getParameter("Content")); 
		dto.setMbnum(Integer.parseInt(request.getParameter("MBNUM")));
		System.out.println("mbnum setnum 후 : " + dto.getMbnum() + "cate : " + dto.getCate());
		
		int iResult = dao.insertWrite(dto);
		
		if(iResult == 1){
			response.sendRedirect("../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp");
			return;
		} else{
			response.sendRedirect("../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp");
			return;
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}

}
