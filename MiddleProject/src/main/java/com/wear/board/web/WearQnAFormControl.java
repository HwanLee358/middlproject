package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;

public class WearQnAFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/qnawrite.tiles";
		String productNo = req.getParameter("pno");
		
		HttpSession session = req.getSession();
		String title = (String)session.getAttribute("logId");
		System.out.println(title);
		if(title == null) {
			resp.sendRedirect("logForm.do");
		}
		
		req.setAttribute("pNo", productNo);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
