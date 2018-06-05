package control.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.NoticeService;
import vo.NReply;

public class ShowNreplyController implements Controller {
	private NoticeService service;

	public ShowNreplyController() {
		System.out.println("ShowNreplyController");
	}

	public ShowNreplyController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created ShowNreplyController");
	}

	public NoticeService getService() {
		return service;
	}

	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String noti_no=request.getParameter("noti_no");
		try {
			List<NReply> list = service.findAllReply(noti_no);
			if(list!=null)
				System.out.println("OK find reply!");
			else
				System.out.println("Oh, no reply but at least trying");
			System.out.println(list.size());
			request.setAttribute("result", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String forwardURL = "contents/business/showNoticeReply.jsp";
		return forwardURL;
	}
}
