package control.business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.NoticeService;

public class NDelReplyController implements Controller {
	private NoticeService service;

	public NDelReplyController() {
		System.out.println("NDelReplyController");
	}

	public NDelReplyController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NDelReplyController");
	}

	public NoticeService getService() {
		return service;
	}

	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String nr_no=request.getParameter("nr_no");
		try {
			service.delReply(nr_no);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", "-1");
			e.printStackTrace();
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}
}
