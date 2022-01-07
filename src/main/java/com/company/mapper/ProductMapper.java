package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.AttachProductDTO;
import com.company.domain.MemberDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface ProductMapper {
	public int insert(ProductDTO dto);
	public List<ProductDTO> listAll(ProductCriteria cri);
	public int totalCnt(ProductCriteria cri);
	public ProductDTO getRow(int pno);
	public MemberDTO town(String userid);
	public int goodcount(@Param("num") int num , @Param("pno")int pno);
	public int SectotalCnt(@Param("cate") String cate , @Param("userid") String userid);
	public List<ProductDTO> SeclistAll(@Param("cri") ProductCriteria cri,@Param("userid") String userid);
}
