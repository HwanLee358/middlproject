package com.wear.basket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.basket.service.CerBoardService;
import com.wear.basket.service.CerBoardServiceImpl;
import com.wear.basket.vo.CerBoardVO;
import com.wear.basket.vo.SearchVO;
import com.wear.common.Control;

public class CerBoardList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "cerboard/cerboardList.tiles";
		
		CerBoardService svc = new CerBoardServiceImpl();
		SearchVO search = new SearchVO();
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		search.setPage(Integer.parseInt(page));
		
		List<CerBoardVO> list = svc.cerboardList(search);
		
		req.setAttribute("cerboardList", list);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
