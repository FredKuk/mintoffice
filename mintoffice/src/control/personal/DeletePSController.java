package control.personal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.ScheduleService;

public class DeletePSController implements Controller {
	private ScheduleService service;

	public DeletePSController() {
		System.out.println("DeletePSController");
	}

	public DeletePSController(ScheduleService service) {
		this.service = service;
		System.out.println("service into Created DeletePSController");
	}

	public ScheduleService getService() {
		return service;
	}

	public void setService(ScheduleService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String schedule_no = request.getParameter("schedule_no");
		try {
			service.delete(schedule_no);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/deletePSResult.jsp";
		return forwardURL;
	}
}
