package com.wear.order.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.common.Control;
import com.wear.order.service.OrderService;
import com.wear.order.service.OrderServiceImpl;
import com.wear.order.vo.OrderCheckVO;
import com.wear.order.vo.OrderNoVo;
import com.wear.review.vo.PageDTO;

public class WearOrderInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		if(userId == null) {
			resp.sendRedirect("logForm.do");
		}
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		OrderService svo = new OrderServiceImpl();
		OrderNoVo nvo = new OrderNoVo();
		nvo.setUserId(userId);
		nvo.setPage(Integer.parseInt(page));
		List<Map<String, Object>> list = svo.getOrderNo(nvo);
		List<Map<String, Object>> orlist = new ArrayList<Map<String,Object>>();
		System.out.println(list);
		
		for(Map<String, Object> map : list) {
			Map<String, Object> ormap = new HashMap<String, Object>();
			ormap.put("order_no", map.get("ORDER_NO"));
			ormap.put("product_date", map.get("PRODUCT_DATE"));
			int no = Integer.parseInt(map.get("ORDER_NO").toString());
			int cnt = svo.getOrderCnt(no);
			ormap.put("product_cnt", cnt);
			OrderNoVo vo = new OrderNoVo();
			vo.setUserId(userId);
			vo.setOrderNo(no);
			System.out.println(no);
			List<OrderCheckVO> orListInfo = svo.getOrderCheck(vo);
			ormap.put("order_info", orListInfo);
			System.out.println(ormap);
			orlist.add(ormap);
		}
		System.out.println(orlist);
		
		PageDTO paing = new PageDTO(Integer.parseInt(page), svo.getPageOrderCnt(userId));
		
		req.setAttribute("orList", orlist);
		req.setAttribute("orderPaging", paing);
		String path = "productorder/orderInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
