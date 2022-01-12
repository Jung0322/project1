package com.company.mapper;


import com.company.domain.MyPlaceGoodDTO;

public interface MyPlaceGoodMapper {
	public int insert(MyPlaceGoodDTO insertDto);
	public int updateGoodCnt(int mno);
	public int deleteGoodCnt(int mno);
	
	public String getGoodInfo(MyPlaceGoodDTO infoDto);
	public int deleteGoodInfo(MyPlaceGoodDTO deleteDto);

}
