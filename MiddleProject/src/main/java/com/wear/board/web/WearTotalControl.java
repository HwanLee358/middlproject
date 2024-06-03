package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.common.Control;

public class WearTotalControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pNo = req.getParameter("qno");
		QnaBoardService svc = new QnaBoardServiceImpl();
		int count =svc.getQnaTotalCnt(Integer.parseInt(pNo));
		
		System.out.println(count);
		resp.getWriter().print("{\"totalCount\": "+count+ "}");
	}
}
