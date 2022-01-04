package com.company.service;

import java.util.List;

import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface ProductService {
	public boolean insert(ProductDTO dto);
	public List<ProductDTO> getList(ProductCriteria cri);
	public int getTotalCount(ProductCriteria cri);
}
