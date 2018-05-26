package control.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewTScheduleController implements Controller {
	public ViewTScheduleController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/personal/teamSchedule.jsp";
		return forwardURL;
	}

}
