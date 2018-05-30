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

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeService employeeService = new EmployeeService();
	private ScheduleService scheduleService = new ScheduleService();
	private MemoService memoService = new MemoService();
	private CommuteService commuteService=new CommuteService();
	private Properties env;

	public FrontController() {
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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println(request.getServletPath());
		String path = request.getServletPath();

		Controller c = null;
		String forwardURL = "";

		String key = path;
		String className = env.getProperty(key);
		// 클래스이름(eg:ProductListController)으로
		// ProductListController.class을 찾아 JVM으로 로드
		// 클래스이름(eg:control.ProductDetailController)으로
		// control.ProductDetailController.class을 찾아 JVM으로 로드
		try {
			Class clazz = Class.forName(className);
			Object obj = null;

			Constructor[] constructors = clazz.getConstructors();

			// 생성자가 1개이고 매개변수가 없는 생성자인 경우
			// setter메서드호출로 ProductService주입
			if (constructors.length == 1 && constructors[0].getParameterCount() == 0) {
				System.out.println("생성자가 1개이고 매개변수가 없는 생성자인 경우");
				obj = clazz.newInstance();
				Method[] methods = clazz.getDeclaredMethods();
				for (Method m : methods) {
					String methodName = m.getName();
					if (methodName.startsWith("set") && m.getParameterCount() == 1) {
						if ("service.EmployeeService".equals(m.getParameterTypes()[0].getName())) {
							m.invoke(obj, employeeService);
							break;
						} else if ("service.ScheduleService".equals(m.getParameterTypes()[0].getName())) {
							m.invoke(obj, scheduleService);
							break;
						} else if ("service.MemoService".equals(m.getParameterTypes()[0].getName())) {
							m.invoke(obj, memoService);
							break;
						} else if ("service.CommuteService".equals(m.getParameterTypes()[0].getName())) {
							m.invoke(obj, commuteService);
							break;
						}
					}
				}
			} else if (constructors.length > 1) {
				System.out.println("매개변수가 1개이고 매개변수의 타입이 EmployeeService타입인 경우");
				// 매개변수가 1개이고
				// 매개변수의 타입이 employeeService타입인 경우
				for (Constructor constructor : constructors) {
					if (constructor.getParameterCount() == 1) {
						if ("service.EmployeeService".equals(constructor.getParameters()[0].getType().getName())) {
							System.out.println("EmployeeService Catch");
							obj = constructor.newInstance(employeeService);
						} else if ("service.ScheduleService"
								.equals(constructor.getParameters()[0].getType().getName())) {
							System.out.println("ScheduleService Catch");
							obj = constructor.newInstance(scheduleService);
						} else if ("service.MemoService"
								.equals(constructor.getParameters()[0].getType().getName())) {
							System.out.println("MemoService Catch");
							obj = constructor.newInstance(memoService);
						} else if ("service.CommuteService"
								.equals(constructor.getParameters()[0].getType().getName())) {
							System.out.println("CommuteService Catch");
							obj = constructor.newInstance(commuteService);
						}
						break;
					}
				}
			}
			System.out.println(clazz.toString());

			// execute메서드 호출방법 2
			Method m;
			// m = clazz.getDeclaredMethod("execute",HttpServletRequest.class,
			// HttpServletResponse.class);
			m = clazz.getDeclaredMethod("execute", HttpServletRequest.class, HttpServletResponse.class);
			forwardURL = (String) m.invoke(obj, request, response);
			// execute메서드 호출방법 3
			/* forwardURL = ((Controller)obj).execute(request, response); */
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(forwardURL);
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
