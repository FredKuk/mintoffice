package control.personal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import etc.StaticVariables;
import service.ScheduleService;
import vo.Schedule;

public class ModifyPSController implements Controller {
	private ScheduleService service;

	public ModifyPSController() {
		System.out.println("ModifyPSController");
	}

	public ModifyPSController(ScheduleService service) {
		this.service = service;
		System.out.println("service into Created ModifyPSController");
	}

	public ScheduleService getService() {
		return service;
	}

	public void setService(ScheduleService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

		HttpSession session = request.getSession();
		String schedule_no = request.getParameter("modify_no");
		String emp_no = (String) session.getAttribute("emp_no");
		String schedule_title = request.getParameter("modifyTitle");
		String schedule_place = request.getParameter("modifyPlace");
		String schedule_start = request.getParameter("modifyStDate")+" "+request.getParameter("modifyStHour");
		String schedule_end = request.getParameter("modifyEndDate")+" "+request.getParameter("modifyEndHour");
		String schedule_contents = request.getParameter("modifyContents");
		
		Schedule s = new Schedule(schedule_no,emp_no,schedule_title,schedule_place,schedule_start,schedule_end,schedule_contents,StaticVariables.PERSONALSCHEDULE);
		try {
			service.modify(s);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/modifyPSResult.jsp";
		return forwardURL;
	}
}
