package com.wear.board.service;

import java.util.List;
import java.util.Map;

import com.wear.board.vo.CategoryVO;
import com.wear.board.vo.ProductVO;
import com.wear.board.vo.SearchVO;

public interface WearBoardService {
	//recent
	List<ProductVO> RecentList();
	List<ProductVO> bestList();
	// category main
	List<ProductVO> WearBoardList(SearchVO search);
	List<CategoryVO> categorytitle(String no);
	int mainTotal(SearchVO search);
	
	// category sub
	List<ProductVO> minicategory(SearchVO search);
	List<CategoryVO> miniboard(String no);
	int subTotal(SearchVO search);
	
	// search
	List<ProductVO> searchBoard(SearchVO search);
	int searchTotal(SearchVO search);
	List<CategoryVO> searchOption();
	//category menu
	List<Map<String, String>> categoryList();
}