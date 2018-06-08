package control.business;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FileService;
import vo.Board;
import vo.PageBean;

public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FileService service = new FileService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");	//페이지값 가져오기
		int intPage=1;
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		try {
			//게시물 총목록수
			int totalCount = service.findCount();
			System.out.println(totalCount);
			//총페이지수 계산
			int totalPage = 0;
			int cntPerPage = 6; //1페이지별 6건씩 보여준다
			totalPage = (int)Math.ceil((double)totalCount/cntPerPage);
			System.out.println("totalPage" + totalPage);
			//페이지그룹에서 쓰일 시작페이지값, 끝페이지값 계산
			int cntPerPageGroup=5;
			int startPage = (intPage - 1) * cntPerPage + 1;
			//int startPage = (int)Math.floor((double)(intPage)/(cntPerPageGroup+1))*cntPerPageGroup+1;
			int endPage = intPage * cntPerPage;
			//int endPage = startPage+cntPerPageGroup-1;
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			List<Board> list = service.findByAll(intPage);
			PageBean<Board> pb = new PageBean<>();
			pb.setCurrentPage(intPage);	//현재페이지
			pb.setTotalPage(totalPage);	//총페이지
			pb.setList(list);//목록
			pb.setStartPage(startPage);//시작페이지
			pb.setEndPage(endPage);  //끝페이지
			request.setAttribute("pagebean", pb);
			System.out.println("서블릿테스트");
	
			
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
		RequestDispatcher rd;
		
		String forwardURL = "contents/business/fileinforesult.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}


}
