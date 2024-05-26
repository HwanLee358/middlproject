package com.wear.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.wear.member.vo.MemberVo;

public interface MemberMapper {
	
	
	int insertMember(MemberVo Member);
	//로그인

	MemberVo selectMember(@Param("id") String id, @Param("pw") String pw);
	MemberVo selectMember2(String userId);
	//중복체크
	int CheckId(String userId);
	int updateMember(MemberVo Member); // 수정처리.
}