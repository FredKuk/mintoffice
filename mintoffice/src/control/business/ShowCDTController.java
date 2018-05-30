package control.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Controller;
import service.CommuteService;
import vo.CommuteDBean;
import vo.PageBean;

public class ShowCDTController implements Controller {
	private CommuteService service;

	public ShowCDTController() {
		System.out.println("ShowCDTController");
	}

	public ShowCDTController(CommuteService service) {
		this.service = service;
		System.out.println("service into Created ShowCDTController");
	}

	public CommuteService getService() {
		return service;
	}

	public void setService(CommuteService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");
		String ldDate = request.getParameter("ldDate");
		String rdDate = request.getParameter("rdDate");
		String page=request.getParameter("page");
		
		int intPage=1;
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		try {
			// 게시물 총목록수
			int totalCount = service.getDayCCount(ldDate,rdDate,emp_no);
			
			// 총페이지수계산
			int totalPage = 0;
			int cntPerPage = 20;// 1페이지별 x건씩 보여준다
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
			List<CommuteDBean> list = service.findAll(ldDate,rdDate,emp_no,intPage);
			PageBean<CommuteDBean> pb = new PageBean<>();
			pb.setCurrentPage(intPage);// 현재페이지
			pb.setTotalPage(totalPage); // 총페이지
			pb.setList(list); // 목록
			pb.setStartPage(startPage); // 시작페이지
			pb.setEndPage(endPage); // 끝페이지

			System.out.println("CDT ldDate :"+ldDate);
			System.out.println("CDT rdDate :"+rdDate);
			System.out.println("CDT page :"+page);
			System.out.println("CDT emp_no : "+emp_no);
			System.out.println("CDT totalCount : " + totalCount);
			System.out.println("intPage : "+intPage);
			System.out.println("totalPage : "+totalPage);
			System.out.println("list Size : "+list.size());
			System.out.println("startPage : "+startPage);
			System.out.println("endPage : "+endPage);
			
			request.setAttribute("pagebean", pb);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "DATE FORMAT IS ERROR. LEFT DATE IS LATEST.");
		}
		String forwardURL = "contents/business/viewCDT.jsp";
		return forwardURL;
	}
}
