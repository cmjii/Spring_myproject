package com.myproject.www.repository;

import java.util.List;

import com.myproject.www.domain.FileVO;

public interface FileDAO {

	int insert(FileVO fvo);

	List<FileVO> getFlist(long bno);

	List<FileVO> selectListAllFile();

	int removeFile(String uuid);


}
