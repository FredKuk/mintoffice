package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loginInfo");
		session.removeAttribute("emp_no");
		if(session.getAttribute("is_manager")!=null) {
			session.removeAttribute("is_manager");	
		}
		/*session.removeAttribute("dep_no");*/
		session.invalidate();
		//response.sendRedirect(request.getContextPath());
		String redirectURL = "redirect:"+ request.getContextPath();
		System.out.println("in logout:" + request.getContextPath());
		return redirectURL;
	}

}
