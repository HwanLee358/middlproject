package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;



public class memberinfoFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "member/information.tiles";
		String userId = req.getParameter("id");
		
		//String path = "member/information.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
}


