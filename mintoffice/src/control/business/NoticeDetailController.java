package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.NoticeService;
import vo.Notice;

public class NoticeDetailController implements Controller {


	private NoticeService service;

	public NoticeDetailController() {
		System.out.println("NoticeDetailController");
	}

	public NoticeDetailController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NoticeDetailController");
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
		HttpSession session = request.getSession();
		String noti_no=(String)request.getParameter("noti_no");
		try {
			Notice n = service.findByNo(noti_no);
			request.setAttribute("result", n);
			System.out.println("NOTICE FIND SUCCESS");
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/showNoticeDetail.jsp";
		return forwardURL;
	}
}
