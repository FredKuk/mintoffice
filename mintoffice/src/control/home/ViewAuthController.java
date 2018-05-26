package control.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewAuthController implements Controller {
	public ViewAuthController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/home/viewauth.jsp";
		return forwardURL;
	}

}
