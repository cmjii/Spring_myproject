package com.myproject.www.repository;

import java.util.List;

import com.myproject.www.domain.BoardVO;
import com.myproject.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	long selectbno();

	List<BoardVO> list(PagingVO pgvo);

	int delete(long bno);

	BoardVO detail(long bno);

	int readcount(long bno);

	int getTotalCount(PagingVO pgvo);

	int modify(BoardVO bvo);

}
