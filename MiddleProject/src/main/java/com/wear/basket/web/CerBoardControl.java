package com.wear.basket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.basket.service.CerBoardService;
import com.wear.basket.service.CerBoardServiceImpl;
import com.wear.basket.vo.CerBoardVO;
import com.wear.basket.vo.SearchVO;
import com.wear.common.Control;

public class CerBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		String orderNo = req.getParameter("pno");
		String page = req.getParameter("page");
		
		System.out.println(orderNo);
		System.out.println(page);
		
		CerBoardService svc = new CerBoardServiceImpl();
		SearchVO vo = new SearchVO();
		vo.setOrderNo(Integer.parseInt(orderNo));
		List<CerBoardVO> list = svc.selectcerboard(vo);
		System.out.println(list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);

		resp.getWriter().print(json);
	}

}
