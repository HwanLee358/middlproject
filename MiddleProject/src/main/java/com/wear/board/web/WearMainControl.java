package com.wear.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.WearBoardService;
import com.wear.board.service.WearBoardServiceImpl;
import com.wear.board.vo.ProductVO;
import com.wear.common.Control;

public class WearMainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/main.tiles";
		WearBoardService svc = new WearBoardServiceImpl();
		List<ProductVO> list = svc.RecentList();
		List<ProductVO> bestList = svc.bestList();
		System.out.println(bestList);
		req.setAttribute("wearList", list);
		req.setAttribute("WearBest", bestList);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
