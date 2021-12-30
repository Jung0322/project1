package com.company.service;

import com.company.domain.MemberDTO;

public interface MemberService {
//	public boolean login(MemberDTO loginDto);
	
	// 회원가입
	public boolean insertMember(MemberDTO insertDto);
}
