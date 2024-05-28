package com.wear.board.service;

import java.util.List;

import com.wear.board.vo.QnaVO;
import com.wear.board.vo.SearchVO;

public interface QnaBoardService {
	List<QnaVO> selectQna(SearchVO search);
	Boolean addQna(QnaVO qnaboard);
	QnaVO getQnaInfo(int postNo);
	int addViews(int postNo);
}
