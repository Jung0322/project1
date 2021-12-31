package com.company.mapper;

import java.util.List;

import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface ProductMapper {
	public int insert(ProductDTO dto);
	public List<ProductDTO> listAll(ProductCriteria cri);
	public int totalCnt(ProductCriteria cri);
}
