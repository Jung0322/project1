package 	com.company.cotroller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.AttachProductDTO;
import com.company.domain.BasketDTO;
import com.company.domain.MemberDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;
import com.company.domain.ProductPageDTO;
import com.company.service.ProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	

	
	@RequestMapping(value = "/product/index", method = RequestMethod.GET)
		public void index(Model model, ProductCriteria cri) {
		log.info("index");
		

		System.out.println("가나다라"+cri);
		
		List<ProductDTO> list = service.getList(cri);
		
		
		
		for(ProductDTO dto:list) {
			for(AttachProductDTO attach:dto.getAttachList()) {
				
				attach.setPuploadPath(attach.getPuploadPath().replace("\\", "\\\\"));
			}
		}
		//페이지 나누기를 위한 정보 얻기
		int totalCnt =  service.getTotalCount(cri);
		
	System.out.println("아예이오후"+list);
		System.out.println("totalCnt "+totalCnt);
		
		ProductPageDTO pageDto = new ProductPageDTO(cri, totalCnt);
		System.out.println("pageDto "+pageDto);
		model.addAttribute("pageDto", pageDto);
		
		
		model.addAttribute("list", list);
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/product/Secindex", method = RequestMethod.GET)
	public String Secindex(Model model, ProductCriteria cri,Principal principal) {
	log.info("로그인 한 회원 전체 보여주기");
	

	System.out.println("가나다라"+cri);
	
	String userid= principal.getName();
	
	List<ProductDTO> list = service.SecgetList(cri,userid);
	
	
	
	for(ProductDTO dto:list) {
		for(AttachProductDTO attach:dto.getAttachList()) {
			
			attach.setPuploadPath(attach.getPuploadPath().replace("\\", "\\\\"));
		}
	}
	
	//페이지 나누기를 위한 정보 얻기
	int totalCnt =  service.SecgetTotalCount(cri.getCate(), userid);

	
	System.out.println("아예이오후"+list);
	System.out.println("totalCnt "+totalCnt);
	
	ProductPageDTO pageDto = new ProductPageDTO(cri, totalCnt);
	System.out.println("pageDto "+pageDto);
	model.addAttribute("pageDto", pageDto);
	
	
	model.addAttribute("list", list);
	
	return"/product/index";
	
}
	
	@RequestMapping(value = "/single-product", method = RequestMethod.GET)
	public String single_project(int pno, @ModelAttribute("cri") ProductCriteria cri, Model model) {
		log.info("single-project");
		
		ProductDTO row = service.getRow(pno);
		
		model.addAttribute("row",row);
  	
		
		return "/product/single-project";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/product-registration", method = RequestMethod.GET)
	public String product_registration(Principal principal, Model model) {
		log.info("product-registration");
		
		String userid =  principal.getName();
		
		MemberDTO dto = service.town(userid);
		
		model.addAttribute("dto",dto);
		
		return "/product/product-registration";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/product/product-registration", method = RequestMethod.POST)
	public String product_registration(ProductDTO dto){
		log.info("register 요청" +dto);
		service.insert(dto);
		
		return "redirect:/product/Secindex";
	}
	
	@GetMapping("/getAttachList")
	public ResponseEntity<List<AttachProductDTO>> getAttachList(int pno){
		System.out.println("pno 번호 확인"+ pno);
		System.out.println("값 확인: "+service.getRowImg(pno));
		return new ResponseEntity<List<AttachProductDTO>>(service.getRowImg(pno),HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/product/sellproduct", method = RequestMethod.GET)
	public String sellProduct(Model model, ProductCriteria cri,Principal principal) {
	log.info("로그인 한 회원 전체 보여주기");
	

	System.out.println("가나다라"+cri);
	
	String userid= principal.getName();
	
	List<ProductDTO> list = service.SecgetList(cri,userid);
	
	
	
	for(ProductDTO dto:list) {
		for(AttachProductDTO attach:dto.getAttachList()) {
			
			attach.setPuploadPath(attach.getPuploadPath().replace("\\", "\\\\"));
		}
	}
	
	//페이지 나누기를 위한 정보 얻기
	int totalCnt =  service.SecgetTotalCount(cri.getCate(), userid);

	
	System.out.println("아예이오후"+list);
	System.out.println("totalCnt "+totalCnt);
	
	ProductPageDTO pageDto = new ProductPageDTO(cri, totalCnt);
	System.out.println("pageDto "+pageDto);
	model.addAttribute("pageDto", pageDto);
	
	
	model.addAttribute("list", list);
	
	return"/product/mysell-product";
	
}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(int pno, @ModelAttribute("cri") ProductCriteria cri, Model model) {
		log.info("single-project");
		
		ProductDTO row = service.getRow(pno);
		
		model.addAttribute("row",row);
  	
		
		return "/product/productModify";
	}
	
	@PostMapping("/product/delete")
	public String delete(int pno,ProductCriteria cri, RedirectAttributes rttr) {
		//첨부파일 목록 얻어오기
	 	List<AttachProductDTO> attachList = service.getRowImg(pno);
	 	
	 	//삭제
	 	if(service.delete(pno)) {
	 		//첨부 파일 삭제
	 		deleteFiles(attachList);
	 		
	 		//주소줄에 따라가지않음
	 		rttr.addFlashAttribute("result","success");
	 		//rttr은 객체를 보낼수 없음
	 		//페이지 나누기 값 보내기(주소줄에 보임)
	 		rttr.addAttribute("pageNum", cri.getPageNum());
	 		rttr.addAttribute("amount", cri.getAmount());
	 		
	 			
	 	}
	 	
		return "redirect:/product/sellproduct";
	}
	
	public void deleteFiles(List<AttachProductDTO> attachListDto) {
	      if(attachListDto == null || attachListDto.size()==0) {
	         return;
	      }
	      log.info("파일 삭제중....");
	      
	      attachListDto.forEach(attach -> {
	         Path file = Paths.get("e:\\ccoli\\product"+attach.getPuploadPath()+"\\"+attach.getPuuid()+"_"+attach.getPimgname());
	      
	         try {
	        	//일반파일, 이미지 원본 파일만 삭제
	            Files.deleteIfExists(file);
	            
	            if(Files.probeContentType(file).startsWith("image")) {
	               Path thumbnail = Paths.get("e:\\ccoli\\product"+attach.getPuploadPath()+"\\s_"+attach.getPuuid()+"_"+attach.getPimgname());
	               
	               //이미지 썸네일 삭제
	               Files.delete(thumbnail);
	            }
       
	         
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      });
	   }
	
	@PostMapping("/product/modify")
	public String modify(ProductDTO productDTO, ProductCriteria cri, RedirectAttributes rttr) {
		log.info("수정 요청" +productDTO+" "+cri);
		
		service.update(productDTO);
		
		//페이지 나누기 값 보내기(주소줄에 보임)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		rttr.addFlashAttribute("result","success");
		return "redirect:/product/Secindex";
	}
	
	//예약중 수정
	@RequestMapping(value = "/resupdate", method = RequestMethod.GET)
	public String resupdate(int pno,int num ,@ModelAttribute("cri") ProductCriteria cri, RedirectAttributes rttr) {
		log.info("resupdate");
		
		service.resupdate(pno,num);
		
		//페이지 나누기 값 보내기(주소줄에 보임)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("cate", cri.getCate());
				
		rttr.addFlashAttribute("result","success");
		
		return "redirect:/product/sellproduct";
	}
}
