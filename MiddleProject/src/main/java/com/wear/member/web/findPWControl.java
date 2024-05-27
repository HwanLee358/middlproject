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
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");

		MemberService svc = new MemberServiceImpl();
		MemberVo mvo = svc.searchPW(id, name, phone);

		if (mvo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("findPW", mvo.getUserId());
			
			resp.sendRedirect("logForm.do");

		} else {
			resp.sendRedirect("logForm.do");

		}

	}

}
