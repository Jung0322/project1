package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.MemberDTO;
import com.company.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@Override
	@Transactional
	public boolean insertMember(MemberDTO insertDto) {
		// 회원정보 등록 전 비밀번호 암호화
		insertDto.setPassword(passwordEncoder.encode(insertDto.getPassword()));
		
		// 회원가입
		boolean result = memberMapper.insertMember(insertDto) == 1;
		// 회원 권한(ROLE) 삽입
		memberMapper.insertMemberAuth(insertDto.getUserid(), "ROLE_USER");
		
		return result;
	}

	@Override
	public MemberDTO readMember(String userid) {
		return memberMapper.readMember(userid);
	}

	// 중복 아이디 검사
	public MemberDTO checkUserid(String userid) {
		return memberMapper.checkByUserid(userid);
	}

	@Override
	// 중복 닉네임 검사
	public MemberDTO checkNickname(String nickname) {
		return memberMapper.checkByNickname(nickname);
	}

	@Override
	// 회원정보 불러오기
	public MemberDTO readMemberInfo(String userid) { 
		return memberMapper.readMemberInfo(userid);
	}

	@Override
	// 닉네임 수정
	public boolean modifyNickname(MemberDTO modifyDto) {
		return memberMapper.modifyNickname(modifyDto) > 0 ? true : false;
	}
}
