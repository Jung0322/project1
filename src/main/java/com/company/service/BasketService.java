package com.company.service;

import java.util.List;

import com.company.domain.BasketDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface BasketService {
	public BasketDTO select(BasketDTO dto);
	public boolean insert(BasketDTO dto);
	public boolean delete(BasketDTO dto);
	public List<ProductDTO> getList(ProductCriteria cri,String userid);
	public int getTotalCount(String cate,String userid);
}
