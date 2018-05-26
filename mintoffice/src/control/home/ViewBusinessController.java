package control.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewBusinessController implements Controller {
	public ViewBusinessController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/home/viewbusiness.jsp";
		return forwardURL;
	}

}
