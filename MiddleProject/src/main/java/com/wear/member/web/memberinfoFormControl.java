package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;



public class memberinfoFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String path = "member/information.tiles";
		
		String userId = req.getParameter("id");	
		
		MemberService svc = new MemberServiceImpl();
		MemberVo vo = svc.sList(userId);

		
		req.setAttribute("result", vo);
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
}


