package com.wear.service;

import java.util.List;
import java.util.Map;

import com.wear.vo.CategoryVO;

public interface WearBoardService {
	List<CategoryVO> WearList();
	List<Map<String, String>> categoryList();
}
