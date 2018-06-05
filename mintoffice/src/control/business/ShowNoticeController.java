package control.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;
import service.NoticeService;
import vo.Notice;
import vo.PageBean;

public class ShowNoticeController implements Controller {
	private NoticeService service;

	public ShowNoticeController() {
		System.out.println("CNoticeController");
	}

	public ShowNoticeController(NoticeService service) {
		this.service = service;
		System.out.println("service into Created ShowNoticeController");
	}

	public NoticeService getService() {
		return service;
	}

	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		
		int intPage=1;
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		try {
			// 게시물 총목록수
			int totalCount = service.count();
			//System.out.println("notice total : "+totalCount);
			request.setAttribute("total", totalCount);
			// 총페이지수계산
			int totalPage = 0;
			int cntPerPage = 13;// 1페이지별 x건씩 보여준다
			totalPage = (int) Math.ceil((double) totalCount / cntPerPage);
	
			// 페이지그룹에서 쓰일 시작페이지값, 끝페이지값계산
			int cntPerPageGroup = 5; // 페이지그룹별 5페이지씩 보여준다
			int startPage=0;
			if(intPage%cntPerPageGroup==0) {
				startPage=intPage-cntPerPageGroup+1;
			}else {
				startPage=intPage/cntPerPageGroup;
				startPage=startPage*cntPerPageGroup+1;
			}
			//int startPage = (int) Math.floor((double) (intPage) / (cntPerPageGroup)) * cntPerPageGroup + 1;
			int endPage = startPage + cntPerPageGroup - 1;
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			List<Notice> list = service.findAll(intPage);
			PageBean<Notice> pb = new PageBean<>();
			System.out.println("intPage : "+intPage);
			System.out.println("TotalPage : "+totalPage);
			System.out.println("startPage : "+startPage);
			System.out.println("endPage : "+endPage);
			
			pb.setCurrentPage(intPage);// 현재페이지
			pb.setTotalPage(totalPage); // 총페이지
			pb.setList(list); // 목록
			pb.setStartPage(startPage); // 시작페이지
			pb.setEndPage(endPage); // 끝페이지
			request.setAttribute("pagebean", pb);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "-1");
		}
		String forwardURL = "contents/business/showNotice.jsp";
		return forwardURL;
	}
}
