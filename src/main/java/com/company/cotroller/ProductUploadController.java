package com.company.cotroller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.AttachProductDTO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import oracle.net.aso.f;

@Log4j2
@Controller
public class ProductUploadController {

	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/uploadAjax")
	public ResponseEntity<List<AttachProductDTO>> uploadAjaxPost(MultipartFile[] uploadFile){
		
		log.info("업로드 요청"+Arrays.toString(uploadFile));
		
		
		//서버 폴더에 첨부 파일 저장
		String uploadFoler= "e:\\ccoli\\product";
		
		String uploadFileName = "";
		
		//첨부파일 목록 리스트 생성
		List<AttachProductDTO> attachList = new ArrayList<AttachProductDTO>();
		
		//upload 폴더 결정
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFoler,uploadFolderPath);
		
		//디렉토리 생성
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("ajax upload" + multipartFile.getOriginalFilename());
			
			//uuid 값 파일에 추가하기
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+multipartFile.getOriginalFilename();
			
			File saveFile = new File(uploadPath, uploadFileName);
			AttachProductDTO attachFileDTO = new AttachProductDTO();
			attachFileDTO.setPuuid(uuid.toString());
			attachFileDTO.setPuploadPath(uploadFolderPath);
			attachFileDTO.setPimgname(multipartFile.getOriginalFilename());
			
			
			
		
			
			//썸네일 저장
			try {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				InputStream in = multipartFile.getInputStream();
				Thumbnailator.createThumbnail(in, thumbnail,100,100);
				in.close();
				thumbnail.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
				
				
			
			
			attachList.add(attachFileDTO);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		return new ResponseEntity<List<AttachProductDTO>>(attachList,HttpStatus.OK);
	}
	
	
	//썸네일 이미지 가져오기
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("이미지 요청   "+fileName);
		
		File file = new File("e:\\ccoli\\product",fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//서버 폴더의 파일 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("파일삭제 : "+"fileName "+fileName);
		
		
		try {
			//일반 파일인 경우 - 원본 파일만 삭제
			File file = new File("e:\\ccoli\\product"+URLDecoder.decode(fileName,"utf-8"));
			file.delete();
			
			//이미지 파일인 경우 - 원본 이미지와 썸네일 이미지를 삭제
			// 원본 이미지 삭제
			String largeName = file.getAbsolutePath().replace("s_", "");
			new File(largeName).delete();
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	

	
	
	//폴더명 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();// Wed Dec 14:54:10 KST 2021
		String str =  sdf.format(date); //	"2021-12-08"
		
		//	windows : \, unix : /
		return str.replace("-",File.separator);	// 2021/12/08
	}
}
