package food;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodBoardAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;
    
    public void init() throws ServletException{
		dao = new FoodDAO();
	}
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Map<String, Object> map = new HashMap<>();
            int totalCount = dao.selectCountAdmin(map);
            
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

            List<FoodDTO> boardLists = dao.selectListAdmin(map);

            System.out.println("유저리스트 조회 끝 DAO 종료");

            String pagingImg = FoodPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../Admin/AdminFoodList.do");
            map.put("pagingImg", pagingImg);
            map.put("totalCount", totalCount);
            map.put("pageSize", pageSize);
            map.put("pageNum", pageNum);

            request.setAttribute("boardLists", boardLists);
            request.setAttribute("map", map);
            request.getRequestDispatcher("/EXFFFF/Admin/AdminMain.jsp?contentPage=AdminFood.jsp").forward(request, response);
            } 
        catch (Exception e) {
        	System.out.println("어드민 푸드게시판 조회 중 예외 발생");
        	e.printStackTrace();    
        }
    }
	
	@Override
	public void destroy() {
		dao.close();
	}
}
