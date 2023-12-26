package exffff;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;

public class NewmemberCheckController extends HttpServlet{
	MemberDAO dao;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		PrintWriter out = resp.getWriter();
		int idCheck = dao.checkId(userId);
		
		if(idCheck == 0) {
			System.out.println("NewmemberCheckController : 이미 사용중인 아이디입니다.");
		} else if (idCheck ==1) {
			System.out.println("NewmemberCheckController : 사용 가능한 아이디입니다.");
		}
		out.write(idCheck+"");
	}
	@Override
	public void destroy() {
		dao.close();
	}
}