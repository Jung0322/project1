package com.company.mapper;

import org.apache.ibatis.annotations.Param;

import com.company.domain.MemberDTO;

public interface MemberMapper {
	// 로그인
	// security 적용 후 로그인
	public MemberDTO readMember(String userid);
	
	
	// 회원가입
	// 회원가입
	public int insertMember(MemberDTO insertDto);
	// 회원가입 시 권한 삽입
	public int insertMemberAuth(@Param("userid") String userid, @Param("authority") String authority);
	// 중복 아이디 검사
	public MemberDTO checkByUserid(String userid);
	// 중복 닉네임 검사
	public MemberDTO checkByNickname(String nickname);
	
	
	// 회원정보 수정
	// 회원정보 불러오기
	public MemberDTO readMemberInfo(String userid);
	// 닉네임 수정
	public int modifyNickname(MemberDTO modifyDto);
}
