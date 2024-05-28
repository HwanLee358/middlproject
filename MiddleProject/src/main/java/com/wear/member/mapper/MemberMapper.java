package com.wear.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wear.member.vo.MemberVo;

public interface MemberMapper {
	
	//회원가입
	int insertMember(MemberVo Member);
	//로그인

	MemberVo selectMember(@Param("id") String id, @Param("pw") String pw);
	MemberVo selectMember2(String userId);
	//중복체크
	int CheckId(String userId);
	
		//찾기
	MemberVo findId(@Param("userName") String userName, @Param("userPhone") String userPhone);
	MemberVo findPW(@Param("userId") String userId,@Param("userName") String userName, @Param("userPhone") String userPhone);
	
	//개인정보관련
	List<MemberVo> MemberList();
	int updateMember(MemberVo member); //수정
	
}