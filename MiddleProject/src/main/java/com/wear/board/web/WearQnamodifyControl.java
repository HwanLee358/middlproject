package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.board.vo.QnaVO;
import com.wear.common.Control;

public class WearQnamodifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pNo = req.getParameter("pNo");
		String qNo = req.getParameter("qNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		QnaVO vo = new QnaVO();
		vo.setPostNo(Integer.parseInt(qNo));
		vo.setProductNo(Integer.parseInt(pNo));
		vo.setPostTitle(title);
		vo.setContent(content);
		
		QnaBoardService svc = new QnaBoardServiceImpl();
		if(svc.modifyQna(vo)) {
			resp.sendRedirect("productDetail.do?pno="+pNo);					
		}else {
			resp.sendRedirect("main.do");								
		}
		
	}

}
