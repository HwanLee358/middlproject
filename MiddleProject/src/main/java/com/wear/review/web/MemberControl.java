package com.wear.review.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.member.vo.MemberVo;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;

public class MemberControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVo mvo = new MemberVo();
		ProductService svp = new ProductServiceImpl();
		
		List<MemberVo> list = svp.getMemberList();
		req.setAttribute("memberList", list);
		
		
		String path = "productInfo/memberManagement.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
