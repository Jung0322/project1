package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.AttachProductDTO;
import com.company.domain.MemberDTO;
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

	//모든상품 정보 읽어오기
	@Override
	public List<ProductDTO> getList(ProductCriteria cri) {
		
		return mapper.listAll(cri);
	}
	
	//상품 총 개수 구하기
	@Override
	public int getTotalCount(ProductCriteria cri) {
		return mapper.totalCnt(cri);
	}

	//해당 상품 읽기
	@Override
	public ProductDTO getRow(int pno) {
		// TODO Auto-generated method stub
		return mapper.getRow(pno);
	}

	//해딩 상품 이미지 읽기
	@Override
	public List<AttachProductDTO> getRowImg(int pno) {
		// TODO Auto-generated method stub
		return AttachMapper.getRowImg(pno);
		
	}

	@Override
	public MemberDTO town(String userid) {

		return mapper.town(userid);
	}

	@Override
	public boolean goodCount(int num, int pno) {
		// TODO Auto-generated method stub
		return mapper.goodcount(num, pno)>0?true:false;
	}

	@Override
	public List<ProductDTO> SecgetList(ProductCriteria cri, String userid) {
		// TODO Auto-generated method stub
		return mapper.SeclistAll(cri, userid);
	}

	@Override
	public int SecgetTotalCount(String cate, String userid) {
		// TODO Auto-generated method stub
		return mapper.SectotalCnt(cate, userid);
	}

	@Override
	public List<ProductDTO> SellgetList(ProductCriteria cri, String userid,int num) {
		// TODO Auto-generated method stub
		return mapper.SelllistAll(cri, userid,num);
	}

	@Override
	public int SellgetTotalCount(String cate, String userid,int num) {
		// TODO Auto-generated method stub
		return mapper.SelltotalCnt(cate, userid,num);
	}

	@Transactional
	@Override
	public boolean delete(int pno) {
		// 첨부물 삭제
		AttachMapper.deleteAll(pno);
		
		return mapper.delete(pno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(ProductDTO dto) {
		// 기존 첨부파일 삭제
		AttachMapper.deleteAll(dto.getPno());
		
		//글 수정
		boolean result = mapper.update(dto)==1;
		
		//첨부물이 없다면 돌아가기
		if(dto.getAttachList() == null || dto.getAttachList().size()<=0) {
			return result;
		}
		
		//첨부파일 추가
			if(result && dto.getAttachList().size() > 0) {
				dto.getAttachList().forEach(attach ->{
					attach.setPno(dto.getPno());
					AttachMapper.insert(attach);
				});
			}
		
		
		return result;
	}

	@Override
	public boolean attachRemove(int pno) {
		// TODO Auto-generated method stub
		return AttachMapper.deleteAll(pno)>0?true:false;
	}

	@Override
	public boolean resupdate(int pno, int num) {
		// TODO Auto-generated method stub
		return mapper.resupdate(pno,num)>0?true:false;
	}

	@Override
	public boolean solupdate(int num, int pno) {
		// TODO Auto-generated method stub
		return mapper.solupdate(num, pno)>0?true:false;
	}

	@Override
	public String nicknameGet(String userid) {
		// TODO Auto-generated method stub
		return mapper.nicknameGet(userid);
	}

	

}
