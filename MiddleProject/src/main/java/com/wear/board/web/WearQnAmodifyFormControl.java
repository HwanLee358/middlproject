package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.board.vo.QnaVO;
import com.wear.common.Control;

public class WearQnAmodifyFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/addqna.tiles";
		String qno = req.getParameter("qno");
		String pno = req.getParameter("pNo");
		
		QnaBoardService svc = new QnaBoardServiceImpl();
		QnaVO vo = svc.getQnaInfo(Integer.parseInt(qno));

		req.setAttribute("qnaModify", vo);
		req.setAttribute("productNo", pno);
		req.setAttribute("qnaNo", qno);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
