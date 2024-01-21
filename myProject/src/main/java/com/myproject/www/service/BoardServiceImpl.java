package com.myproject.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.www.domain.BoardDTO;
import com.myproject.www.domain.BoardVO;
import com.myproject.www.domain.FileVO;
import com.myproject.www.domain.PagingVO;
import com.myproject.www.repository.BoardDAO;
import com.myproject.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardDAO bdao;
	private final FileDAO fdao;
	@Override
	public int insert(BoardDTO boardDTO) {
		//파일이 있는 객체와 없는 객체 나누기
		int isok = bdao.insert(boardDTO.getBvo());
		
		if(boardDTO.getFlist()==null) {
			return isok;
		}
		
		if(isok>0&&boardDTO.getFlist().size()>0) {
			long bno = bdao.selectbno();
			for(FileVO fvo : boardDTO.getFlist()) {
				fvo.setBno(bno);
				isok *= fdao.insert(fvo);
			}
		}
		
		
		return isok;
	}
	
	@Override
	public List<BoardVO> list(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.list(pgvo);
	}
	
	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return bdao.delete(bno);
	}
	
	@Transactional
	@Override
	public BoardDTO detail(long bno) {
		
		BoardVO bvo = bdao.detail(bno);
		List<FileVO> flist = fdao.getFlist(bno);
		BoardDTO bdto = new BoardDTO(bvo,flist);
		int isok = bdao.readcount(bno);
		return bdto;
	}
	
	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public int modify(BoardDTO bdto) {
		int isok = bdao.modify(bdto.getBvo());

		if (bdto.getFlist() == null) {
			return isok;
		}
		if (bdto.getFlist().size() > 0 && isok > 0) {
			long bno = (bdto.getBvo().getBno());
			for (FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isok *= fdao.insert(fvo);
			}
		}

		return isok;
	}

	@Override
	public int deleteFile(String uuid) {
		// TODO Auto-generated method stub
		return fdao.removeFile(uuid);
	}

}