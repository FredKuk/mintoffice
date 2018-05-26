package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.CommuteService;

public class CommuteController implements Controller {
	private CommuteService service;

	public CommuteController() {
		System.out.println("CommuteController");
	}

	public CommuteController(CommuteService service) {
		this.service = service;
		System.out.println("service into Created CommuteController");
	}

	public CommuteService getService() {
		return service;
	}

	public void setService(CommuteService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");
		String comKind = (String) request.getParameter("commute");
		String result = null;
		try {
			String com_no = service.isWork(emp_no);
			if (comKind.equals("arrive")) {
				if (com_no != null) {
					result = "Opps, Your arrival had been already recorded.";
				} else {
					service.arrive(emp_no);
				}
			} else if (comKind.equals("gohome")) {
				if (com_no != null) {
					service.gohome(com_no);
				} else {
					result = "Opps, There is no working record matched this request.";
				}
			} else if (comKind.equals("goout")) {
				if (com_no != null) {
					String out_no = service.isOut(emp_no);
					if (out_no != null) {
						result = "Opps, Your outwork time had been already recorded.";
					} else {
						service.goout(emp_no);
					}
				}else {
					result = "Opps, There is no working record matched this request.";
				}
			} else if (comKind.equals("comeback")) {
				if (com_no != null) {
					String out_no = service.isOut(emp_no);
					if (out_no != null) {
						service.comeback(out_no);
					} else {
						result = "Opps, There is no working record matched this request.";
					}
				}else {
					result = "Opps, There is no working record matched this request.";
				}
			} else if (comKind.equals("illness")) {
				if (com_no != null) {
					service.illness(com_no);
				} else {
					result = "Opps, There is no working record matched this request.";
				}
			}
			if(result!=null) {
				request.setAttribute("result",result);
			}else{
				request.setAttribute("result", "1");
			}
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}
}
