package com.wear.board.mapper;

import java.util.List;
import java.util.Map;

import com.wear.board.vo.CategoryVO;
import com.wear.board.vo.ProductVO;
import com.wear.board.vo.QnaVO;
import com.wear.board.vo.SearchVO;

public interface WearBoardMapper {
	//최신
	List<ProductVO> RecentList();
	List<ProductVO> bestList();
	
	//메뉴 전체
	List<ProductVO> boardcateList(SearchVO search);
	List<CategoryVO> catetitle(String categoryNo);
	int mainTotalCnt(SearchVO search);
	
	//작은 타이틀
	List<ProductVO> minicategory(SearchVO search);
	List<CategoryVO> miniboard(String categoryNo);
	int subTotalCnt(SearchVO search);
	
	//검색
	List<ProductVO> searchBoard(SearchVO search);
	int searchCnt(SearchVO search);
	List<CategoryVO> searchCate();
	//카테고리
	List<Map<String, String>> cateList();
	
	
	//QnA
	int addQnA(QnaVO board);
}
