package control.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.CommuteService;
import vo.CommuteM;

public class ShowMtYearController implements Controller {
	private CommuteService service;

	public ShowMtYearController() {
		System.out.println("ShowWCController");
	}

	public ShowMtYearController(CommuteService service) {
		this.service = service;
		System.out.println("service into Created ShowWCController");
	}

	public CommuteService getService() {
		return service;
	}

	public void setService(CommuteService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String year=request.getParameter("year");
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");
		try {
			List<CommuteM> list = service.showMonthCommute(emp_no,year);
			request.setAttribute("result", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/showmtyearResult.jsp";
		return forwardURL;
	}

}
