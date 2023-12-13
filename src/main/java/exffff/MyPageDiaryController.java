package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import mypageBoard.MyPageBoardDAO;

public class MyPageDiaryController extends HttpServlet{
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
		int mbnum = 480;
		String image = "asdf";
		String kcalstr = req.getParameter("kcal");
		int kcal = 0;
		if(kcalstr!=null) {
			kcal = Integer.parseInt(kcalstr);
		}
		
		System.out.println("title : "+title+" timeCate : "+ timeCate +" text : "
					+text+ " MBNUM : "+ mbnum + " image : "+ image + " kcal : "+ kcal); 
		dao.insertDiaryWrtie(title, timeCate, text, mbnum, image, kcal);
		
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPagediary.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}

}
