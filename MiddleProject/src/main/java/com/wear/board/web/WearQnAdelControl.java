package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.board.vo.QnaVO;
import com.wear.common.Control;

public class WearQnAdelControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pNo = req.getParameter("pNo");
		String qNo = req.getParameter("qno");

		QnaBoardService svc = new QnaBoardServiceImpl();
		QnaVO vo = new QnaVO();
		vo.setProductNo(Integer.parseInt(pNo));
		vo.setPostNo(Integer.parseInt(qNo));
			
		if(svc.removeQna(vo)) {
			resp.sendRedirect("productDetail.do?pno="+pNo);
		}else {
			resp.sendRedirect("main.do");
		}
	}

}
