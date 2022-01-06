package 	com.company.cotroller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.AttachProductDTO;
import com.company.domain.BasketDTO;
import com.company.domain.ChatSession;
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
		public void index(Principal principal,Model model, ProductCriteria cri) {
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
	
	@RequestMapping(value = "/single-product", method = RequestMethod.GET)
	public String single_project(int pno, @ModelAttribute("cri") ProductCriteria cri, Model model) {
		log.info("single-project");
		
		ProductDTO row = service.getRow(pno);
		
		model.addAttribute("row",row);
  	
		
		return "/product/single-project";
	}
	
	@RequestMapping(value = "/product-registration", method = RequestMethod.GET)
	public String product_registration(Principal principal, Model model) {
		log.info("product-registration");
		
		String userid =  principal.getName();
		
		MemberDTO dto = service.town(userid);
		
		model.addAttribute("dto",dto);
		
		return "/product/product-registration";
	}
	
	@RequestMapping(value = "/product/product-registration", method = RequestMethod.POST)
	public String product_registration(ProductDTO dto){
		log.info("register 요청" +dto);
		service.insert(dto);
		
		return "/product/index";
	}
	
	@GetMapping("/getAttachList")
	public ResponseEntity<List<AttachProductDTO>> getAttachList(int pno){
		System.out.println("pno 번호 확인"+ pno);
		System.out.println("값 확인: "+service.getRowImg(pno));
		return new ResponseEntity<List<AttachProductDTO>>(service.getRowImg(pno),HttpStatus.OK);
	}
	
	@PostMapping("/updategood")
	public ResponseEntity<String> updategood(int num, int pno){
		
		return  service.goodCount(num,pno)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
}
