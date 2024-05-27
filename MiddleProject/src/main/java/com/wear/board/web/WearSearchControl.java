package com.wear.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.WearBoardService;
import com.wear.board.service.WearBoardServiceImpl;
import com.wear.board.vo.CategoryVO;
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
		
		String cateNo = req.getParameter("category_no");
		String price1 = req.getParameter("productPrice1");
		String price2 = req.getParameter("productPrice2");
		
		page = page == null ? "1" : page;
		SearchVO sc = new SearchVO();
		sc.setKeyword(kw);
		sc.setPage(Integer.parseInt(page));
		
		if(cateNo != null && cateNo != "") {
			sc.setCategoryNo(Integer.parseInt(cateNo));				
		}
		if(price1 != null && price1 != "") {
			sc.setProductPrice1(Integer.parseInt(price1));
			System.out.println(price1);
		}
		if(price2 != null && price2 != "") {
			sc.setProductPrice2(Integer.parseInt(price2));
			System.out.println(price2);
		}
		
		WearBoardService svc = new WearBoardServiceImpl();
		List<ProductVO> list = svc.searchBoard(sc);
		int scCnt = svc.searchTotal(sc);
		SearchPageDTO paging = new SearchPageDTO(Integer.parseInt(page) , scCnt);
		
		List<CategoryVO> option = svc.searchOption();
		
		req.setAttribute("searchBoard", list);
		req.setAttribute("searchCnt", scCnt);
		req.setAttribute("searchPaging", paging);
		
		req.setAttribute("keyword", kw);
		req.setAttribute("cateOption", option);
		req.setAttribute("inputPrice1", price1);
		req.setAttribute("inputPrice2", price2);
		
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
