package control.business;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Controller;

public class ViewRoomListController implements Controller {
	public ViewRoomListController() {
		super();
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "contents/business/roomList.jsp";
		return forwardURL;
	}

}
