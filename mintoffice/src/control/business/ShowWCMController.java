package control.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.CommuteService;
import vo.Commute;

public class ShowWCMController implements Controller {
	private CommuteService service;

	public ShowWCMController() {
		System.out.println("ShowWCMController");
	}

	public ShowWCMController(CommuteService service) {
		this.service = service;
		System.out.println("service into Created ShowWCMController");
	}

	public CommuteService getService() {
		return service;
	}

	public void setService(CommuteService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");

		try {
			List<Commute> list=service.showCommute(emp_no);
			System.out.println(list.size());
			request.setAttribute("result", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/showCCResult.jsp";
		return forwardURL;
	}

}
