package exffff;

import java.io.IOException;

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
		String id = req.getParameter("id");
		boolean check = dao.checkId(id);
		req.setAttribute("checkidmessage", check);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}