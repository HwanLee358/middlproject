package com.wear.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.common.Control;
import com.wear.service.WearBoardService;
import com.wear.service.WearBoardServiceImpl;
import com.wear.vo.CategoryVO;

public class WearBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "wearboard/list.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
