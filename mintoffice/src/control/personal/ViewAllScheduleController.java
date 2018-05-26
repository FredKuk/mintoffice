package control.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewAllScheduleController implements Controller {
	public ViewAllScheduleController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/personal/allSchedule.jsp";
		return forwardURL;
	}

}
