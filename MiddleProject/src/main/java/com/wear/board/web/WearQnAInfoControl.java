package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.board.vo.QnaVO;
import com.wear.common.Control;

public class WearQnAInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		QnaBoardService svc = new QnaBoardServiceImpl();
		String pNo = req.getParameter("qno");
		QnaVO vo = svc.getQnaInfo(Integer.parseInt(pNo));
		svc.addViews(Integer.parseInt(pNo));

		String path = "wearboard/qnaInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
