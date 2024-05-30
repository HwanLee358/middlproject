package com.wear.basket.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.basket.vo.BasketVO;
import com.wear.common.Control;

public class AddBasketControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String basketNo = req.getParameter("pno");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		BasketService svc = new BasketServiceImpl();
		BasketVO vo = new BasketVO();
		vo.setBasketNo(Integer.parseInt(basketNo));
		vo.setProductInfoNo(Integer.parseInt(userId));
		
		if(svc.addBasket(vo)) {
			resp.getWriter().print("{\"productNo\": "+basketNo+ "}");
		}
	}

}
