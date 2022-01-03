package com.company.handler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.log4j.Log4j2;

// 로그인 실패시 실행
@Log4j2
public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		log.info("회원 로그인 실패");
		
		if (exception instanceof AuthenticationServiceException) { // 존재하지 않는 사용자
			request.setAttribute("loginFailMsg", "<b>존재하지 않는 아이디</b>입니다.");
		
		} else if(exception instanceof BadCredentialsException) { // 아이디, 비밀번호 불일치
			request.setAttribute("loginFailMsg", "<b>아이디</b>와 <b>비밀번호</b>를 확인하시기 바랍니다");
			
		}
		
		// 로그인 페이지로 다시 포워딩
		/* signIn가 GetMapping 상태로 forward -> 405 에러 발생 -> ReuqestMapping으로 변경, POST/GET 중에 선택하지 않음 -> 에러 해결
		 * 
		 * 참조 URL : https://zgundam.tistory.com/guestbook 
		 *  */
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/signIn");
		dispatcher.forward(request, response);
	}

}
