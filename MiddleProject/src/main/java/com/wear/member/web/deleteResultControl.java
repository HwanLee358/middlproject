package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;

public class deleteResultControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		session.invalidate(); // 세션객체 삭제
		
		//String path ="WEB-INF/view/member/deleteResult.jsp";
		String path = "member/deleteResult.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	
		
	
	}

}
