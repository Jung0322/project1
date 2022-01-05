package com.company.service;

import com.company.domain.MemberDTO;

public interface MemberService {
	// 회원가입
	// 회원가입 처리
	public boolean insertMember(MemberDTO insertDto);
	// 중복 아이디 검사
	public MemberDTO checkUserid(String userid);
	// 중복 닉네임 검사
	public MemberDTO checkNickname(String nickname);
	
	// 회원정보 수정
	// 회원정보 불러오기
	public MemberDTO readMemberInfo(String userid);
	// 닉네임 수정
	public boolean modifyNickname(MemberDTO modifyDto);
}
