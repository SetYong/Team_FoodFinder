package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodDB.FoodDAO;
import foodDB.FoodDTO;

public class BulletinBoardTestController extends HttpServlet{
	FoodDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new FoodDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String head_num = req.getParameter("head_num");
		String visitcount = req.getParameter("visitcount");
		String image = req.getParameter("image");
		String text = req.getParameter("text");
		String title = req.getParameter("title");
		String mbnum = req.getParameter("mbnumt");
		String heartcount = req.getParameter("heartcount");
		String fooddate = req.getParameter("foodate");
		String cate = req.getParameter("cate");
		
		dao.getHead_num(head_num, visitcount, image, text, title, mbnum, heartcount, fooddate, cate);
		FoodDTO memberDTO2 = dao.getHead_num(head_num, visitcount, image, text, title, mbnum, heartcount, fooddate, cate);
		int MBNUM = memberDTO2.getMbnum();
		
		
		
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}
