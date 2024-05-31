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

public class findPWControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		String id = req.getParameter("userId");
		String name = req.getParameter("userName");
		String phone = req.getParameter("userPhone");

		MemberService svc = new MemberServiceImpl();
		MemberVo mvo = svc.searchPW(id, name, phone);

		HttpSession session = req.getSession();
		if (mvo != null) {
			session.setAttribute("userPW", mvo.getUserPW());
			resp.sendRedirect("findPWResultForm.do");

		} else {
			
			resp.sendRedirect("findPWForm.do");

		}

	}

}
