package com.wear.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.mapper.WearBoardMapper;
import com.wear.vo.CategoryVO;


public class WearBoardServiceImpl implements WearBoardService{
	SqlSession session = DataSource.getInstance().openSession(true);
	WearBoardMapper mapper = session.getMapper(WearBoardMapper.class);
	
	@Override
	public List<CategoryVO> WearBoardList() {
		// TODO Auto-generated method stub
		return mapper.boardcateList();
	}

	@Override
	public List<Map<String, String>> categoryList() {
		// TODO Auto-generated method stub
		return mapper.cateList();
	}

}
