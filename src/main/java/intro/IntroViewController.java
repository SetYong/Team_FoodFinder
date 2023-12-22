package intro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IntroViewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IntroDAO dao = new IntroDAO();
		// 게시물 불러오기
		String idx = req.getParameter("idx");
		dao.updateVisitCount(idx);
		IntroDTO dto = dao.selectView(idx);
		dao.close();
		
		dto.setText(dto.getText().replaceAll("\r\n", "<br/>"));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../Intro/IntroView.jsp").forward(req, resp);
	}
}