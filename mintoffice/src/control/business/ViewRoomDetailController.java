package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewRoomDetailController implements Controller {
	public ViewRoomDetailController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/business/roomDetail.jsp";
		return forwardURL;
	}

}
