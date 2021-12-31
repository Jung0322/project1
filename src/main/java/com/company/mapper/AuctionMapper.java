package com.company.mapper;

import java.util.List;

import com.company.domain.AuctionDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface AuctionMapper {
	public int insert(AuctionDTO dto);
	public List<AuctionDTO> listAll(ProductCriteria cri);
	public int totalCnt(ProductCriteria cri);
	
}
