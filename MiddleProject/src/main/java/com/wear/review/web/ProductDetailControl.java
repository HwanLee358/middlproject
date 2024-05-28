package com.wear.review.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;
import com.wear.review.service.ReviewService;
import com.wear.review.service.ReviewServiceImpl;
import com.wear.review.vo.PageDTO;
import com.wear.review.vo.ProductVO;
import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public class ProductDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService svp = new ProductServiceImpl();

		String pno = req.getParameter("pno");
		ProductVO pvo = svp.getProduct(Integer.parseInt(pno));
		req.setAttribute("result", pvo);

		// 제품 번호 하나 선택해서 전체 보여주는 쿼리필요
		SearchVO search = new SearchVO();
		String page = req.getParameter("page"); // page 파라미터가 없을 경우에는 1페이지 출력.
		page = page == null ? "1" : page; // 페이지 파라미터 없으면 1페이지 보이기

		search.setPage(Integer.parseInt(page));

		ReviewService svr = new ReviewServiceImpl();
		ReviewVO rvo = new ReviewVO();

		rvo.setProductNo(Integer.parseInt(pno)); // 선택된 제품번호
		List<ReviewVO> img = svr.imgList(rvo.getProductNo()); // 이미지 전체 가져오기
		int reviewCnt = svr.totalCnt(rvo); // 전체 리뷰갯수 [40] 적히는 부분
		System.out.println(reviewCnt);

		List<ReviewVO> list = svr.ReviewList(search); // 목록

		PageDTO pdto = new PageDTO(Integer.parseInt(page), svr.getReviewCnt(rvo.getProductNo()));
		System.out.println(pdto);

		req.setAttribute("totalImg", img);
		req.setAttribute("totalCnt", reviewCnt);
		req.setAttribute("reviewList", list);
		req.setAttribute("paging", pdto);
		req.setAttribute("pno", pno);

		String path = "productInfo/productDetail.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
