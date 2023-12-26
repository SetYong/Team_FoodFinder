package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import mypageBoard.MyPageBoardDAO;

public class MyPagewriteController extends HttpServlet{
	MyPageBoardDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MyPageBoardDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String timeCate = req.getParameter("timeCate");
		String text = req.getParameter("text");
		int mbnum = Integer.parseInt(req.getParameter("MBNUM"));
		String image = "asdf";
		String kcalstr = req.getParameter("kcal");
		int kcal = 0;
		if(kcalstr!=null) {
			kcal = Integer.parseInt(kcalstr);
		}
		
		System.out.println("title : "+title+" timeCate : "+ timeCate +" text : "
					+text+ " MBNUM : "+ mbnum + " image : "+ image + " kcal : "+ kcal); 
		dao.insertDiaryWrtie(mbnum, title, timeCate, text, image);
		
		req.getRequestDispatcher("/EXFFFF/MyPage/MyPagelist.do").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}

}
