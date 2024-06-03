package com.wear.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.basket.vo.BasketVO;
import com.wear.common.Control;
import com.wear.order.service.OrderService;
import com.wear.order.service.OrderServiceImpl;
import com.wear.order.vo.OrderInfoVO;
import com.wear.order.vo.SaveOrderVO;

public class WearOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pNo = req.getParameter("pNo");
		String[] postNo = pNo.split(",");
		String pCnt = req.getParameter("pCnt");
		String[] productCnt = pCnt.split(",");
		String pPrice = req.getParameter("pPrice");
		String[] productPrice = pPrice.split(",");

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
		
		SaveOrderVO vo = new SaveOrderVO();
		vo.setUserId(id);
		vo.setUserName(name);
		vo.setUserPhone(phone);
		vo.setUserEmail(email);
		vo.setAddress1(address1);
		vo.setAddress2(address2);
		vo.setAddress3(address3);
		vo.setAddress4(address4);
		
		if (svc.addOrder(vo)) {
			for (int i = 0; i < postNo.length; i++) {
				int productNo = svc.getProductNo();
				System.out.println(productNo);
				OrderInfoVO ovo = new OrderInfoVO();
				ovo.setOrderNo(productNo);
				ovo.setProductCnt(Integer.parseInt(productCnt[i]));
				ovo.setProductPrice(Integer.parseInt(productPrice[i]));
				ovo.setProductInfoNo(Integer.parseInt(postNo[i]));
				
				if (svc.OrderInfo(ovo)) {
					BasketVO bvo = new BasketVO();
					bvo.setProductInfoNo(Integer.parseInt(postNo[i]));
					bvo.setUserId(id);
					if (svc.remove(bvo)) {
						
					}
				}
			}
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		}
	}

}
