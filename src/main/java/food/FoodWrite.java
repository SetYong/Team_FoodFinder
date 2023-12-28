package food;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;
	
	public void init() throws ServletException{
		dao = new FoodDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		FoodDTO dto = new FoodDTO();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String[] cateList = request.getParameterValues("cate");
		String joincate = String.join(",", cateList);
		
		dto.setTitle(request.getParameter("title"));
		dto.setCate(joincate);
		dto.setContent(request.getParameter("content"));
		dto.setRecipe(request.getParameter("recipe"));
		if(session.getAttribute("MBNUM") != null) {
			dto.setMbnum(session.getAttribute("MBNUM").toString());
		}
		else {
			out.print("<script>");
	         out.print("alert('로그인이 만료되었습니다.');");
	         out.print("</script>");
			return;
		}
		System.out.println("mbnum setnum 후 : " + dto.getMbnum() + " cate : " + dto.getCate());
		
		int iResult = dao.insertWrite(dto);
		
		if(iResult == 1){
			response.sendRedirect("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do");
			return;
			} 
		else{
			response.sendRedirect("../Main/Main.jsp");
			return;
			}
		} catch (Exception e) {
			System.out.println("푸드 게시판 작성 서블릿 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}

}
