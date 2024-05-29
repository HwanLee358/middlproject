package com.wear.basket.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.basket.vo.BasketVO;
import com.wear.common.Control;

public class DelBasket implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("basketNo");
		
		BasketVO bvo = new BasketVO();
		bvo.setBasketNo(Integer.parseInt(no));
		
		BasketService svc = new BasketServiceImpl();
		if(svc.removeBasket(Integer.parseInt(no))) {
			// {"retCode":"OK"}
			resp.getWriter().print("{\"retCode\":\"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\":\"NG\"}");
		}
	}

}
