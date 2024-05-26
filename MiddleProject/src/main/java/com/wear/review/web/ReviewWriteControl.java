package com.wear.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wear.common.Control;
import com.wear.review.service.ReviewService;
import com.wear.review.service.ReviewServiceImpl;
import com.wear.review.vo.ReviewVO;

public class ReviewWriteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
String savePath = req.getServletContext().getRealPath("images");
		
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize,"utf-8", new DefaultFileRenamePolicy());
		// 1제품사진,2제품이름,3제품사이즈,4제품색상 그리고 5사용자 닉네임 가지고 가야함 
		String start = mr.getParameter("star");
		String content = mr.getParameter("content");
		String nickName = mr.getParameter("nickName"); //?
		String img = mr.getFilesystemName("myImg");
		
		ReviewService svr = new ReviewServiceImpl();
		ReviewVO rvo = new ReviewVO();
		//MemberVO mvo = svr.checkMember();
		
		rvo.setContent(content);
		rvo.setViewScore(Integer.parseInt(start));
		rvo.setReviewImg(img);
		rvo.setNickName(nickName);
		
		if(svr.addReview(rvo)) {
			System.out.println("등록성공");
			resp.sendRedirect("reviewList.do");
		}else {
			System.out.println("등록실패");
			resp.sendRedirect("reviewWrite.do");
		}
		
		//req.getRequestDispatcher("WEB-INF/view/productInfo/reviewWrite.jsp").forward(req, resp);
	}

}
