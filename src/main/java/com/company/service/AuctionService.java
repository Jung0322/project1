package com.company.service;

import java.util.List;

import com.company.domain.AuctionDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface AuctionService {
	public boolean insert(AuctionDTO dto);
	public List<AuctionDTO> getList(ProductCriteria cri);
	public int getTotalCount(ProductCriteria cri);
}
