package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodDB.FoodDAO;
import foodDB.FoodDTO;

public class BulletinBoardEditTestController extends HttpServlet{
	FoodDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new FoodDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String visitcount = req.getParameter("visitcount");
		String image = req.getParameter("image");
		String text = req.getParameter("text");
		String title = req.getParameter("title");
		String heartcount = req.getParameter("heartcount");
		String cate = req.getParameter("cate");
		
		System.out.println(visitcount + image + text + title + heartcount + cate);
		
		dao.getEdit( visitcount, image, text, title, heartcount,  cate);
		FoodDTO Fooddto = dao.getEdit( visitcount, image, text, title,  heartcount, cate);
		int MBNUM = Fooddto.getMbnum();
		
		
		
		req.getRequestDispatcher("/EXFFFF/Food/BulletinBoardEditTest.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}
