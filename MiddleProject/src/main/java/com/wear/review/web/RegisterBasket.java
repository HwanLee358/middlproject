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
		
		BasketVO bvo = new BasketVO();
		bvo.setProductCnt(0);
		bvo.setProductInfoNo(0);
		bvo.setUserId(null);
		
		ProductService svc = new ProductServiceImpl();
		svc.addBasket(bvo);

	}

}
