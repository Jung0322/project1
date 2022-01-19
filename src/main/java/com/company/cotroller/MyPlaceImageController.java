package com.company.cotroller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.MyPlaceAttachDTO;

@RestController
public class MyPlaceImageController {

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/uploadImage")
	public ResponseEntity<List<MyPlaceAttachDTO>> uploadImage(MultipartFile[] uploadFile) {

		System.out.println("image 업로드 " + Arrays.toString(uploadFile));

		// 서버 폴더에 첨부 파일 저장
//		String uploadFolder = "e:\\ccoli\\myPlace";
		String uploadFolder = "C:\\ccoli\\myPlace";
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

	// 폴더명 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	// 수정 중
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteImage")
	private ResponseEntity<String> deleteFiles(String fileName) {
		System.out.println("동네생활 파일 삭제 중 : fileName "+fileName);
		try {
			System.out.println(URLDecoder.decode(fileName, "UTF-8"));
			File file = new File("C:\\ccoli\\myPlace\\"+URLDecoder.decode(fileName, "UTF-8"));
//			File file = new File(URLDecoder.decode(fileName, "UTF-8"));
		
		
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

}
