package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.board.vo.QnaVO;
import com.wear.common.Control;

public class WearQnAaddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("writer");
		String productNo = req.getParameter("pno");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		QnaVO vo = new QnaVO();
		vo.setUserId(userId);
		vo.setProductNo(Integer.parseInt(productNo));
		vo.setPostTitle(title);
		vo.setContent(content);
		
		QnaBoardService svc = new QnaBoardServiceImpl();
		if(svc.addQna(vo)) {
			resp.sendRedirect("productDetail.do?pno="+productNo);
		}else {
			resp.sendRedirect("maid.do");			
		}
	}

}
