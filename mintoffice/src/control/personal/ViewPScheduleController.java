package control.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewPScheduleController implements Controller {
	public ViewPScheduleController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/personal/personalSchedule.jsp";
		return forwardURL;
	}

}
