package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.AttachProductDTO;
import com.company.domain.MemberDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface ProductMapper {
	//상품 입력
	public int insert(ProductDTO dto);
	
	//모든 상품 리스트 목록
	public List<ProductDTO> listAll(ProductCriteria cri);
	public int totalCnt(ProductCriteria cri);
	
	//해당 상품 상세정보 구하기
	public ProductDTO getRow(int pno);
	
	//해당 유저 동네 구하기
	public MemberDTO town(String userid);
	
	//해당 상품 좋아요 개수
	public int goodcount(@Param("num") int num , @Param("pno")int pno);
	
	//해당 유저 동네 판매 목록
	public int SectotalCnt(@Param("cate") String cate , @Param("userid") String userid);
	public List<ProductDTO> SeclistAll(@Param("cri") ProductCriteria cri,@Param("userid") String userid);
	
	//해당 유저 판매 목록
	public int SelltotalCnt(@Param("cate") String cate , @Param("userid") String userid,@Param("num") int num);
	public List<ProductDTO> SelllistAll(@Param("cri") ProductCriteria cri,@Param("userid") String userid,@Param("num") int num);
	
	//정보 삭제
	public int delete(int pno);
	
	// 정보수정
	public int update(ProductDTO dto);
	
	//예약 수정
	public int resupdate(@Param("pno") int pno, @Param("num") int num);
	
	//판매완료 수정
	public int solupdate(@Param("num") int num, @Param("pno") int pno);

}
