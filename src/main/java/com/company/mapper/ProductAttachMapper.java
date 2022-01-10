package com.company.mapper;

import java.util.List;

import com.company.domain.AttachProductDTO;

public interface ProductAttachMapper {
	public int insert(AttachProductDTO dto);
	public List<AttachProductDTO> getRowImg(int pno);
	
	public int deleteAll(int pno);
}
