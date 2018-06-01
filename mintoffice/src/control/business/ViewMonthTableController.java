package control.business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewMonthTableController implements Controller {

	public ViewMonthTableController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/business/monthTable.jsp";
		return forwardURL;
	}
}
