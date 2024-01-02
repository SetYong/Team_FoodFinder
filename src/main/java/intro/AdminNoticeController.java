package intro;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import exffff.FileUpload;
import food.FoodDAO;

public class AdminNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IntroDAO dao;
	
	public void init() throws ServletException{
		dao = new IntroDAO();
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IntroDTO dto = new IntroDTO();
		try {
			int maxPostSize = 5 * 1024 * 1024;
			String saveDirectory = request.getServletContext().getRealPath("/EXFFFF/img/Event");
			MultipartRequest mr = FileUpload.Upload(request, saveDirectory, maxPostSize);
			String imgName = mr.getFilesystemName("eventImg");
			String cate = mr.getParameter("cate");
			System.out.println("게시물 카테고리 " + cate);
			
			if(imgName != null) {
				String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				String ext = imgName.substring(imgName.lastIndexOf("."));
				String imgNewName = now + ext;
				
				File oldFile = new File(saveDirectory + File.separator + imgName);
				File newFile = new File(saveDirectory + File.separator + imgNewName);
				oldFile.renameTo(newFile);
				
				dto.setImage(imgNewName);
			} else {
				dto.setText(mr.getParameter("noticeContent"));
			}
			
			dto.setTitle(mr.getParameter("title"));
			dto.setCate(cate);
			
			dao.insertintroWrite(dto);
			
			response.sendRedirect("../Admin/AdminMain.jsp?contentPage=AdminNotice.do");
			return; 
			
		} catch(Exception e) {
			System.out.println("공지 사항 작성 중 예외 발생");
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		dao.close();
	}
}
