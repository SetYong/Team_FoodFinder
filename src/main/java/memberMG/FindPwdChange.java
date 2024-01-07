package memberMG;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindPwdChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO dao = new MemberDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mbnum = request.getParameter("mbnum");
		String password = request.getParameter("memberpass");
		try {
			dao.updatePwd(password, mbnum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/EXFFFF/Main/Main.jsp?contentPage=../Member/Login.jsp").forward(request, response);
		}
}
