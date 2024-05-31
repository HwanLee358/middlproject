package com.wear.member.service;

import com.wear.member.vo.MemberVo;

public interface MemberService {
	//회원가입
	 boolean MemberJoin(MemberVo Member);

	//로그인
	MemberVo login(String id, String pw);
	MemberVo checkMember(String userId);
	
	MemberVo getMember(String userId);
	
	//중복체크
	boolean checkId(String userId);
	
	//찾기
	MemberVo searchId(String userName,String userPhone);
	MemberVo searchPW(String userId, String userName, String userPhone);	
	
	MemberVo sList(String userId);

	
	//수정
	boolean modifyMember(MemberVo userId);	
	//삭제
	boolean deleteMember(MemberVo user);

}
