package com.wear.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;

public class LoginForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

				// TODO Auto-generated method stub
				String path = "WEB-INF/view/member/loginForm.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
				//System.out.println(path+"@@@@@@@@@");
			}

	

	}


