package control.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewCScheduleController implements Controller {
	public ViewCScheduleController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/personal/companySchedule.jsp";
		return forwardURL;
	}

}
