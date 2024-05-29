package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;

public class deleteFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String path = "member/deleteMember.tiles";
		
		String userId = req.getParameter("id");	
		
		MemberService svc = new MemberServiceImpl();
		MemberVo vo = svc.sList(userId);
			
		System.out.println(vo+"@@@@@@@@@@@@@@@@@@@@@@@@");
		
		req.setAttribute("result", vo);
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
		
	}


