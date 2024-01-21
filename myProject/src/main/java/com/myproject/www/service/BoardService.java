package com.myproject.www.service;

import java.util.List;

import com.myproject.www.domain.BoardDTO;
import com.myproject.www.domain.BoardVO;
import com.myproject.www.domain.PagingVO;

public interface BoardService {

	int insert(BoardDTO boardDTO);

	List<BoardVO> list(PagingVO pgvo);

	int delete(int bno);

	BoardDTO detail(long bno);

	int getTotalCount(PagingVO pgvo);

	int modify(BoardDTO bdto);

	int deleteFile(String uuid);

}
