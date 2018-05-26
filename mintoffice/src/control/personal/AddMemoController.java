package control.personal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.MemoService;
import vo.Memo;

public class AddMemoController implements Controller {
	private MemoService service;

	public AddMemoController() {
		System.out.println(" AddMemoController");
	}

	public  AddMemoController(MemoService service) {
		this.service = service;
		System.out.println("service into Created AddMemoController");
	}

	public MemoService getService() {
		return service;
	}

	public void setService(MemoService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");
		String memo_contents = request.getParameter("memo_contents");
		
		Memo m = new Memo(null,emp_no,null,memo_contents);
		try {
			service.insert(m);
			request.setAttribute("result", "1");
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/addMemoResult.jsp";
		return forwardURL;
	}
}
