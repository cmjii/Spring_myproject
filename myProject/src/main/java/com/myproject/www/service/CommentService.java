package com.myproject.www.service;

import com.myproject.www.domain.CommentVO;
import com.myproject.www.domain.PagingVO;
import com.myproject.www.handler.PagingHandler;

public interface CommentService {

	int post(CommentVO cvo);
	
	PagingHandler getList(long bno, PagingVO pgvo);

	int modify(CommentVO cvo);

	int remove(long cno);

}