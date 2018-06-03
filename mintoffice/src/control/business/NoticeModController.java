package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.NoticeService;
import vo.Notice;

public class NoticeModController implements Controller {
	private NoticeService service;

	public NoticeModController() {
		System.out.println("NoticeModController");
	}

	public NoticeModController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NoticeModController");
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
		String no=(String)request.getParameter("no");
		String title=(String)request.getParameter("title");
		String contents=(String)request.getParameter("contents");
		Notice n = new Notice(no,null,title,contents,null,0);
		try {
			service.modify(n);
			System.out.println("Success");
			request.setAttribute("result", "1");
			System.out.println("NOTICE MOD SUCCESS");
		} catch (Exception e) {
			System.out.println("NOTICE MOD FAILED");
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}

}
