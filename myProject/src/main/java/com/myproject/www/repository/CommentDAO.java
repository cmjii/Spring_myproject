package com.myproject.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myproject.www.domain.CommentVO;
import com.myproject.www.domain.PagingVO;

public interface CommentDAO {

	int insert(CommentVO cvo);
	
	List<CommentVO> getList(@Param("bno")long bno, @Param("pgvo")PagingVO pgvo);

	int selectOneBnoTotalCount(long bno);

	int modify(CommentVO cvo);

	int delete(long cno);

}
