package intro;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IntroBoardDelete extends HttpServlet {
	IntroDAO dao = new IntroDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {IntroDAO dao = new IntroDAO();
	String headnum = request.getParameter("headnum");
	System.out.println("게시물삭제 헤드넘 : " + headnum);
	dao.deleteBoard(headnum);
	dao.close();
	
	request.getRequestDispatcher("/EXFFFF/Admin/AdminMain.jsp?contentPage=AdminNotice.do").forward(request, response);
	}

}
