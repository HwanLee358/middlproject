package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;

public class deleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String userId = req.getParameter("userId");	
		String userPW = req.getParameter("userPW");	
		
		MemberService svc = new MemberServiceImpl();
		MemberVo vo = svc.sList(userId);
		vo.setUserId(userId);
		vo.setUserPW(userPW);

		
		if (svc.deleteMember(vo)) { 
			resp.sendRedirect("deleteResult.do");
		} else {
			resp.sendRedirect("deleteFail.do");

		}
	}



}
