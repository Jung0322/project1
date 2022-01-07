package com.company.service;

import java.util.List;

import com.company.domain.AttachProductDTO;
import com.company.domain.MemberDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;

public interface ProductService {
	public boolean insert(ProductDTO dto);
	public List<ProductDTO> getList(ProductCriteria cri);
	public int getTotalCount(ProductCriteria cri);
	public ProductDTO getRow(int pno);
	public List<AttachProductDTO> getRowImg(int pno);
	public MemberDTO town(String userid);
	public boolean goodCount(int num,int pno);
	public List<ProductDTO> SecgetList(ProductCriteria cri, String userid);
	public int SecgetTotalCount(String cate,String userid);
}
