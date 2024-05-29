package com.wear.basket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.basket.service.BasketService;
import com.wear.basket.service.BasketServiceImpl;
import com.wear.basket.vo.BasketVO;
import com.wear.common.Control;

public class BasketList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		BasketService svc = new BasketServiceImpl();
		List<BasketVO> list = svc.basketList();		

		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(list));
	}

}
