package com.wear.member.service;

import com.wear.member.vo.MemberVo;

public interface MemberService {
	
	 boolean MemberJoin(MemberVo Member);

	//로그인
	MemberVo login(String id, String pw);
	MemberVo checkMember(String userId);
	
	MemberVo getMember(String userId);
	
	
	boolean checkId(String userId);
	boolean modifyMember(MemberVo Member);
}
