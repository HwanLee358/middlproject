package com.wear.basket.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.basket.mapper.CerBoardMapper;
import com.wear.basket.vo.CerBoardVO;
import com.wear.basket.vo.SearchVO;
import com.wear.common.DataSource;

public class CerBoardServiceImpl implements CerBoardService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	CerBoardMapper mapper = session.getMapper(CerBoardMapper.class);
	@Override
	public List<CerBoardVO> cerboardList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.cerboardListPaging(search);
	}

}
