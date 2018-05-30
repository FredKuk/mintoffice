package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommuteService;
import service.EmployeeService;
import service.MemoService;
import service.ScheduleService;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping handlerMapping = new HandlerMapping();
	private Properties env;

	public DispatcherServlet() {
		super();
	}

	public void init() throws ServletException {
		super.init();
		env = new Properties();
		ServletContext application = getServletContext();
		String envFileName = this.getInitParameter("contextConfigLocation");
		String filePath = application.getRealPath(envFileName);
		// application.getRealPath("/WEB-INF/my.properties");
		try {
			FileInputStream fis = new FileInputStream(filePath);
			env.load(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request.getServletPath());
		String path = request.getServletPath();

		Controller c = null;
		String forwardURL = "";

		String key = path;
		String className = env.getProperty(key);
		
		forwardURL=handlerMapping.working(className,request, response);
		if (forwardURL == null) {
		} else if (forwardURL.contains("redirect:")) {
			String redirectURL = forwardURL.substring("redirect:".length());
			System.out.println("redirectURL:" + redirectURL);
			if (redirectURL.trim().equals("")) {
				redirectURL = "/";
			}
			response.sendRedirect(redirectURL);
		} else {
			HttpSession session =request.getSession();
			if(session.getAttribute("loginInfo")==null) { 
				response.sendRedirect("home.jsp");
			}else {
			RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
			rd.forward(request, response);}
		}
	}
}
