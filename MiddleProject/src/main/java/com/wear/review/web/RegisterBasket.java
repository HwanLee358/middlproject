package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;
import com.wear.review.vo.BasketVO;

public class RegisterBasket implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cnt = req.getParameter("cnt");
		String pino = req.getParameter("pino");
		String userId = req.getParameter("userId");
		
		BasketVO bvo = new BasketVO();
		bvo.setProductCnt(Integer.parseInt(cnt));
		bvo.setProductInfoNo(Integer.parseInt(pino));
		bvo.setUserId(userId);
		
		ProductService svc = new ProductServiceImpl();
		
		if(svc.addBasket(bvo)) {
			System.out.println("등록성공");
			resp.sendRedirect("basketList1.do");
		}else {
			System.out.println("실패");
			resp.sendRedirect("productDetail.do");
		}
		

	}

}