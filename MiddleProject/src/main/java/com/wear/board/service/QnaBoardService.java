package com.wear.board.service;

import java.util.List;

import com.wear.board.vo.QnaVO;
import com.wear.board.vo.SearchVO;

public interface QnaBoardService {
	// Qna List
	List<QnaVO> selectQna(SearchVO search);
	// Qna 쓰기
	Boolean addQna(QnaVO qnaboard);
	// Qna 정보
	QnaVO getQnaInfo(int postNo);
	// 조회수
	int addViews(int postNo);
	// 수정
	Boolean modifyQna(QnaVO qnaboard);
	// 삭제
	Boolean removeQna(QnaVO qnaboard);
	
	// 페이징
	int getQnaTotalCnt(int productNo);
}
