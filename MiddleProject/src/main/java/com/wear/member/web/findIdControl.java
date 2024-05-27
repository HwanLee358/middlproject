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

public class findIdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");

		MemberService svc = new MemberServiceImpl();
		MemberVo mvo = svc.searchId(name, phone);
		
		HttpSession session = req.getSession();
		if (mvo != null) {
			session.setAttribute("message","아이디는"+ mvo.getUserId()+"입니다");
			resp.sendRedirect("findIdForm.do");
			System.out.println("ㅎㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
			
		}else{
			session.setAttribute("message","아이디를 찾을수 없습니다.");
			resp.sendRedirect("findIdForm.do");
			System.out.println("쮓ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ");
	}

}
}