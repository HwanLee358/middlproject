package com.wear.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.WearBoardService;
import com.wear.board.service.WearBoardServiceImpl;
import com.wear.board.vo.ProductVO;
import com.wear.board.vo.SearchPageDTO;
import com.wear.board.vo.SearchVO;
import com.wear.common.Control;

public class WearSearchControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/search.tiles";
		String kw = req.getParameter("keyword");
		String page = req.getParameter("page");
		
		page = page == null ? "1" : page;
		SearchVO sc = new SearchVO();
		sc.setKeyword(kw);
		sc.setPage(Integer.parseInt(page));
		WearBoardService svc = new WearBoardServiceImpl();
		List<ProductVO> list = svc.searchBoard(sc);
		int scCnt = svc.searchTotal(sc);
		SearchPageDTO paging = new SearchPageDTO(Integer.parseInt(page) , scCnt);
		System.out.println(list);
		System.out.println(scCnt);
		System.out.println(paging);
		req.setAttribute("searchBoard", list);
		req.setAttribute("searchCnt", scCnt);
		req.setAttribute("searchPaging", paging);
		req.setAttribute("keyword", kw);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
