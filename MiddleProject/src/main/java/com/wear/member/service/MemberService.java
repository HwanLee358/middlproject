package com.wear.member.service;

import com.wear.member.vo.MemberVo;

public interface MemberService {
	
	 boolean MemberJoin(MemberVo Member);

	//로그인
	MemberVo login(String id, String pw);
	MemberVo checkMember(String userId);
	
	MemberVo getMember(String userId);
	
	
	boolean checkId(String userId);
	
	//찾기
	MemberVo searchId(String userName,String userPhone);
	MemberVo searchPW(String id, String userName, String userPhone);	
	
	
}
