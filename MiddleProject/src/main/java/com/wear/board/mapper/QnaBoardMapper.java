package com.wear.board.mapper;

import java.util.List;

import com.wear.board.vo.QnaVO;
import com.wear.board.vo.SearchVO;

public interface QnaBoardMapper {
	// QnA
	List<QnaVO> selectQna(SearchVO search);
	int insertQna(QnaVO qnaboard);
	QnaVO QnaList(int postNo);
	int updateViews(int postNo);
}
