package com.company.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.company.domain.MemberDTO;
import com.company.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	ChatSession cSession;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> {
			roleNames.add(auth.getAuthority());
		});
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		
		System.out.println("로그인한 아이디 아이디아이디 :::: "+userDetails.getUsername());
		cSession.addLoginUser(userDetails.getUsername());
		
		if(roleNames.contains("ROLE_USER")) {
			log.info("회원 로그인 성공");
			
			response.sendRedirect("/product/Secindex");
			return;
		}
//		response.sendRedirect("/member/signIn");
	}

}
