package com.myproject.www.repository;

import java.util.List;

import com.myproject.www.security.AuthVO;
import com.myproject.www.security.MemberVO;

public interface MemberDAO {

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	int updateLastLogin(String authEmail);

	int insert(MemberVO mvo);

	int Authinsert(MemberVO mvo);


	List<MemberVO> list();

	int update(MemberVO mvo);

	int passupdate(MemberVO mvo);

	int delete(String email);

	int authdelete(String email);



}
