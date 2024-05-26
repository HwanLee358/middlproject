package com.wear.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.service.WearBoardService;
import com.wear.board.service.WearBoardServiceImpl;
import com.wear.board.vo.CategoryVO;
import com.wear.board.vo.PageDTO;
import com.wear.board.vo.ProductVO;
import com.wear.board.vo.SearchVO;
import com.wear.common.Control;

public class WearBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/list.tiles";
		
		String cateNo = req.getParameter("cate_no");
		String name = req.getParameter("name");
		
		List<ProductVO> list;
		List<CategoryVO> title;
		
		cateNo = cateNo == null ? "1" : cateNo;
		WearBoardService svc = new WearBoardServiceImpl();
		
		// paging
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		SearchVO search = new SearchVO();
		search.setCategoryNo(Integer.parseInt(cateNo));
		search.setPage(Integer.parseInt(page));
		PageDTO paging;
		
		if(name == null) {
			// main
			list = svc.WearBoardList(search);
			title = svc.categorytitle(cateNo);
			paging = new PageDTO(Integer.parseInt(page), svc.mainTotal(search));
		}else {		
			// sub
			list = svc.minicategory(search);
			title = svc.miniboard(cateNo);
			paging = new PageDTO(Integer.parseInt(page), svc.subTotal(search));
		}
		
		// board
		req.setAttribute("titleList", title);
		req.setAttribute("wearList", list);
		
		// paging
		req.setAttribute("categoryNo", cateNo);
		req.setAttribute("categoryName", name);
		req.setAttribute("paging", paging);
		System.out.println(paging);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
