package com.myproject.www.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Getter
@Setter
@Component
@Slf4j
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String AuthEmail;

	private String errorMessage;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		setAuthEmail(request.getParameter("email"));

		// exception 발생 시 메시지 저장
		if (exception instanceof BadCredentialsException || // 로그인이 잘못됐을 때
				exception instanceof InternalAuthenticationServiceException) { // 인증에러
			setErrorMessage(exception.getMessage().toString());
		}
		log.info(">>> deeoe msg : >>>> " + errorMessage);
		
		request.setAttribute("email", getAuthEmail());;
		request.setAttribute("errMsg", getErrorMessage());
		request.getRequestDispatcher("/member/login?error").forward(request, response);
	}


}
