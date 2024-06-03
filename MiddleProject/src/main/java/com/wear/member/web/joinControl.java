package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;

public class joinControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userName = req.getParameter("name");
		String userPW = req.getParameter("userPW");
		String address1 = req.getParameter("address1");
		String address2 =req.getParameter("address2");
		String address3 = req.getParameter("address3");
		String address4 = req.getParameter("address4");
		String userPhone = req.getParameter("phone");
		String userEmail = req.getParameter("email");
		String userResp = req.getParameter("resp");
		System.out.println(address2);
		

		//MemberVo mvo = svc.checkMember(writer);
		//if (mvo == null) {
			//req.setAttribute("message", "권한이 없습니다.");
			//req.getRequestDispatcher("WEB-INF/board/addBoard.jsp")//
					//.forward(req, resp);

			//return;
		//}
		MemberService svc = new MemberServiceImpl();
		MemberVo vo = new MemberVo();
		
		vo.setUserId(userId);
		vo.setUserPW(userPW);
		vo.setUserName(userName);
		vo.setAddress1(address1);
		vo.setAddress2(address2);
		vo.setAddress3(address3);
		vo.setAddress4(address4);
		vo.setUserEmail(userEmail);
		vo.setUserPhone(userPhone);
		vo.setUserResp(userResp);
		
		if (svc.MemberJoin(vo)) {
			System.out.println("등록성공.");
			resp.sendRedirect("joinResult.do");

		} else {
			System.out.println("등록실패.");
			resp.sendRedirect("join.do");

		}

	}

}
