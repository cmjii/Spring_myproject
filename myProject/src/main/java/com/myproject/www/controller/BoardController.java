package com.myproject.www.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myproject.www.domain.BoardDTO;
import com.myproject.www.domain.BoardVO;
import com.myproject.www.domain.FileVO;
import com.myproject.www.domain.PagingVO;
import com.myproject.www.handler.FileHandler;
import com.myproject.www.handler.PagingHandler;
import com.myproject.www.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
	private final BoardService bsv;
	private final FileHandler fh;
	
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String insert(BoardVO bvo, @RequestParam(name="file", required = false)MultipartFile[] files) {
		log.info("bvo ============> "+bvo);
		List<FileVO> flist = null;
		if(files[0].getSize()>0) {
			flist = fh.uploadFiles(files);
		}
		int isok = bsv.insert(new BoardDTO(bvo, flist));
		return "index";
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model m, @RequestParam("bno") long bno) {
		m.addAttribute("bdto", bsv.detail(bno));
		
	}
	
	@GetMapping("/list")
	public void list(Model m,PagingVO pgvo) {
		//리스트
		List<BoardVO> list = bsv.list(pgvo);
		//페이지네이션
		int totalCount = bsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("list",list);
		m.addAttribute("ph", ph);
}
	
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, Model m, @RequestParam(name="file", required = false)MultipartFile[] files) {
		log.info("bvo :" +bvo);
		List<FileVO> flist = null;
		
		if(files[0].getSize()>0) {
			flist = fh.uploadFiles(files);
		}
		BoardDTO bdto = new BoardDTO(bvo, flist);
		int isok = bsv.modify(bdto);
		return "redirect:/board/detail?bno="+bvo.getBno();
	}

	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes re) {
		int isok = bsv.delete(bno);
		re.addFlashAttribute("delete", "1");
		return "redirect:/board/list";
	}
	
	@DeleteMapping(value="/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid){
		int isOk = bsv.deleteFile(uuid);
		log.info("delete File >>> is "+(isOk>0 ? "OK":"Fail"));
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : 
			new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
