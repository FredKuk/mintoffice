package control.business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.NoticeService;

public class ViewNoticeController implements Controller {
	private NoticeService service;

	public ViewNoticeController() {
		System.out.println("CommuteController");
	}

	public ViewNoticeController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created CommuteController");
	}

	public NoticeService getService() {
		return service;
	}

	public void setService(NoticeService service) {
		this.service = service;
	}
	@Override
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/business/noticeboard.jsp";
		return forwardURL;
	
	}
}
