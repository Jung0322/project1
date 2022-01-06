package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BasketDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;
import com.company.mapper.BasketMapper;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketMapper mapper;
	
	@Override
	public BasketDTO select(BasketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.select(dto);
	}

	@Override
	public boolean insert(BasketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.insert(dto)>0?true:false;
	}

	@Override
	public boolean delete(BasketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.delete(dto)>0?true:false;
	}

	@Override
	public List<ProductDTO> getList(ProductCriteria cri, String userid) {
		// TODO Auto-generated method stub
		return mapper.listAll(cri, userid);
	}

	@Override
	public int getTotalCount(String userid) {
		// TODO Auto-generated method stub
		return mapper.totalCnt(userid);
	}

}
