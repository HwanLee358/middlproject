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
	
	// 수정
	int updateQna(QnaVO qnaboard);
	int deleteQna(QnaVO qnaboard);
	
	// 페이징
	int qnaTotalCnt(int productNo);
}
