package questionBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuestionWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionBoardDAO dao;
	
	public void init() throws ServletException{
		dao = new QuestionBoardDAO();
	}
	
	@Override   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionBoardDTO dto = new QuestionBoardDTO();
		dto.setTitle(request.getParameter("QuTitle"));
		dto.setQucate(request.getParameter("QuCate"));
		dto.setContent(request.getParameter("QuContent")); 
		dto.setMbnum(Integer.parseInt(request.getParameter("MBNUM")));
		System.out.println("mbnum setnum 후 : " + dto.getMbnum());
		
		int iResult = dao.insertQuWrite(dto);
		
		if(iResult == 1){
			response.sendRedirect("QuestionBoardResult.jsp");
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
