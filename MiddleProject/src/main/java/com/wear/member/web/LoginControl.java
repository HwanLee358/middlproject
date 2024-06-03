package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPW");

		MemberService svc = new MemberServiceImpl();
		MemberVo mvo = svc.login(id, pw);
		
		System.out.println(svc.login(id, pw));

		
		if (mvo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("logId", mvo.getUserId());
			// 관리자, 회원.
			if (mvo.getUserResp().equals("Admin"))
				
				//관리자 로그인하면 바로 회원관리& 재고관리 버튼 2개만 있는 페이지로
				
				resp.sendRedirect("adminpage.do");
			else
				resp.sendRedirect("list.do");
			
		} else {
			resp.sendRedirect("logForm.do");
		}
	}

}