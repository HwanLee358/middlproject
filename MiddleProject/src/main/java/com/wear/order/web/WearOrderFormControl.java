package com.wear.order.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;
import com.wear.member.service.MemberService;
import com.wear.member.service.MemberServiceImpl;
import com.wear.member.vo.MemberVo;
import com.wear.order.service.OrderService;
import com.wear.order.service.OrderServiceImpl;
import com.wear.order.vo.OrderVO;

public class WearOrderFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("logId");
		if(id == null) {
			resp.sendRedirect("logForm.do");
			return;
		}
		String pIN = req.getParameter("pin");
		String form = req.getParameter("form");
		if(form == null) {
			resp.sendRedirect("main.do");
			return;
		}
		MemberService mvc = new MemberServiceImpl();
		OrderService svc = new OrderServiceImpl();
		List<OrderVO> list;
		
		if(form.equals("direct")) {
			list = svc.directList(2);
		}else if(form.equals("basket")){
			list = svc.selectList(id);			
		}else {
			resp.sendRedirect("main.do");
			return;
		}
		
		MemberVo mlist = mvc.checkMember(id);
		System.out.println(mlist);
		System.out.println(list);
		
		
		req.setAttribute("orderList", list);
		req.setAttribute("member", mlist);

		String path = "productorder/orderPage.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
