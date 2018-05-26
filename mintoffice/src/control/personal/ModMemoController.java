package control.personal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.MemoService;
import vo.Memo;

public class ModMemoController implements Controller {
	private MemoService service;

	public ModMemoController() {
		System.out.println("ModMemoController");
	}

	public ModMemoController(MemoService service) {
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
		String memo_contents = request.getParameter("memo_contents");
		System.out.println(memo_no);
		System.out.println(memo_contents);
		Memo m = new Memo(memo_no,null,null,memo_contents);
		try {
			service.modify(m);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", "-1");
		}
		String forwardURL = "contents/personal/modMemoResult.jsp";
		return forwardURL;
	}
}
