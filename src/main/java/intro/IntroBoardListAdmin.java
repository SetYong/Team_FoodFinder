package intro;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IntroBoardListAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IntroDAO dao = new IntroDAO();
	 
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	 Map<String, Object> map = new HashMap<>();
    	 
    	 int totalCount = dao.selectCount(map);
    	 
    	 ServletContext application = getServletContext();
    	 int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    	 int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    	 
    	 int pageNum = 1;
    	 String pageTemp = req.getParameter("pageNum");
    	 if (pageTemp != null && !pageTemp.equals(""))
    		 pageNum = Integer.parseInt(pageTemp);
    	 
    	 int start = (pageNum - 1) * pageSize + 1;
    	 int end = pageNum * pageSize;
    	 map.put("start", start);
    	 map.put("end", end);
    	 
    	 List<IntroDTO> boardLists = dao.selectListPage(map);
    	 
    	 String pagingImg = BoardPage.pagingStr(totalCount, pageSize,blockPage, pageNum, "../Admin/AdminNotice.do"); 
    	 map.put("pagingImg", pagingImg);
    	 map.put("totalCount", totalCount);
    	 map.put("pageSize", pageSize);
    	 map.put("pageNum", pageNum);
    	 
    	 req.setAttribute("boardLists", boardLists);
    	 req.setAttribute("map", map);
    	 req.getRequestDispatcher("/EXFFFF/Admin/AdminMain.jsp?contentPage=AdminNotice.jsp").forward(req, resp);
    }

	@Override
	public void destroy() {
		dao.close();
	}
}
