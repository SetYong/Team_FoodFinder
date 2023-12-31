package food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminAssent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodDAO dao;
    
    public void init() throws ServletException{
		dao = new FoodDAO();
	}
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String assent = request.getParameter("adminAssent");
    	String headnum = request.getParameter("headnum");
    	if(assent.equals("승인")) {
    		dao.updateAssentYes(headnum);
    	} else if(assent.equals("미승인")) {
    		dao.updateAssentNo(headnum);
    	} else if(assent.equals("탈락")) {
    		dao.updateAssentFail(headnum);
    	}
    	request.getRequestDispatcher("/EXFFFF/Admin/AdminMain.jsp?contentPage=AdminFoodList.do").forward(request, response);
    }
    
    @Override
	public void destroy() {
		dao.close();
	}

}
