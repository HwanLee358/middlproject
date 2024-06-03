package com.wear.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.basket.web.AddBasketControl;
import com.wear.basket.web.BasketList;
import com.wear.basket.web.BasketList1;
import com.wear.basket.web.BasketOrderControl;
import com.wear.basket.web.CerBoardControl;
import com.wear.basket.web.DelBasket;
import com.wear.basket.web.EditBasket;
import com.wear.board.web.WearBasketCntControl;
import com.wear.board.web.WearBoardControl;
import com.wear.board.web.WearBoardheaderControl;
import com.wear.board.web.WearMainControl;
import com.wear.board.web.WearQnAControl;
import com.wear.board.web.WearQnAFormControl;
import com.wear.board.web.WearQnAInfoControl;
import com.wear.board.web.WearQnAaddControl;
import com.wear.board.web.WearQnAdelControl;
import com.wear.board.web.WearQnAmodifyFormControl;
import com.wear.board.web.WearQnamodifyControl;
import com.wear.board.web.WearSearchControl;
import com.wear.board.web.WearTotalControl;
import com.wear.board.web.WearWishCntControl;
import com.wear.member.web.CheckIdControl;
import com.wear.member.web.LoginControl;
import com.wear.member.web.LoginForm;
import com.wear.member.web.LogoutControl;
import com.wear.member.web.deleteControl;
import com.wear.member.web.deleteFailControl;
import com.wear.member.web.deleteFormControl;
import com.wear.member.web.deleteResultControl;
import com.wear.member.web.findFailControl;
import com.wear.member.web.findIdControl;
import com.wear.member.web.findIdFormControl;
import com.wear.member.web.findIdResultFormControl;
import com.wear.member.web.findPWControl;
import com.wear.member.web.findPWFormControl;
import com.wear.member.web.findPWResultFormControl;
import com.wear.member.web.joinControl;
import com.wear.member.web.joinFormControl;

import com.wear.member.web.logFailControl;

import com.wear.member.web.memberinfoControl;
import com.wear.member.web.memberinfoFormControl;
import com.wear.member.web.memberinfoResultControl;
import com.wear.order.web.WearOrderCompleteControl;
import com.wear.order.web.WearOrderControl;
import com.wear.order.web.WearOrderFormControl;

import com.wear.review.web.AdminPage;

import com.wear.order.web.WearOrderInfoControl;

import com.wear.review.web.BuyNow;
import com.wear.review.web.MemberControl;
import com.wear.review.web.MemberRemoveControl;
import com.wear.review.web.ModifyReviewFormControl;
import com.wear.review.web.ProductDetailControl;
import com.wear.review.web.ProductInfoControl;
import com.wear.review.web.RegisterBasket;
import com.wear.review.web.RegisterWish;
import com.wear.review.web.ReviewFormControl;
import com.wear.review.web.ReviewListControl;
import com.wear.review.web.ReviewWriteControl;
import com.wear.wishlist.web.AddWishlistControl;
import com.wear.wishlist.web.DelWishList;
import com.wear.wishlist.web.WishList;
import com.wear.wishlist.web.WishList1;

public class FrontControl extends HttpServlet {
	Map<String, Control> map;

	public FrontControl() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 이정환
		map.put("/main.do", new WearMainControl());
		map.put("/header.do", new WearBoardheaderControl()); // category header 처리
		map.put("/search.do", new WearSearchControl());
		map.put("/list.do", new WearBoardControl());
		
		map.put("/orderForm.do", new WearOrderFormControl());
		map.put("/order.do", new WearOrderControl());
		map.put("/orderComplete.do", new WearOrderCompleteControl());
		map.put("/orderInfo.do", new WearOrderInfoControl());
		
		map.put("/wishCnt.do", new WearWishCntControl());
		map.put("/basketCnt.do", new WearBasketCntControl());
		
		
		map.put("/qnaList.do", new WearQnAControl()); //qnaList
		map.put("/qnaInfo.do", new WearQnAInfoControl()); //qna 정보
		map.put("/qnaWriteForm.do", new WearQnAFormControl()); // qna 폼
		map.put("/qnaWrite.do", new WearQnAaddControl()); // qna 쓰기
		map.put("/qnaModifyForm.do", new WearQnAmodifyFormControl());
		map.put("/qnaModify.do", new WearQnamodifyControl());
		map.put("/qnaDelte.do", new WearQnAdelControl());
		map.put("/getTotalCnt.do", new WearTotalControl());

		// 정유진
		map.put("/reviewForm.do", new ReviewFormControl());
		map.put("/reviewWrite.do", new ReviewWriteControl());
		map.put("/reviewList.do", new ReviewListControl());
		
		map.put("/getProductInfoNo.do", new ProductInfoControl()); // 상품옵션포함딘 번호.
		map.put("/registerBasket.do", new RegisterBasket()); // 장바구니에 등록.
		map.put("/registerWisht.do", new RegisterWish());//위시리스트에 등록
		map.put("/registerBuy.do", new BuyNow());//바로구매에 등록
		
		map.put("/productDetail.do", new ProductDetailControl());
		map.put("/reviewModify", new ModifyReviewFormControl());
		
		map.put("/adminpage.do", new AdminPage()); //관리자 페이지
		map.put("/memberManagement.do", new MemberControl()); //관리자 회원관리

		map.put("/memberRemove.do", new MemberRemoveControl()); //멤버삭제

		
		// 맹선우
		map.put("/basketList1.do", new BasketList1()); // 장바구니 화면 출력
		map.put("/basketList.do", new BasketList()); // 장바구니 목록
		map.put("/editBasket.do", new EditBasket()); // 수량변경
		map.put("/delBasket.do", new DelBasket()); // 삭제
		map.put("/wishList.do", new WishList()); // 위시리스트
		map.put("/wishList1.do", new WishList1()); // 위시리스트 화면 출력
		map.put("/delWishList.do", new DelWishList()); // 위시리스트 삭제 기능

		map.put("/addwishlist.do", new AddWishlistControl()); // 위시리스트 버튼 클릭시 상품을 위시리스트에 저장 
		map.put("/addbasket.do", new AddBasketControl()); // 위시리스트에서 장바구니로 이동
		map.put("/orderbasket.do", new BasketOrderControl()); // 주문버튼 클릭 시 주문 페이지로 이동
		map.put("/cerBoardList.do", new CerBoardControl()); // 취소/교환/반품 목록

		// 배동규
		map.put("/joinForm.do", new joinFormControl());
		map.put("/join.do", new joinControl()); // 회원가입화면

		map.put("/logForm.do", new LoginForm()); // 로그인 관련
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/check.do", new CheckIdControl());// 중복체크
		map.put("/logFail.do", new logFailControl()); //실패결과
		
		map.put("/findId.do", new findIdControl()); // 아이디찾기
		map.put("/findIdForm.do", new findIdFormControl());
		map.put("/findIdResultForm.do", new findIdResultFormControl()); // 결과창
		
		map.put("/findFail.do", new findFailControl()); //실패결과

		map.put("/findPW.do", new findPWControl()); // 패스워드찾기
		map.put("/findPWForm.do", new findPWFormControl());

		map.put("/findPWResultForm.do", new findPWResultFormControl());		//결과창

		map.put("/info.do", new memberinfoFormControl());
		map.put("/infoForm.do", new memberinfoControl());
		map.put("/infoResult.do", new memberinfoResultControl());
		
		map.put("/delete.do", new deleteControl());
		map.put("/deleteForm.do", new deleteFormControl());
		map.put("/deleteResult.do", new deleteResultControl());
		map.put("/deleteFail.do", new deleteFailControl());
		
	//	map.put("/info.do", new memberinfoControl());
	//	map.put("/infoForm.do", new memberinfoFormControl());
		//	map.put("/updatePW.do", new updatePWControl()); // 찾은 비밀번호변경)
//		map.put("/findId.do", new findIdForm());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		String context = req.getContextPath();
		System.out.println("uri: " + uri + ", context: " + context);
		String path = uri.substring(context.length());
		System.out.println("path: " + path);

		Control control = map.get(path);
		control.exec(req, resp);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}
}
