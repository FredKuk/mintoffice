package control.personal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.ScheduleService;
import vo.Schedule;
import etc.StaticVariables;

public class AddPSController implements Controller {
	private ScheduleService service;

	public AddPSController() {
		System.out.println("ShowAllPSController");
	}

	public AddPSController(ScheduleService service) {
		this.service = service;
		System.out.println("service into Created ShowAllPSController");
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
		String emp_no = (String) session.getAttribute("emp_no");
		String schedule_title = request.getParameter("psTitle");
		String schedule_place = request.getParameter("psPlace");
		String schedule_start = request.getParameter("psStDate")+" "+request.getParameter("psStHour");
		String schedule_end = request.getParameter("psEndDate")+" "+request.getParameter("psEndHour");
		String schedule_contents = request.getParameter("psContents");
		
		Schedule s = new Schedule("0",emp_no,schedule_title,schedule_place,schedule_start,schedule_end,schedule_contents,StaticVariables.PERSONALSCHEDULE);
		try {
			service.insert(s);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/addPSResult.jsp";
		return forwardURL;
	}
}
