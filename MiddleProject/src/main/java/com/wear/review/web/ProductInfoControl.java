package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.common.Control;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;
import com.wear.review.vo.ProductInfoVO;

public class ProductInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");

		String pno = req.getParameter("pno");
		String color = req.getParameter("color");
		String size = req.getParameter("size");

		ProductInfoVO pvo = new ProductInfoVO();
		pvo.setProductNo(Integer.parseInt(pno));
		pvo.setProductColor(color);
		pvo.setProductSize(size);
		
		System.out.println(pvo);

		ProductService svc = new ProductServiceImpl();
		pvo = svc.getProductInfoNo(pvo);
		System.out.println(pvo);

		req.setAttribute("productInfoNo", pvo);
		
		Gson gson = new GsonBuilder().create();

		resp.getWriter().print(gson.toJson(pvo));

		
	}

}


