package com.wear.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;
import com.wear.order.service.OrderService;
import com.wear.order.service.OrderServiceImpl;
import com.wear.order.vo.SaveOrderVO;

public class WearOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str = req.getParameter("pNo");
		String[] postNo = str.split(",");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
		String address3 = req.getParameter("address3");
		String address4 = req.getParameter("address4");
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logId");
		OrderService svc = new OrderServiceImpl();
		
		for(int i=0; i< postNo.length; i++) {
			SaveOrderVO vo = new SaveOrderVO();
			vo.setUserId(id);
			vo.setProductInfoNo(Integer.parseInt(postNo[i]));
			vo.setUserName(name);
			vo.setUserPhone(phone);
			vo.setUserEmail(email);
			vo.setAddress1(address1);
			vo.setAddress1(address2);
			vo.setAddress1(address3);
			vo.setAddress1(address4);
			
		}
	}

}
