package control.business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.NoticeService;

public class NModReplyController implements Controller {
	private NoticeService service;

	public NModReplyController() {
		System.out.println("NModReplyController");
	}

	public NModReplyController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NModReplyController");
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
		String contents=request.getParameter("nrContents");
		try {
			service.modReply(nr_no,contents);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", "-1");
			e.printStackTrace();
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}
}
