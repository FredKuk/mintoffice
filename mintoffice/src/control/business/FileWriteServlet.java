package control.business;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FileService;
import vo.Board;


public class FileWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FileService service = new FileService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content"); 
		String filename= request.getParameter("filename");

		Board board = new Board();
		board.setBoard_subject(subject);
		board.setBoard_contents(content);


		try {
			service.write(board);
			request.setAttribute("result", 1);
			System.out.println("성공");
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		String forwardURL = "contents/business/fileinforesult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}

}
