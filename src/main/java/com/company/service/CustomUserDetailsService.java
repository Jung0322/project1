package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.company.domain.CustomUser;
import com.company.domain.MemberDTO;
import com.company.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("--- 사용자 아이디 : "+username);

		MemberDTO member = memberMapper.readMember(username);
		
		return new CustomUser(member);
	}
}
