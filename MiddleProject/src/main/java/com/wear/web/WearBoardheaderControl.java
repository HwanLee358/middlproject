package com.wear.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wear.common.Control;
import com.wear.service.WearBoardService;
import com.wear.service.WearBoardServiceImpl;

public class WearBoardheaderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		WearBoardService svc = new WearBoardServiceImpl();
		List<Map<String, String>> list = svc.categoryList();

		List<Map<String, Object>> categoryList = new ArrayList<>();
		Map<String, Object> catMap = null;
		List<String> catList = null;
		String curCateName = null, preCateName = null;
		for (Map<String, String> map : list) {
			String p_code, p_name, c_code, c_name;
			p_code = map.get("cate_col1");
			p_name = map.get("cate_col2");
			c_code = map.get("cate_col3");
			c_name = map.get("cate_col4");
			
			curCateName = p_name == null ? curCateName : p_name;
			if (p_code != null) {
				catMap = new HashMap<String, Object>();
				catList = new ArrayList<>();
				catMap.put("main", p_name);
			} else {
				catList.add(c_name);
			}
			if (!curCateName.equals(preCateName)) {
				catMap.put("sub", catList);
				categoryList.add(catMap);
			}
			preCateName = curCateName;
		}
		// 결과보기.
		for (Map<String, Object> tmap : categoryList) {
			System.out.println(tmap);
		}

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(categoryList);

		resp.getWriter().print(json);
	}

}
