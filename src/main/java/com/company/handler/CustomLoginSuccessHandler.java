package com.company.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.company.domain.MemberDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> {
			roleNames.add(auth.getAuthority());
		});
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		userDetails.getUsername();
		System.out.println(roleNames);
		
		if(roleNames.contains("ROLE_USER")) {
			log.info("회원 로그인 성공");
			
			response.sendRedirect("/product/index");
			return;
		}
//		response.sendRedirect("/member/signIn");
	}

}
