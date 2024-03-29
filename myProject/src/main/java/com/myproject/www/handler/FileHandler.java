package com.myproject.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.www.domain.FileVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Component
@Slf4j
public class FileHandler {

	private final String URL = "D:\\_myProject\\_java\\_fileUpload";
	
	//파일 메서드 생성
	public List<FileVO> uploadFiles(MultipartFile[] files){
		List<FileVO> flist = new ArrayList<FileVO>();
		
		//파일을 저장날짜를 알기 위해서 선언
		LocalDate date = LocalDate.now();
		String today = date.toString();
		today = today.replace("-", File.separator); //2023-01-05 => 2024/01/05
		
		
		//파일 폴더 생성
		File folder = new File(URL, today);
		
		//폴더 확인 후 생성
		if(!folder.exists()) {
			folder.mkdirs(); //여러개의 폴더 생성
		}
		
		//파일 객체에 대한 설정
		for(MultipartFile file : files) {
			FileVO fvo = new FileVO();
			fvo.setSaveDir(today);
			fvo.setFileSize(file.getSize());
			//파일 이름 추출
			String originalFname = file.getOriginalFilename();
			String FileName = originalFname.substring(originalFname.lastIndexOf(File.separator)+1);
			
			log.info("File Name ==========> "+FileName);
			fvo.setFileName(FileName);
			
			//uuid클래스는 자바에서 제공됨
			UUID uuid = UUID.randomUUID();
			String uuidstr = uuid.toString();
			fvo.setUuid(uuidstr);
			
			
			//디스크에 저장할 파일 객체 생성
			String AllFileName = uuidstr+"_"+FileName;
			//실제 파일이 저장되기 위해서 필요함
			File diskFolder = new File(folder, AllFileName);
			
			try {
				//사용자가 업로드 한 파일을 실제 저장(복사)하는 함수
				file.transferTo(diskFolder);
				
				//이미지 확인
				if(isImageFile(diskFolder)) {
					fvo.setFileType(1);
					//썸네일 생성 (얘도 디스크에 저장됨)
					File thumFile = new File(folder, uuidstr+"_th_"+FileName);
					Thumbnails.of(diskFolder).size(80, 80).toFile(thumFile);
				}
			} catch (Exception e) {
				e.printStackTrace();
				log.info("파일 생성 오류");
			}
			flist.add(fvo);
		}
		
		return flist;
	}
	
	//이미지 체크 메서드
	private boolean isImageFile(File diskFolder) throws IOException {
		String mimeType = new Tika().detect(diskFolder);
		return mimeType.startsWith("image")? true:false;
	}
	
	
}
