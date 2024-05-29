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
		String qNo = req.getParameter("qno");
		String pNo = req.getParameter("pno");
		QnaVO vo = svc.getQnaInfo(Integer.parseInt(qNo));
		svc.addViews(Integer.parseInt(qNo));
		
		req.setAttribute("qnaInfo", vo);
		req.setAttribute("pNo", pNo);
		String path = "wearboard/qnaInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
