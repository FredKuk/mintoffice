package control.personal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.MemoService;

public class DelMemoController implements Controller {
	private MemoService service;

	public DelMemoController() {
		System.out.println("ModMemoController");
	}

	public DelMemoController(MemoService service) {
		this.service = service;
		System.out.println("service into Created ModMemoController");
	}

	public MemoService getService() {
		return service;
	}

	public void setService(MemoService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

		String memo_no = request.getParameter("memo_no");
		try {
			service.delete(memo_no);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", "-1");
		}
		String forwardURL = "contents/personal/delMemoResult.jsp";
		return forwardURL;
	}

}
