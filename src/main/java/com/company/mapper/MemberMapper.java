package com.company.mapper;

import org.apache.ibatis.annotations.Param;

import com.company.domain.MemberDTO;

public interface MemberMapper {
	// 회원가입
	public int insertMember(MemberDTO insertDto);
	public int insertMemberAuth(@Param("userid") String userid, @Param("authority") String authority);
	
//	public int login(MemberDTO loginDto);
	// security 적용 후 로그인
	public MemberDTO readMember(String userid);
}
