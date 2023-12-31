package food;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import questionBoard.QuestionPage;

public class FoodBoard extends HttpServlet {
	FoodDAO dao;
    
    public void init() throws ServletException{
		dao = new FoodDAO();
	}
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String mbnum = null;
        try {
            HttpSession session = request.getSession();
            if(session.getAttribute("MBNUM") != null) {
               mbnum = session.getAttribute("MBNUM").toString();
            }
            
            Map<String, Object> map = new HashMap<>();
            int totalCount = dao.selectCount(map);
            String searchField = request.getParameter("searchField");
    		String searchWord = request.getParameter("searchWord");
    		if (searchField != null) {
    			map.put("searchField", searchField);
    			map.put("searchWord", searchWord);
    		}
            
            int pageSize = 10;
            int blockPage = 5;

            int pageNum = 1;
            String pageTemp = request.getParameter("pageNum");
            if (pageTemp != null && !pageTemp.equals("")) {
                pageNum = Integer.parseInt(pageTemp);
            }

            int start = (pageNum - 1) * pageSize + 1;
            int end = pageNum * pageSize;
            map.put("start", start);
            map.put("end", end);

            List<FoodDTO> boardLists = dao.selectList(map);

            System.out.println("유저리스트 조회 끝 DAO 종료");

            String pagingImg = FoodPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../Food/FoodList.do");
            map.put("pagingImg", pagingImg);
            map.put("totalCount", totalCount);
            map.put("pageSize", pageSize);
            map.put("pageNum", pageNum);

            request.setAttribute("boardLists", boardLists);
            request.setAttribute("map", map);
            request.setAttribute("mbnumcheck", mbnum);
            request.getRequestDispatcher("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/foodbody.jsp").forward(request, response);
            } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	@Override
	public void destroy() {
		dao.close();
	}

}
