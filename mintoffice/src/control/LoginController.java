package control;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmployeeService;

public class LoginController implements Controller {
	private EmployeeService service;

	public LoginController() {
		System.out.println("login Controller");
	}

	public LoginController(EmployeeService service) {
		this.service = service;
		System.out.println("service into Created loginController");
	}

	public EmployeeService getService() {
		return service;
	}

	public void setService(EmployeeService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String idValue = request.getParameter("id");
		String pwdValue = request.getParameter("pwd");

		HttpSession session = request.getSession();
		session.invalidate();
		try {
			String result = service.login(idValue, pwdValue);
			System.out.println("Login Result : "+result);
			if (!result.equals("-1")) { // 로그인 성공:emp_no, 실패:-1
				//StringTokenizer st = new StringTokenizer(result,"@");
				session = request.getSession();
				System.out.println("Login ID : "+idValue);
				System.out.println("Emp_No : "+result);
				session.setAttribute("loginInfo", idValue);
				session.setAttribute("emp_no", result);
				/*session.setAttribute("emp_no", st.nextToken());
				session.setAttribute("dep_no", st.nextToken());*/
			}
			request.setAttribute("result", result);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/index/loginresult.jsp";
		return forwardURL;
	}
}
