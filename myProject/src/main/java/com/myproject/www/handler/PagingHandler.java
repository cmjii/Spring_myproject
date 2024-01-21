package com.myproject.www.handler;

import java.util.List;

import com.myproject.www.domain.CommentVO;
import com.myproject.www.domain.PagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class PagingHandler {
	
	private int startPage; //시작번호
	private int endPage; //끝 번호
	private boolean prev,next; 
	
	private int totalCount; //총 게시글 수
	private PagingVO pgvo;
	
	private List<CommentVO> cmtList;

	
	//생성자에서 모든 값들이 설정되야 함.
		public PagingHandler(PagingVO pgvo, int totalCount) {
			this.pgvo = pgvo;
			this.totalCount = totalCount;
			
			// 1 ~ 10 / 11 ~ 20 / 21 ~ 30 ...
			// 1부터 10까지 endPage는 변함없이 10이어야 함.
			// 1 2 3 4 ... 10 /10 나머지를 올려(ceil) 1로 만듬 *10
			this.endPage = (int)Math.ceil(pgvo.getPageNo() 
					/ (double)pgvo.getQty())*pgvo.getQty();
			
			this.startPage = endPage - 9;
			
			
			//실제 마지막 페이지 
			// 전체 글 수 / 한페이지에 표시되는 게시글 수 => 올림
			int realEndPage = (int)Math.ceil(totalCount / (double)pgvo.getQty());
			
			if(realEndPage < endPage) {
				this.endPage = realEndPage;
			}
			
			this.prev = this.startPage > 1;
			this.next = this.endPage < realEndPage;
			
		}
		
		public PagingHandler(PagingVO pgvo, int totalCount, List<CommentVO>cmtList) {
			this(pgvo, totalCount);
			this.cmtList = cmtList;
		}
		
}