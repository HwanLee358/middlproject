package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;
import com.wear.wishlist.vo.WishVO;

public class BuyNow implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		String pno = req.getParameter("pno");
		String userId = req.getParameter("userId");

		WishVO wvo = new WishVO();
		wvo.setProductNo(Integer.parseInt(pno));
		wvo.setUserId(userId);
		ProductService svc = new ProductServiceImpl();
		
		if(svc.addWish(wvo)) {
			System.out.println("등록성공");
			resp.getWriter().write("{\"status\":\"success\"}");
		}else {
			System.out.println("실패");
			resp.getWriter().write("{\"status\":\"fail\"}");
		}
	}

}
