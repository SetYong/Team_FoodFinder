package food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodDelete extends HttpServlet{
	FoodDAO dao;
	
	public void init() throws ServletException{
		dao = new FoodDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("editordelete");
		String headnum = request.getParameter("HEADNUM");
		if(check.equals("삭제하기")) {
			dao.delete(headnum);
		} else if (check.equals("수정하기")){
			FoodDTO dto = dao.selectView(headnum);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodEdit.jsp").forward(request, response);
		} 
		
	}

	@Override
	public void destroy() {
		dao.close();
	}
}

