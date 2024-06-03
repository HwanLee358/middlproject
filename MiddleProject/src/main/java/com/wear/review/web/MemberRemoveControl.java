package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.member.vo.MemberVo;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;

public class MemberRemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("userId");

		String pNo = req.getParameter("pNo");

		ProductService svp = new ProductServiceImpl();
		MemberVo mvo = new MemberVo();
		mvo.setUserId(uid);
		
		if(svp.removeMember(mvo)) {
			resp.sendRedirect("memberManagement.do");
		}else {
			resp.sendRedirect("memberManagement.do");
		}
	}

}
