package exffff;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class FileUpload {
	public static MultipartRequest Upload(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		try {
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
