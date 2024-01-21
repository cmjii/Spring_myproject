package com.myproject.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.www.repository.MemberDAO;
import com.myproject.www.security.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO mdao;
	
	@Override
	public boolean updateLastLogin(String authEmail) {
		// TODO Auto-generated method stub
		return mdao.updateLastLogin(authEmail) >0? true:false;
	}

	@Override
	@Transactional
	public int insert(MemberVO mvo) {

		int isok = mdao.insert(mvo);
		return mdao.Authinsert(mvo);
		
	}


	@Override
	@Transactional
	public List<MemberVO> list() {
		
		List<MemberVO> list = mdao.list();
		for(MemberVO mvo : list) {
			mvo.setAuthList(mdao.selectAuths(mvo.getEmail()));
		}
		return list;
	}

	@Override
	@Transactional
	public MemberVO detail(String email) {
		// TODO Auto-generated method stub
		MemberVO mvo = mdao.selectEmail(email);
		mvo.setAuthList(mdao.selectAuths(email));
		return mvo;
	}

	@Override
	public int update(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.update(mvo);
	}

	@Override
	public int passupdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.passupdate(mvo);
	}

	@Override
	public int delete(String email) {
		mdao.authdelete(email);
		return mdao.delete(email);
	}

	@Override
	public MemberVO selectEmail(String email) {
		MemberVO mvo = mdao.selectEmail(email);
		return mvo;
	}



}
