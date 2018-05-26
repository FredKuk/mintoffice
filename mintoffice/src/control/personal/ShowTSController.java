package control.personal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.ScheduleService;
import vo.Schedule;

public class ShowTSController implements Controller {
	private ScheduleService service;

	public ShowTSController() {
		System.out.println("AddPSController Controller");
	}

	public ShowTSController(ScheduleService service) {
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
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");
		
		try {
			List<Schedule> list=service.showts(emp_no);
			request.setAttribute("result", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/showTSResult.jsp";
		return forwardURL;
	}

}
