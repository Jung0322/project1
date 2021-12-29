package com.company.cotroller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class UploadController {
	public ResponseEntity<AttachFileDTO> uploadAjaxPost(MultipartFile[] uploadFile) {
		
//		//서버 폴더에 첨부 파일 저장
//		String uploadFolder = "e:\\ccoli\\myPlace";
//		String uploadImgName = "";
//		
//		//첨부파일 목록 리스트 생성
//		List<AttachFileDTO> attachList = new ArrayList<AttachFileDTO>();
//		
//		//upload 폴더 결정
////		String uploadFolderPath = getFolder();
//		
//		//폴더 만들기
//		File uploadPath = new File(uploadFolder, uploadFolderPath);
//		
//		//폴더가 존재하지 않으면
//		if (!uploadPath.exists())
			
			return null;
	}

}
