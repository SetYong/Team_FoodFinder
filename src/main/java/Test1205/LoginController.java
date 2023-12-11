package Test1205;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberMG.MemberDAO;
import memberMG.MemberDTO;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    	String memberName = req.getParameter("memberName");

    	String memberCn = req.getParameter("memberCn1");
    		   memberCn += req.getParameter("memberCn2");
    		   
    	String memberPhone = req.getParameter("memberPhone1");
    		   memberPhone += req.getParameter("memberPhone2");
    		   memberPhone += req.getParameter("memberPhone3");
    	
    	MemberDAO dao = new MemberDAO();
    	MemberDTO memberDTO = dao.getMemberId(memberName, memberCn, memberPhone);
    	memberDTO.setName(memberName);
    	dao.close();
    	
    	if(memberDTO.getId() != null){
    		req.setAttribute("memberName",memberDTO.getName());
    		req.setAttribute("memberId",memberDTO.getId());
    		req.getRequestDispatcher("FindIdResult.jsp").forward(req, resp);;
    	}
    	else{
    		req.setAttribute("LoginErrMsg", "입력하신 정보의 회원을 찾지 못하였습니다.");
    		req.getRequestDispatcher("FindIdHome.jsp").forward(req, resp);
    	}
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/MemberManagement/Find/FindID/FindIdHome.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
