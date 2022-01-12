package com.company.service;

import com.company.domain.MyPlaceGoodDTO;

public interface MyPlaceGoodService {
	public boolean insert(MyPlaceGoodDTO insertDto);
	public boolean delete(MyPlaceGoodDTO deleteDto);
	public boolean updateGoodCnt(int mno);
	public boolean deleteGoodCnt(int mno);
	
	public String getGoodInfo(MyPlaceGoodDTO infoDto);

}
