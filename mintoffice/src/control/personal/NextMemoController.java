package control.personal;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.MemoService;
import vo.Memo;
import vo.PageBean;

public class NextMemoController implements Controller {
	private MemoService service;

	public NextMemoController() {
		super();
		System.out.println("NextMemoController!");
	}

	public NextMemoController(MemoService service) {
		this.service = service;
		System.out.println("service into Created NextMemoController");
	}

	public MemoService getService(){
		return service;
	}

	public void setService(MemoService service) {
		this.service = service;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");
		String page = request.getParameter("nextpage");
		int intPage=Integer.parseInt(page);
		System.out.println(page);
		System.out.println(intPage);
		
		try {
			//게시물 총목록수
			int totalCount = service.findCount(emp_no);
			
			//총페이지수계산			
			int totalPage = 0;
			int cntPerPage=5;//1페이지별 3건씩 보여준다
			totalPage = (int)Math.ceil((double)totalCount/ cntPerPage);               
			
			//페이지그룹에서 쓰일 시작페이지값, 끝페이지값계산
			int cntPerPageGroup=5; //페이지그룹별 5페이지씩 보여준다
			int startPage = (int)Math.floor((double)(intPage)/(cntPerPageGroup))*cntPerPageGroup+1;
			int endPage = startPage+cntPerPageGroup-1;
			if(endPage > totalPage) {
				endPage = totalPage;
			}	
			List<Memo> list = service.findAll(emp_no, intPage);
			PageBean<Memo> pb = new PageBean<>();
			pb.setCurrentPage(intPage);//현재페이지
			pb.setTotalPage(totalPage); //총페이지
			pb.setList(list); //목록
			pb.setStartPage(startPage); //시작페이지
			pb.setEndPage(endPage); //끝페이지
			
			request.setAttribute("pagebean", pb);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
		String forwardURL = "contents/personal/nextMemo.jsp";
		return forwardURL;
	}
}
