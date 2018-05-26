package control.personal;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.MemoService;
import vo.Memo;
import vo.PageBean;

public class ViewMemoController implements Controller {
	private MemoService service;

	public ViewMemoController() {
		super();
		System.out.println("ViewMemoController!");
	}

	public ViewMemoController(MemoService service) {
		this.service = service;
		System.out.println("service into Created ViewMemoController");
	}

	public MemoService getService() {
		return service;
	}

	public void setService(MemoService service) {
		this.service = service;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int intPage=1;
		try {
			//게시물 총목록수
			int totalCount = service.findCount();
			
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
			List<Memo> list = service.findAll(intPage);
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
		String forwardURL = "contents/personal/viewMemo.jsp";
		return forwardURL;
	}
}
