package mypageBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageViewController extends HttpServlet {
	   @Override
	   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      MyPageBoardDAO dao = new MyPageBoardDAO();
	      // 게시물 불러오기
	      int headnum = Integer.parseInt(req.getParameter("headnum"));
	      String mbnum = req.getParameter("MBNUM");
	      MyPageBoardDTO dto = dao.selectView(headnum, mbnum);
	      dao.close();
	      
	      req.setAttribute("dto", dto);
	      req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageView.jsp").forward(req, resp);
	   }
	}
