package exffff;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


import upload.MyfileDAO;
import upload.MyfileDTO;


@WebServlet("/UploadController")
public class UploadController extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException{
	req.getRequestDispatcher("/upload/FileUploadMain").forward(req, resp);
}
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException{
	String saveDirectory = req.getServletContext().getRealPath("/EXFFFF/img");
	
	ServletContext application = getServletContext();
	int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
	
	MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
	if(mr == null) {
		JSFunction.alertLocation(resp,"첨부 파일이 제한 용량을 초과합니다.","../EXFFFF/upload/FileUploadMain.do");
		return;
	}
	MyfileDTO dto = new MyfileDTO();
	dto.setName(mr.getParameter("name"));
	dto.setTitle(mr.getParameter("title"));
	
	MyfileDAO dao = new MyfileDAO();
	int result = dao.insertFile(dto);
	dao.close();
	
	if(result == 1) {
		System.out.println("글쓰기 성공");
	}else {
		System.out.println("글쓰기 실패");
	}
	
	
	
}

}
