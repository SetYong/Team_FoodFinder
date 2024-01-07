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

public class MyPageHome extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyPageBoardDAO dao = new MyPageBoardDAO();
		String mbnum = req.getParameter("MBNUM");
		// 뷰에 전달할 매개변수 저장용 맵 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 공감한 갯수로 다시 처리하기 
		int totalCount = dao.selectfoodCount(map, mbnum);
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
		List<FoodDTO> boardLists = dao.selectfoodListPage(map,mbnum);
		
		// 뷰에 전달할 매개변수 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
				blockPage, pageNum, "../MyPage/MyPageHome.do?MBNUM="+mbnum); 
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		// 공감한 갯수로 다시 처리하기 
		int totalCount2 = dao.heartcount(map, mbnum);
		// 페이지 처리
		int pageSize2 = 8;
		int blockPage2 = 5;
		// 현재 페이지 확인
		int pageNum2 = 1;
		String pageTemp2 = req.getParameter("pageNum");
		if (pageTemp2 != null && !pageTemp2.equals(""))
			pageNum2 = Integer.parseInt(pageTemp2);
		
		// 목록에 출력할 게시물 범위 계산
		int start2 = (pageNum2 - 1) * pageSize2 + 1;
		int end2 = pageNum2 * pageSize2;
		map2.put("start", start2);
		map2.put("end", end2);
		List<FoodDTO> myboardLists = dao.selectHeartlist(map2,mbnum);
		dao.close();
		
		// 뷰에 전달할 매개변수 추가
		String pagingImg2 = BoardPage.pagingStr(totalCount2, pageSize2,
				blockPage2, pageNum2, "../MyPage/MyPageHome.do?MBNUM="+mbnum); 
		map2.put("pagingImg", pagingImg2);
		map2.put("totalCount", totalCount2);
		map2.put("pageSize", pageSize2);
		map2.put("pageNum", pageNum2);
		
		
		// 전달할 데이터를 request 영역에 저장 후 list.jsp 로 포워드
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.setAttribute("myboardLists", myboardLists);
		req.setAttribute("map", map2);
		req.getRequestDispatcher("/EXFFFF/Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageHome.jsp").forward(req, resp);
	}
}
