package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.AuctionDTO;
import com.company.domain.ProductCriteria;
import com.company.mapper.AuctionAttachMapper;
import com.company.mapper.AuctionMapper;

@Service
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionMapper mapper;
	
	@Autowired
	private AuctionAttachMapper AttachMapper;

	@Transactional
	@Override
	public boolean insert(AuctionDTO dto) {
		
		//상품 등록
		boolean result = mapper.insert(dto)>0?true:false;
				
				//첨부파일 등록
				if(dto.getAttachList() == null || dto.getAttachList().size()<=0) {
					return false;
				}
				dto.getAttachList().forEach(attach->{
					attach.setAno(dto.getAno());
					AttachMapper.insert(attach);
				});
		
		return true;
	}

	@Override
	public List<AuctionDTO> getList(ProductCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.listAll(cri);
	}

	@Override
	public int getTotalCount(ProductCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalCnt(cri);
	}

}
