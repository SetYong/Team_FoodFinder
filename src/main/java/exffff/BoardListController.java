package exffff;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodDB.FoodDAO;
import foodDB.FoodDTO;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/BoardListController")
public class BoardListController extends HttpServlet {
	FoodDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		dao = new FoodDAO();
		
		String title = req.getParameter("title");
		String fooddate = req.getParameter("fooddate");
		String visitcount = req.getParameter("visitcount");
		
		FoodDTO Fooddto = dao.getBoard(title, fooddate, visitcount);
		
		req.setAttribute("title",title);
	    req.setAttribute("fooddate", fooddate);
	    req.setAttribute("visitcount", visitcount);
		
		req.setAttribute("Fooddto",Fooddto);
		req.getRequestDispatcher("/EXFFFF/Food/BoardList.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		if(dao!=null) {
		dao.close();
		}
	}

}
