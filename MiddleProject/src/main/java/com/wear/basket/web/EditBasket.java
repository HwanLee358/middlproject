package com.wear.basket.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.basket.vo.BasketVO;
import com.wear.common.Control;

public class EditBasket implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("basketNo");
		String cnt = req.getParameter("productCnt");
		
		BasketVO bvo = new BasketVO();
		bvo.setBasketNo(Integer.parseInt(no));
		bvo.setProductCnt(Integer.parseInt(cnt));
		
		BasketService svc = new BasketServiceImpl();
		if(svc.modifyBasket(bvo)) {
			// {"retCode":"OK"}
			resp.getWriter().print("{\"retCode\":\"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\":\"NG\"}");
		}
	}

}
