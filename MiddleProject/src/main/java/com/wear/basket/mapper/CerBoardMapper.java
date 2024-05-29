package com.wear.basket.mapper;

import java.util.List;

import com.wear.basket.vo.SearchVO;
import com.wear.basket.vo.CerBoardVO;

public interface CerBoardMapper {
	List<CerBoardVO> selectcerboard(SearchVO search);
	int getTotalCnt(SearchVO search);
}
