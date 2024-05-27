package com.wear.wishlist.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.common.Control;
import com.wear.wishlist.service.WishListService;
import com.wear.wishlist.service.WishListServiceImpl;
import com.wear.wishlist.vo.WishListVO;

public class WishList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		WishListService svc = new WishListServiceImpl();
		List<WishListVO> list = svc.WishList();		

		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(list));
	}

}
