package com.myproject.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myproject.www.domain.CommentVO;
import com.myproject.www.domain.PagingVO;
import com.myproject.www.handler.PagingHandler;
import com.myproject.www.repository.BoardDAO;
import com.myproject.www.repository.CommentDAO;
import com.myproject.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {
	
	private final CommentDAO cdao;

	@Override
	public int post(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.insert(cvo);
	}
	
	@Override
	public PagingHandler getList(long bno, PagingVO pgvo) {
		// TODOuto-generated method stub
		//commentList로 setting
		int totlaCount = cdao.selectOneBnoTotalCount(bno);
		List<CommentVO>list = cdao.getList(bno, pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totlaCount,list);
		return ph;
	}

	@Override
	public int modify(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.modify(cvo);
	}

	@Override
	public int remove(long cno) {
		// TODO Auto-generated method stub
		return cdao.delete(cno);
	}
	
}
