package food;

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

public class FoodEdit extends HttpServlet {
	FoodDAO dao;

	public void init() throws ServletException {
		dao = new FoodDAO();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FoodDTO dto = new FoodDTO();

			int maxPostSize = 1024000;
			String saveDirectory = request.getServletContext().getRealPath("/EXFFFF/img/FoodImg");
			System.out.println("실제 저장소 : " + saveDirectory);
			MultipartRequest mr = FileUpload.Upload(request, saveDirectory, maxPostSize);
			String imgName = mr.getFilesystemName("image");

			String[] cateList = mr.getParameterValues("cate");
			String joincate = "";
			if (cateList != null) {
				joincate = String.join(",", cateList);
			}

			if (imgName != null) {
				String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				String ext = imgName.substring(imgName.lastIndexOf("."));
				String imgNewName = now + ext;

				File oldFile = new File(saveDirectory + File.separator + imgName);
				File newFile = new File(saveDirectory + File.separator + imgNewName);
				oldFile.renameTo(newFile);

				dto.setImage(imgNewName);

				System.out.println(
						"imgName : " + imgName + " now : " + now + " ext : " + ext + " imgNewName : " + imgNewName);
			}

			dto.setTitle(mr.getParameter("title"));
			dto.setCate(joincate);
			dto.setContent(mr.getParameter("content"));
			dto.setRecipe(mr.getParameter("recipe"));
			dto.setMbnum(mr.getParameter("MBNUM"));
			String headnum = request.getParameter("HEADNUM");

			int iResult = dao.updatefood(dto, headnum);

			if (iResult == 1) {
				response.sendRedirect("../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do");
				return;
			} else {
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
