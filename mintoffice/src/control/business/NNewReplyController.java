package control.business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.NoticeService;

public class NNewReplyController implements Controller {
	private NoticeService service;

	public NNewReplyController() {
		System.out.println("NNewReplyController");
	}

	public NNewReplyController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NNewReplyController");
	}

	public NoticeService getService() {
		return service;
	}

	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String emp_no=(String) session.getAttribute("emp_no");
		String noti_no=request.getParameter("noti_no");
		String contents=request.getParameter("contents");
		try {
			service.newReply(noti_no,emp_no,contents);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", "-1");
			e.printStackTrace();
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}
}
