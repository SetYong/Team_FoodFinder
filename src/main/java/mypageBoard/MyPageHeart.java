package mypageBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.FoodDTO;

public class MyPageHeart extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyPageBoardDAO dao = new MyPageBoardDAO();
		String mbnum = req.getParameter("MBNUM");
		// 뷰에 전달할 매개변수 저장용 맵 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 공감한 갯수로 다시 처리하기 
		int totalCount = dao.heartcount(map, mbnum);
		// 페이지 처리
		ServletContext application = getServletContext();
		int pageSize = 8;
		int blockPage = 5;
		// 현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		List<FoodDTO> boardLists = dao.selectHeartlist(map,mbnum);
		dao.close();
		
		// 뷰에 전달할 매개변수 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
				blockPage, pageNum, "../MyPage/MyPageHeart.do?MBNUM="+mbnum); 
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		// 전달할 데이터를 request 영역에 저장 후 list.jsp 로 포워드
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		System.out.println(boardLists);
		System.out.println(map + "마이페이지 공감");
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageHeartlist.jsp").forward(req, resp);
	}
}
