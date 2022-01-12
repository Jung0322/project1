package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceGoodDTO;
import com.company.mapper.MyPlaceGoodMapper;

@Service
public class MyPlaceGoodServicelmpl implements MyPlaceGoodService {

	@Autowired
	private MyPlaceGoodMapper mapper;

	public boolean insert(MyPlaceGoodDTO insertDto) {
		return mapper.insert(insertDto) > 0 ? true : false;
	}
	
	@Override
	public boolean delete(MyPlaceGoodDTO deleteDto) {
		return mapper.deleteGoodInfo(deleteDto) > 0 ? true : false;
	}

	@Override
	public boolean updateGoodCnt(int mno) {
		return mapper.updateGoodCnt(mno) > 0 ? true : false;
	}

	@Override
	public boolean deleteGoodCnt(int mno) {
		return mapper.deleteGoodCnt(mno) > 0 ? true : false;
	}

	@Override
	public String getGoodInfo(MyPlaceGoodDTO infoDto) {
		return mapper.getGoodInfo(infoDto);
	}


}
