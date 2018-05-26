package control.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewPersonalController implements Controller {

	public ViewPersonalController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/home/viewpersonal.jsp";
		return forwardURL;
	}

}
