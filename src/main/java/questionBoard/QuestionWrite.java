package questionBoard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import memberMG.MemberDAO;

public class QuestionWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionBoardDAO dao = new QuestionBoardDAO();;
	
	@Override   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionBoardDTO dto = new QuestionBoardDTO();
		dto.setTitle(request.getParameter("QuTitle"));
		dto.setQucate(request.getParameter("QuCate"));
		dto.setContent(request.getParameter("QuContent")); 
		dto.setMbnum(Integer.parseInt(request.getParameter("MBNUM")));
		System.out.println("mbnum setnum 후 : " + dto.getMbnum());
		
		int iResult = dao.insertQuWrite(dto);
		dao.close();
		
		if(iResult == 1){
			response.sendRedirect("QuestionBoardResult.jsp");
			return;
		} else{
			response.sendRedirect("QuestionBody.jsp");
			return;
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
