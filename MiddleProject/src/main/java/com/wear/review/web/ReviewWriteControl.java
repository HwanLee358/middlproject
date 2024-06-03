package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wear.common.Control;
import com.wear.review.service.ProductService;
import com.wear.review.service.ProductServiceImpl;
import com.wear.review.service.ReviewService;
import com.wear.review.service.ReviewServiceImpl;
import com.wear.review.vo.ProductVO;
import com.wear.review.vo.ReviewVO;

public class ReviewWriteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("logId");
		System.out.println(id);

		// insert 받는 제품 리뷰
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		// select 제품 정보
		ProductService psv = new ProductServiceImpl();

		String pno = mr.getParameter("pno");

		ProductVO pvo = psv.getProduct(Integer.parseInt(pno));
		req.setAttribute("product", pvo);
		req.setAttribute("pno", pno);
		// 1제품사진,2제품이름,3제품사이즈,4제품색상 그리고 5사용자 닉네임 가지고 가야함
		String img = mr.getFilesystemName("reviewImg");
		String score = mr.getParameter("score");
		String content = mr.getParameter("content");

		ReviewService svr = new ReviewServiceImpl();
		ReviewVO rvo = new ReviewVO();
		// MemberVO mvo = svr.checkMember();
		
		rvo.setProductNo(Integer.parseInt(pno));
		rvo.setContent(content);
		rvo.setViewScore(Integer.parseInt(score));
		rvo.setReviewImg(img);
		rvo.setUserId(id);

		if (svr.addReview(rvo)) {
			System.out.println("등록성공");
//			resp.sendRedirect("reviewList.do");
		} else {
			System.out.println("등록실패");
//			resp.sendRedirect("reviewWrite.do");
		}

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(rvo);
		resp.getWriter().print(json);
		
	}

}
