package com.wear.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;

public class WearOrderCompleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "productorder/orderComplete.tiles";
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
