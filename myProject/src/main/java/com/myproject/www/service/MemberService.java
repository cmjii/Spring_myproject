package com.myproject.www.service;

import java.util.List;

import com.myproject.www.security.MemberVO;

public interface MemberService {

	boolean updateLastLogin(String authEmail);

	int insert(MemberVO mvo);

	List<MemberVO> list();

	MemberVO detail(String email);

	int update(MemberVO mvo);

	int passupdate(MemberVO mvo);

	int delete(String email);

	MemberVO selectEmail(String email);

}
