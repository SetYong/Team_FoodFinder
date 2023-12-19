package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ControllerURI extends HttpServlet {
	private Map<String,Object> commandMap = new HashMap<String, Object>();
	
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("RequestMapping");
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			pr.load(f);
		} catch(IOException e) {
			throw new ServletException(e);
		} finally {
			if(f != null) try {f.close(); } catch(IOException ex) {}
		}
		Iterator keyIter = pr.keySet().iterator();
		while(keyIter.hasNext()) {
				String command = (String)keyIter.next();
				String className = pr.getProperty(command);
				try {
					Class commandClass = Class.forName(className);
					Object commandInstance = commandClass.newInstance();
					commandMap.put(command, commandInstance);
				} catch(ClassNotFoundException e) {
					throw new ServletException(e);
				} catch(InstantiationException e) {
					throw new ServletException(e);
				} catch(IllegalAccessException e) {
					throw new ServletException(e);
				}
			}
	}
}
