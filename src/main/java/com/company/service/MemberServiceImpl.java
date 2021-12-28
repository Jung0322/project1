package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.MemberDTO;
import com.company.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public boolean login(MemberDTO loginDto) {
		return memberMapper.login(loginDto) > 0 ? true : false;
	}

	@Override
	public boolean insertMember(MemberDTO insertDto) {
		return memberMapper.insertMember(insertDto) > 0 ? true : false;
	}

}
