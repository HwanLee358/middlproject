package com.wear.member.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;


public class memberinfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String userId = req.getParameter("userId");
		String userName = req.getParameter("name");
		String userPW = req.getParameter("userPW");
		String address1 = req.getParameter("address1");
		String address2 =req.getParameter("address2");
		String address3 = req.getParameter("address3");
		String address4 = req.getParameter("address4");
		String userPhone = req.getParameter("phone");
		String userEmail = req.getParameter("email");

		MemberService svc = new MemberServiceImpl();
		MemberVo member = new MemberVo();
		
		member.setUserId(userId);
		member.setUserPW(userPW);
		member.setUserName(userName);
		member.setAddress1(address1);
		member.setAddress2(address2);
		member.setAddress3(address3);
		member.setAddress4(address4);
		member.setUserPhone(userPhone);
		member.setUserEmail(userEmail);
	
		if (svc.modifyMember(member)) { // 수정...
			resp.sendRedirect("infoResult.do");
			System.out.println("성공");
			
		} else {
			resp.sendRedirect("info.do");
			System.out.println("실패");

		}
	
	}
}


		
		
	


