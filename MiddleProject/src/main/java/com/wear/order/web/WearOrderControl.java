package com.wear.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;

public class WearOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str = req.getParameter("pNo");
		String[] postNo = str.split(",");
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logId");
		
		for(int i=0; i< postNo.length; i++) {
			
		}
	}

}
