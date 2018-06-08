package control.personal;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmpService;
import vo.Emp;

public class EmpInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpService service = new EmpService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchName = request.getParameter("searchName");
		String searchNum = request.getParameter("searchNum");
		String searchGrade = request.getParameter("searchGrade");
		String searchDepart = request.getParameter("searchDepart");
		
	
		
	//전체검색
		if(searchName.equals("") && searchNum.equals("") && searchGrade.equals("전체") && searchDepart.equals("전체")) {
					try {
						System.out.println("전체 서블렛");
						List<Emp>list = service.findAll();
						request.setAttribute("list", list);
					} catch (Exception e) {
						request.setAttribute("result", e.getMessage());
					}				

	}else if(!searchName.equals("")&& !searchNum.equals("") && !searchGrade.equals("전체") && !searchDepart.equals("전체")) {
		//조건검색
		try {
			List<Emp> list = service.findBy(searchName, searchNum, searchGrade, searchDepart);
			if(list==null)
				System.out.println("null");
			System.out.println(list.size());
			request.setAttribute("list", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
			e.printStackTrace();
		}
	}else if(!searchName.equals("")&& searchNum.equals("") && searchGrade.equals("전체") && searchDepart.equals("전체")) {
		//이름검색
		try {
			List<Emp> list = service.findName(searchName);
			if(list==null)
				System.out.println("null");
			System.out.println(list.size());
			request.setAttribute("list", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
			e.printStackTrace();
		}
	}else if(searchName.equals("")&& !searchNum.equals("") && searchGrade.equals("전체") && searchDepart.equals("전체")) {
		//사번검색
		try {
			List<Emp> list = service.findNum(searchNum);
			if(list==null)
				System.out.println("null");
			System.out.println(list.size());
			request.setAttribute("list", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
			e.printStackTrace();
		}
	}else if(searchName.equals("")&& searchNum.equals("") && !searchGrade.equals("전체") && searchDepart.equals("전체")) {
		//직급검색
		try {
			List<Emp> list = service.findPosition(searchGrade);
			if(list==null)
				System.out.println("null");
			System.out.println(list.size());
			request.setAttribute("list", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
			e.printStackTrace();
		}
	}else if(searchName.equals("")&& searchNum.equals("") && searchGrade.equals("전체") && !searchDepart.equals("전체")) {
		//부서검색
		try {
			List<Emp> list = service.findDepartment(searchDepart);
			if(list==null)
				System.out.println("null");
			System.out.println(list.size());
			request.setAttribute("list", list);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
			e.printStackTrace();
		}
	}
	String forwardURL = "contents/personal/empinforesult.jsp";
	RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
	rd.forward(request, response);
	}
}

