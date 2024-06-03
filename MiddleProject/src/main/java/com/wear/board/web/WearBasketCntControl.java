package com.wear.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.board.service.WearBoardService;
import com.wear.board.service.WearBoardServiceImpl;
import com.wear.common.Control;

public class WearBasketCntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logId");
		WearBoardService svc = new WearBoardServiceImpl();
		int baskCnt = svc.getCartCnt(id);
		
		resp.getWriter().print("{\"basketCount\": "+baskCnt+ "}");
	}

}
