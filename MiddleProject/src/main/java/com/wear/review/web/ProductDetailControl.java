package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;
import com.wear.review.vo.ProductVO;

public class ProductDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		ProductService svp = new ProductServiceImpl();
		//String page = req.getParameter("page");
		//req.setAttribute("page", page);
		String pno = req.getParameter("pno");
		req.setAttribute("productNo", pno);
		
		
		
		String path = "productInfo/productDetail.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
