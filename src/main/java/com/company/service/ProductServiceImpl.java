package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;
import com.company.mapper.ProductAttachMapper;
import com.company.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private ProductAttachMapper AttachMapper;
	
	@Transactional
	@Override
	public boolean insert(ProductDTO dto) {
	
		//상품 등록
		boolean result = mapper.insert(dto)>0?true:false;
		
		//첨부파일 등록
		if(dto.getAttachList() == null || dto.getAttachList().size()<=0) {
			return false;
		}
		dto.getAttachList().forEach(attach->{
			attach.setPno(dto.getPno());
			AttachMapper.insert(attach);
		});
		
		return true;
	}

	@Override
	public List<ProductDTO> getList(ProductCriteria cri) {
		
		return mapper.listAll(cri);
	}

	@Override
	public int getTotalCount(ProductCriteria cri) {
		return mapper.totalCnt(cri);
	}

}
