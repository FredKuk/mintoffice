package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.NoticeService;
import vo.Notice;

public class NoticeDelController implements Controller {
	private NoticeService service;

	public NoticeDelController() {
		System.out.println("NoticeDelController");
	}

	public NoticeDelController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NoticeDelController");
	}

	public NoticeService getService() {
		return service;
	}

	public void setService(NoticeService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String no=(String)request.getParameter("no");
		try {
			service.delete(no);
			request.setAttribute("result", "1");
			System.out.println("NOTICE DEL SUCCESS");
		} catch (Exception e) {
			System.out.println("NOTICE DEL FAILED");
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}
}
