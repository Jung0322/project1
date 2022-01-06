package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.BasketDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface BasketMapper {
	public BasketDTO select(BasketDTO dto);
	public int insert(BasketDTO dto);
	public int delete(BasketDTO dto);
	public List<ProductDTO> listAll(@Param("cri") ProductCriteria cri,@Param("userid") String userid);
	public int totalCnt(String userid);
}
