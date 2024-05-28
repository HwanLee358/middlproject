package com.wear.basket.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.basket.vo.BasketVO;
import com.wear.common.Control;

public class AddBasketControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String bno = req.getParameter("bno");
		System.out.println(bno);
		
		
		
		BasketService svc = new BasketServiceImpl();
		int baskCnt = svc.basketTotalCnt();
				
		req.getAttribute(bno);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(baskCnt);

		resp.getWriter().print(json);
	}

}
