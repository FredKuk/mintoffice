package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.NoticeService;
import vo.Notice;

public class NoticeNewController implements Controller {
	private NoticeService service;

	public NoticeNewController() {
		System.out.println("NoticeNewController");
	}

	public NoticeNewController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created NoticeNewController");
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
		String emp_no=(String)session.getAttribute("emp_no");
		String title=(String)request.getParameter("title");
		String contents=(String)request.getParameter("contents");
		Notice n = new Notice(null,emp_no,title,contents,null,0);
		try {
			service.insert(n);
			request.setAttribute("result", "1");
			System.out.println("NOTICE ADD SUCCESS");
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/business/commonResult.jsp";
		return forwardURL;
	}

}
