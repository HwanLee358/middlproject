package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;

public class ModifyReviewFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pno = req.getParameter("pno"); // 제품번호 필요함?
		String page = req.getParameter("page");
		req.setAttribute("pno", pno);
		req.setAttribute("page", page);
		// 열어주는 페이지
		String path = "WEB-INF/board/editBoard.jsp";
		path = "board/editBoard.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}

