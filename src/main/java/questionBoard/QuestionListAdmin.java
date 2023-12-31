package questionBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuestionListAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    QuestionBoardDAO dao;
    
    public void init() throws ServletException{
		dao = new QuestionBoardDAO();
	}
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Map<String, Object> map = new HashMap<>();

            int totalCount = dao.selectCount(map);
            
            ServletContext application = getServletContext();
            int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
            int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

            int pageNum = 1;
            String pageTemp = request.getParameter("pageNum");
            if (pageTemp != null && !pageTemp.equals("")) {
                pageNum = Integer.parseInt(pageTemp);
            }

            int start = (pageNum - 1) * pageSize + 1;
            int end = pageNum * pageSize;
            map.put("start", start);
            map.put("end", end);

            List<QuestionBoardDTO> boardLists = dao.selectList(map);

            System.out.println("유저리스트 조회 끝 DAO 종료");

            String pagingImg = QuestionPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../Admin/AdminMain.jsp?contentPage=AdminQuestion.do");
            map.put("pagingImg", pagingImg);
            map.put("totalCount", totalCount);
            map.put("pageSize", pageSize);
            map.put("pageNum", pageNum);

            System.out.println("리스트 페이지 이동");
            request.setAttribute("boardLists", boardLists);
            System.out.println("게시판 셋팅 완료");
            request.setAttribute("map", map);
            System.out.println("정보 등록 완료");
            System.out.println("리스트 페이지 이동 성공");
            request.getRequestDispatcher("/EXFFFF/Admin/AdminMain.jsp?contentPage=AdminQuestion.jsp").forward(request, response);
            } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
	@Override
	public void destroy() {
		dao.close();
	}
}
