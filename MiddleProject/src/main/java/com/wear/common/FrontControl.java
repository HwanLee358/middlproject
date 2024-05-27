package com.wear.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.board.web.WearBoardControl;
import com.wear.board.web.WearBoardheaderControl;
import com.wear.board.web.WearSearchControl;
import com.wear.member.web.CheckIdControl;
import com.wear.member.web.LoginControl;
import com.wear.member.web.LoginForm;
import com.wear.member.web.LogoutControl;
import com.wear.member.web.findIdControl;
import com.wear.member.web.findIdFormControl;
import com.wear.member.web.findIdResultFormControl;
import com.wear.member.web.findPWControl;
import com.wear.member.web.findPWFormControl;
import com.wear.member.web.findPWResultFormControl;
import com.wear.member.web.joinControl;
import com.wear.member.web.joinFormControl;
import com.wear.review.web.ProductDetailControl;
import com.wear.review.web.ReviewFormControl;
import com.wear.review.web.ReviewListControl;
import com.wear.review.web.ReviewWriteControl;




public class FrontControl extends HttpServlet{
	Map<String, Control> map;
	
	public FrontControl() {
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 이정환
		map.put("/header.do", new WearBoardheaderControl()); // category header 처리
		map.put("/search.do", new WearSearchControl()); 
		map.put("/list.do", new WearBoardControl());  
		
		
		// 정유진
		map.put("/reviewForm.do", new ReviewFormControl());
		map.put("/reviewWrite.do", new ReviewWriteControl());
		map.put("/reviewList.do", new ReviewListControl());
		// 제품상세
		map.put("/productDetail.do", new ProductDetailControl());;
		
		
		// 맹선우
		
		
		
		// 배동규
		map.put("/joinForm.do", new joinFormControl());
		map.put("/join.do", new joinControl()); // 회원가입화면
		
		map.put("/logForm.do", new LoginForm()); //로그인 관련
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/check.do", new CheckIdControl());//중복체크
		
		map.put("/findId.do", new findIdControl());
		map.put("/findIdForm.do", new findIdFormControl());
		map.put("/findIdResultForm.do", new findIdResultFormControl());		
		
		map.put("/findPW.do", new findPWControl());
		map.put("/findPWForm.do", new findPWFormControl());
		map.put("/findPWResultForm.do", new findPWResultFormControl());		
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
