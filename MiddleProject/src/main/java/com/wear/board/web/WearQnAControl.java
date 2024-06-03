package com.wear.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.board.service.QnaBoardService;
import com.wear.board.service.QnaBoardServiceImpl;
import com.wear.board.vo.QnaVO;
import com.wear.board.vo.SearchVO;
import com.wear.common.Control;

public class WearQnAControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		String productNo = req.getParameter("pno");
		String page = req.getParameter("page");
		
		System.out.println(productNo);
		System.out.println(page);
		page = page == null ? "1" : page;
		QnaBoardService svc = new QnaBoardServiceImpl();
		SearchVO vo = new SearchVO();
		vo.setProductNo(Integer.parseInt(productNo));
		vo.setPage(Integer.parseInt(page));
		List<QnaVO> list =svc.selectQna(vo);
		System.out.println(list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);

		resp.getWriter().print(json);
	}

}
