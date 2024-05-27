package com.wear.wishlist.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.wishlist.service.WishListService;
import com.wear.wishlist.service.WishListServiceImpl;
import com.wear.wishlist.vo.WishListVO;

public class DelWishList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("wishlistNo");
		
		WishListVO wvo = new WishListVO();
		wvo.setWishlistNo(Integer.parseInt(no));
		
		WishListService svc = new WishListServiceImpl();
		if(svc.removeWishList(Integer.parseInt(no))) {
			// {"retCode":"OK"}
			resp.getWriter().print("{\"retCode\":\"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\":\"NG\"}");
		}
	}

}
