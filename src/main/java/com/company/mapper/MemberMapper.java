package com.company.mapper;

import org.apache.ibatis.annotations.Param;

import com.company.domain.MemberDTO;

public interface MemberMapper {
	// 로그인
	// security 적용 후 로그인
	public MemberDTO readMember(String userid);
	
	
	// 회원가입
	// 회원가입 처리
	public int insertMember(MemberDTO insertDto);
	// 회원가입 시 권한 삽입
	public int insertMemberAuth(@Param("userid") String userid, @Param("authority") String authority);
	// 중복 아이디 검사
	public MemberDTO checkByUserid(String userid);
	// 중복 닉네임 검사(전체)
	public MemberDTO checkByNickname(String nickname);
	// 중복 이메일 검사(전체)
	public MemberDTO checkByEmail(String email);
	
	
	// 회원정보 수정
	// 회원정보 불러오기
	public MemberDTO readMemberInfo(String userid);
	// 동일 닉네임 여부
	public String checkSameNickname(String userid);
	// 닉네임 수정
	public int modifyNickname(MemberDTO modifyDto);
	// 기존 비밀번호 일치 확인
	public String checkOrgPwd(String userid);
	// 비밀번호 수정
	public int modifyPwd(@Param("new_password") String new_password, @Param("userid") String userid);
	// 동일 이메일 여부
	public String checkSameEmail(String userid);
	// 이메일 수정
	public int modifyEmail(MemberDTO modifyDto);
	// 휴대전화 수정
	public int modifyPhone(MemberDTO modifyDto);
	
	
	// 회원탈퇴
	// 회원정보 삭제
	public int deleteMember(String userid);
	// 권한정보 삭제
	public int deleteMemberROLE(String userid);
}