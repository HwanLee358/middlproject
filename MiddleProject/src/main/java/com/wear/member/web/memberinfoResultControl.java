package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;

public class memberinfoResultControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "WEB-INF/view/member/infoResult.jsp";
	//	String path = "member/infoResult.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
		System.out.println("@@@@@@@@@@@끝@@@@@@@@");
	}

}
