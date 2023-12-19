package questionBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuestionListAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		QuestionBoardDAO dao = new QuestionBoardDAO();

		Map<String, Object> param = new HashMap<String, Object>();

		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		if (searchWord != null) {
			param.put("searchField", searchField);
			param.put("searchWord", searchWord);
		}

		int totalCount = dao.selectCount(param);

		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);

		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}

		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);

		List<QuestionBoardDTO> boardLists = dao.selectList(param);
		dao.close();
		
		response.sendRedirect("../EXFFFF/Admin/Question.jsp");
		return;
	}

}
