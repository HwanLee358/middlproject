package com.wear.basket.service;

import java.util.List;

import com.wear.basket.vo.CerBoardVO;
import com.wear.basket.vo.SearchVO;

public interface CerBoardService {
	// 중간프로젝트 취소/교환/반품
	List<CerBoardVO> selectcerboard(SearchVO search);
}
