package com.wear.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.wear.board.mapper.WearBoardMapper;
import com.wear.board.vo.CategoryVO;
import com.wear.board.vo.ProductVO;
import com.wear.board.vo.SearchVO;
import com.wear.common.DataSource;

public class WearBoardServiceImpl implements WearBoardService{
	SqlSession session = DataSource.getInstance().openSession(true);
	WearBoardMapper mapper = session.getMapper(WearBoardMapper.class);
	
	// category menu 
	@Override
	public List<Map<String, String>> categoryList() {
		// TODO Auto-generated method stub
		return mapper.cateList();
	}
	
	// category main
	@Override
	public List<ProductVO> WearBoardList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.boardcateList(search);
	}
	
	@Override
	public List<CategoryVO> categorytitle(String no) {
		// TODO Auto-generated method stub
		return mapper.catetitle(no);
	}
	
	@Override
	public int mainTotal(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.mainTotalCnt(search);
	}
	
	// category sub
	@Override
	public List<ProductVO> minicategory(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.minicategory(search);
	}
	
	@Override
	public List<CategoryVO> miniboard(String no) {
		// TODO Auto-generated method stub
		return mapper.miniboard(no);
	}

	@Override
	public int subTotal(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.subTotalCnt(search);
	}

	
	// search
	@Override
	public List<ProductVO> searchBoard(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.searchBoard(search);
	}

	@Override
	public int searchTotal(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.searchCnt(search);
	}

	@Override
	public List<CategoryVO> searchOption() {
		// TODO Auto-generated method stub
		return mapper.searchCate();
	}

	@Override
	public List<ProductVO> RecentList() {
		// TODO Auto-generated method stub
		return mapper.RecentList();
	}

	@Override
	public List<ProductVO> bestList() {
		// TODO Auto-generated method stub
		return mapper.bestList();
	}

	
	@Override
	public int getWishCnts(String id) {
		// TODO Auto-generated method stub
		return mapper.getWishCnts(id);
	}

	@Override
	public int getCartCnt(String id) {
		// TODO Auto-generated method stub
		return mapper.getCartCnt(id);
	}



}