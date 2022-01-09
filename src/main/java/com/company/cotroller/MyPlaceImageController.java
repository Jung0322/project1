package com.company.cotroller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.MyPlaceAttachDTO;


@Controller
public class MyPlaceImageController {

	@PostMapping("/uploadImage")
	public ResponseEntity<List<MyPlaceAttachDTO>> uploadImage(MultipartFile[] uploadFile) {
			
		
		System.out.println("image 업로드 "+Arrays.toString(uploadFile));

		// 서버 폴더에 첨부 파일 저장
		String uploadFolder = "e:\\ccoli\\myPlace";
		String uploadFileName = "";

		// 첨부파일 목록 리스트 생성
		List<MyPlaceAttachDTO> attachList = new ArrayList<MyPlaceAttachDTO>();

		// upload 폴더 결정
		String uploadFolderPath = getFolder();

		// 폴더 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		// 폴더가 존재하지 않으면
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		for (MultipartFile f : uploadFile) {
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();

			File saveFile = new File(uploadPath, uploadFileName);

			MyPlaceAttachDTO mAttachDto = new MyPlaceAttachDTO();
			mAttachDto.setMuuid(uuid.toString());
			mAttachDto.setMuploadPath(uploadFolderPath);
			mAttachDto.setMimgName(f.getOriginalFilename());

			// 이미지 파일 여부 확인
			if (checkImageType(saveFile)) {
				mAttachDto.setMfileType(true);

				attachList.add(mAttachDto);

				try {
					f.transferTo(saveFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}

		}
		return new ResponseEntity<List<MyPlaceAttachDTO>>(attachList, HttpStatus.OK);
	}

	// 서버 폴더에 파일을 삭제
	public ResponseEntity<String> deleteFile(String mimgName) {
		try {
			File file = new File("e:\\ccoli\\myPlace\\" + URLDecoder.decode(mimgName, "utf-8"));
			file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	// 이미지 파일 여부 확인
	private boolean checkImageType(File file) {
		String contentType;

		try {
			contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;

	}
	
	//폴더명 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}

}
