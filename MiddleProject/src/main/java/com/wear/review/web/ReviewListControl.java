package com.wear.review.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.review.service.ReviewService;
import com.wear.review.service.ReviewServiceImpl;
import com.wear.review.vo.PageDTO;
import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public class ReviewListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "productInfo/reviewList.tiles";

		ReviewService svr = new ReviewServiceImpl();
		SearchVO search = new SearchVO();

		String page = req.getParameter("page"); // page 파라미터가 없을 경우에는 1페이지 출력.
		page = page == null ? "1" : page; // 페이지 파라미터 없으면 1페이지 보이기
		search.setPage(Integer.parseInt(page));
		
		ReviewVO rvo = new ReviewVO();
		List<ReviewVO> img = svr.imgList(rvo);	//이미지 전체 가져오기
		List<ReviewVO> reviewCnt = svr.totalCnt(rvo);	// 전체 리뷰갯수
		List<ReviewVO> list = svr.ReviewList(search); // 목록
		
		PageDTO pdto = new PageDTO(Integer.parseInt(page), svr.getReviewCnt(Integer.parseInt(page)));
		System.out.println(pdto);

		req.setAttribute("totalImg", img);
		req.setAttribute("totalCnt", reviewCnt);
		req.setAttribute("reviewList", list);
		req.setAttribute("paging", pdto);
		
		// ★순서조심★
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
