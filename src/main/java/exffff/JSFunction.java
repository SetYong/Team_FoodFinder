package exffff;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSFunction
 */
@WebServlet("/JSFunction")
public class JSFunction  {
public static void alertLocation(HttpServletResponse resp, String msg, String url) {
	try {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		String script =" " + "<script>" + "  alert('" + msg + "');" + "</script>";
		writer.print(script);
	}catch(Exception e ) {}

}

public static void alertBack(HttpServletResponse resp, String msg) {
	try {resp.setContentType("text/html;charset=UTF-8");
	PrintWriter writer = resp.getWriter();
	String script = " " + "<script>" + " alert('" + msg + "');" + " history.back();" + "</script>";
	writer.print(script);
	}
	catch(Exception e) {}
}


}
