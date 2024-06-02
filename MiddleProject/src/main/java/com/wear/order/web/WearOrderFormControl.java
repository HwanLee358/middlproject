package com.wear.order.web;

import java.io.IOException;
import java.util.ArrayList;
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
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		if(form.equals("direct")) {
			String pNo = req.getParameter("pno");
			String[] postNo = pNo.split(",");
			String pCnt = req.getParameter("pCnt");
			String[] productCnt = pCnt.split(",");
			for(int i =0; i<postNo.length; i++) {
				OrderVO vo = new OrderVO();
				vo = svc.directList(Integer.parseInt(postNo[i]));
				vo.setProductCnt(Integer.parseInt(productCnt[i]));
				list.add(vo);
			}							
		}else if(form.equals("basket")){
			String sel = req.getParameter("selete");
			if(sel.equals("seleted")) {
				String bno = req.getParameter("bno");
				String[] basketNo = bno.split(",");
				for(int i = 0; i < basketNo.length; i++) {
					OrderVO vo = new OrderVO();
					vo.setBasketNo(Integer.parseInt(basketNo[i]));
					vo.setUserId(id);
					vo = svc.getOrderBasket(vo);
					list.add(vo);
				}
			}else {
				list = svc.selectList(id);							
			}
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
