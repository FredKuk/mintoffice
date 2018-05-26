package control.personal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.ScheduleService;
import vo.Schedule;

public class ShowCSController implements Controller {
	private ScheduleService service;

	public ShowCSController() {
		System.out.println("AddPSController Controller");
	}

	public ShowCSController(ScheduleService service) {
		this.service = service;
		System.out.println("service into Created AddPSController");
	}

	public ScheduleService getService() {
		return service;
	}

	public void setService(ScheduleService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {		
		try {
			List<Schedule> list=service.showcs();
			request.setAttribute("result", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/showCSResult.jsp";
		return forwardURL;
	}

}
