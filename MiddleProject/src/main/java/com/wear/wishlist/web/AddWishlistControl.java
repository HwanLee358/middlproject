package com.wear.wishlist.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;
import com.wear.wishlist.service.WishListService;
import com.wear.wishlist.service.WishListServiceImpl;
import com.wear.wishlist.vo.WishListVO;
import com.wear.wishlist.vo.WishVO;

public class AddWishlistControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productNo = req.getParameter("pno");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		WishListService svc = new WishListServiceImpl();
		WishListVO vo = new WishListVO();
		vo.setProductNo(Integer.parseInt(productNo));
		vo.setUserId(userId);
		
		
		if(svc.getSelectWish(vo) ==1 ) {
			resp.getWriter().print("{\"productNo\": "+productNo+ "}");
			return;
		}
		if(svc.addWishlist(vo)) {
			resp.getWriter().print("{\"productNo\": "+productNo+ "}");				
		}else {
			
		}
			
		List<WishVO> list = svc.selectWishList(Integer.parseInt(productNo));
		System.out.println(list);
		
	}

}
