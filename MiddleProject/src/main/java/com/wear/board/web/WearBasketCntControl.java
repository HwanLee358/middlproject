package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.common.Control;

public class WearBasketCntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		BasketService svc = new BasketServiceImpl();
		int baskCnt = svc.basketTotalCnt();
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(baskCnt);

		resp.getWriter().print(json);
	}

}
