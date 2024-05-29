package com.wear.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.board.mapper.QnaBoardMapper;
import com.wear.board.vo.QnaVO;
import com.wear.board.vo.SearchVO;
import com.wear.common.DataSource;

public class QnaBoardServiceImpl implements QnaBoardService{
	SqlSession session = DataSource.getInstance().openSession(true);
	QnaBoardMapper mapper = session.getMapper(QnaBoardMapper.class);
	
	// insert
	@Override
	public Boolean addQna(QnaVO qnaboard) {
		// TODO Auto-generated method stub
		return mapper.insertQna(qnaboard) == 1;
	}

	@Override
	public List<QnaVO> selectQna(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectQna(search);
	}

	@Override
	public QnaVO getQnaInfo(int postNo) {
		// TODO Auto-generated method stub
		return mapper.QnaList(postNo);
	}

	@Override
	public int addViews(int postNo) {
		// TODO Auto-generated method stub
		return mapper.updateViews(postNo);
	}
}
