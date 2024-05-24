package com.wear.mapper;

import java.util.List;
import java.util.Map;

import com.wear.vo.CategoryVO;

public interface WearBoardMapper {
	List<CategoryVO> boardcateList();
	
	List<Map<String, String>> cateList();
}
