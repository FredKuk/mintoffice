package control.personal;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EachService;
import service.EachServiceImpl;
import vo.Department;
import vo.Emp;
import vo.Position;

public class EachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EachController() {
        super();
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPosttest");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = "";
		String result = "";
		EachService service = new EachServiceImpl();
		Emp e = null;
		//String id = "", pwd ="";
		//boolean flag = false;
		ArrayList<Emp> data;
		HttpSession session = null;
		type = request.getParameter("type");
		if(type.equals("join")) {
			e = new Emp();
			String id=request.getParameter("id");
			String num =request.getParameter("num");
			String name=request.getParameter("name");
			String depart=request.getParameter("depart");
			String position=request.getParameter("position");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			String address=address1+address2;
			String email=request.getParameter("email");
			String msg=request.getParameter("msg");
			
			System.out.println("id : "+id);
			System.out.println("num : "+num);
			System.out.println("name : "+name);
			System.out.println("depart : "+depart);
			System.out.println("position : "+position);
			System.out.println("address : "+address);
			System.out.println("email : "+email);
			System.out.println("msg : "+msg);
			
			e.setId(id);
			e.setEmp_no(num);
			e.setName(name);
			e.setDepartment(new Department(depart));
			e.setPosition(new Position(position));
			e.setAddress(address);   //
			e.setEmail(email);
			e.setMsg(msg);
			service.join(e);
			System.out.println("세종" + address1);
			System.out.println("저장되었습니다");
		}
	}

}
