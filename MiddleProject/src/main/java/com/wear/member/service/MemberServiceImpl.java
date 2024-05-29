package com.wear.member.service;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.member.mapper.MemberMapper;
import com.wear.member.vo.MemberVo;

public class MemberServiceImpl implements MemberService{

	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	@Override
	public boolean MemberJoin(MemberVo Member) {
		return mapper.insertMember(Member) == 1;
	}
	@Override
	public MemberVo login(String userId, String userPW) {
		return mapper.selectMember(userId, userPW);
	}

	@Override
	public MemberVo checkMember(String userId) {
		return mapper.selectMember2(userId);
	}
	 public boolean checkId(String userId){
		 return mapper.CheckId(userId) > 0;
}
	@Override
	public MemberVo getMember(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public MemberVo searchId(String userName, String userPhone) {
		// TODO Auto-generated method stub
		return mapper.findId(userName, userPhone);
	}
	
	@Override
	public MemberVo searchPW(String userid, String userName, String userPhone) {
		// TODO Auto-generated method stub
		return mapper.findPW(userid, userName, userPhone);
	}
	@Override
	public boolean modifyMember(MemberVo userId) {
		// TODO Auto-generated method stub
		return mapper.updateMember(userId)==1;
	}
	
	@Override
	public MemberVo sList(String userId) {
		// TODO Auto-generated method stub
		return mapper.selectList(userId);
	}
	@Override
	public boolean deleteMember(MemberVo user) {
		// TODO Auto-generated method stub
		return mapper.deleteMember(user)==1;
	}
	
	
}
