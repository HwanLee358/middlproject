package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;

public class WearQnAFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/qnawrite.tiles";
		String productNo = req.getParameter("pno");
		req.setAttribute("pNo", productNo);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
