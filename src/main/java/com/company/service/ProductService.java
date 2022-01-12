package com.company.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public List<ProductDTO> SellgetList(ProductCriteria cri, String userid,int num);
	public int SellgetTotalCount(String cate,String userid, int num);
	public boolean delete(int pno);
	public boolean update(ProductDTO dto);
	public boolean attachRemove(int pno);
	public boolean resupdate(int pno, int num);
	public boolean solupdate(int num, int pno);
	public String nicknameGet(String userid);
}
